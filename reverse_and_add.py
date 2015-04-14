#! /usr/bin/env python
import sys


def reverse_and_add(number):
    count = 0
    while number[::-1] != number:
        number = str(int(number) + int(number[::-1]))
        count += 1

    return str(count) + ' ' + number


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        print(reverse_and_add(line.strip()))

    test_cases.close()

if __name__ == '__main__':
    main()
