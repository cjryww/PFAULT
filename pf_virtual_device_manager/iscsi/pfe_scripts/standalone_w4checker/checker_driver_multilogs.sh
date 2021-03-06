#!/usr/bin/env bash

absme=`readlink -f $0`
abshere=`dirname $absme`

LOGS_MAIN_DIR=$1

for directory in $LOGS_MAIN_DIR/logs-*; do
    dir_basename=${directory##*/}
    
    PFE_LOG_DIR=$directory
    TESTFILE_DIR=$PFE_LOG_DIR
    RESULT_FILE=$PFE_LOG_DIR/new_check_result.txt

    . $PFE_LOG_DIR/w4_env_conf.sh


    IO_FILE=$PFE_LOG_DIR/formatted.io.txt
    AFTER_COMMIT_FILE=$PFE_LOG_DIR/log.app-work
    BEFORE_COMMIT_FILE=$PFE_LOG_DIR/log.app-check
    IO_AND_COMMIT_FILE=$PFE_LOG_DIR/tmp.io_and_commits.txt
    IO_AND_BEFORE=$PFE_LOG_DIR/tmp.io_and_before.txt
    IO_AND_PARALLEL=$PFE_LOG_DIR/tmp.io_and_parallel.txt
    IO_AND_AFTER=$PFE_LOG_DIR/tmp.io_and_after.txt
    TXN_BOUNDS=$PFE_LOG_DIR/tmp.txn_bounds.txt

    $abshere/order_commit_and_io.py $IO_FILE $AFTER_COMMIT_FILE $BEFORE_COMMIT_FILE $IO_AND_BEFORE $IO_AND_PARALLEL $IO_AND_AFTER $TXN_BOUNDS

    for file in $TESTFILE_DIR/output*; do
        file_basename=${file##*/}
        result=$TESTFILE_DIR/newck.$file_basename
        old_result=$TESTFILE_DIR/ck.$file_basename
        :> $result 
        date >> $result
        echo -e "\n################# Start processing $file" | tee -a $result
        $abshere/check_wkld4.py $IO_AND_BEFORE $IO_AND_PARALLEL $IO_AND_AFTER $TXN_BOUNDS  $file >> $result 2>&1
        echo -e "###Done with $file_basename\n" | tee -a $result
        sudo rm -f $old_result
    done

done
