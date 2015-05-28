#! /usr/bin/env python
import sys


def contains_duplicate(array, n):
    return sum(array) - (n - 1)*(n - 2) // 2


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        print(contains_duplicate([int(x) for x in tmp[1].split(',')], int(tmp[0])))

    test_cases.close()


if __name__ == '__main__':
    main()
