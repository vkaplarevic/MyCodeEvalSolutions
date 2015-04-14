#! /usr/bin/env python
import sys


def fizzbuzz(x, y, n):
    for i in range(1, n + 1):
        if i % x == 0 and i % y != 0:
            print('F', end=' ')
        elif i % y == 0 and i % x != 0:
            print('B', end=' ')
        elif i % y == 0 and i % x == 0:
            print('FB', end=' ')
        else:
            print(i, end=' ')
    print()


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        if line[-1] == '\n':
            line = line[0:-1]

        tmp = line.split(' ')
        x = int(tmp[0])
        y = int(tmp[1])
        n = int(tmp[2])
        fizzbuzz(x, y, n)

    test_cases.close()


if __name__ == '__main__':
    main()
