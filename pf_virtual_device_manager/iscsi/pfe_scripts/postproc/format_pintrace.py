#!/usr/bin/env python
import sys
import re
import operator

def lines2lists(f):
    """input a file,
       convert each line to a list,
       output a list of lists"""

    ret_lines = [] 
    seperator = re.compile(r',| +|\n|\t|=+|!|#|\[|\]|\(|\)|\<|\>|\|\:| ')
    lines = f.readlines()

    for line in lines:
        line_splitted = seperator.split(line)
        line_filtered = filter(None, line_splitted)
        ret_lines.append(line_filtered)

    return ret_lines


def get_usefullines(linelists):
    """input a list of lines (lists),
       keep useful syscall lines and data lines , 
       output a list of lines (lists)"""

    useful_lines = [] 

    for line in linelists:
        #append all syscalls
        if len(line) >= 5 and line[0] != ".plt":
            #if line[4] != 'libc.so.6' and line[4] != : 
            useful_lines.append(line)

    return useful_lines


if __name__ == "__main__":
    for fn in sys.argv[1:]:
        f = open(fn)
        usefullines = lines2lists(f)
        usefullines = get_usefullines(usefullines)
        for line in usefullines:
            line_str = ' '.join(line)
            print line_str
        