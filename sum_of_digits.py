#! /usr/bin/env python
import sys


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(sum([int(x) for x in line.strip()]))


if __name__ == '__main__':
    main()
