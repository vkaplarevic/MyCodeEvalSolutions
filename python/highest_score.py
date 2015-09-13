#! /usr/bin/env python
import sys
import math





def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        table = [ [int(x) for x in row.split(" ")] for row in line.strip().split(" | ") ]
        r_table = [ [table[j][i] for j in xrange(len(table))] for i in xrange(len(table[0])) ]
        result = []

        for row in r_table:
            result.append(str(max(row)))

        print " ".join(result)

    test_cases.close()

if __name__ == '__main__':
    main()
