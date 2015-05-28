#! /usr/bin/env python
import sys


def number_at(n):
    return sum([int(x) for x in bin(n)[2:]]) % 3


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(number_at(int(line.strip())))
    test_cases.close()

if __name__ == '__main__':
    main()
