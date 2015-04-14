#! /usr/bin/env python
import sys


def smallest_multiple(x, n):
    multiple = 2
    while n*multiple < x:
        multiple += 1
    return n*multiple


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().strip().split(',')
        print(smallest_multiple(int(tmp[0]), int(tmp[1])))
    test_cases.close()


if __name__ == '__main__':
    main()
