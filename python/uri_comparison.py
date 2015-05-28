#! /usr/bin/env python
import sys
import re


def uri_compare(uri1, uri2):
    print('>>>', re.split('/{1}', uri1.strip()))
    print('>>>', re.split('/{1}', uri2.strip()))

    #print(uri1, uri2)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        print(uri_compare(tmp[0], tmp[1]))
    test_cases.close()


if __name__ == '__main__':
    main()
