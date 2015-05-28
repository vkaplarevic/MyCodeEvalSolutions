#! /usr/bin/env python
import sys


def count_one_buts(number):
    mask = 1
    limit = 1 << 32
    count = 0

    while mask < limit:
        if mask & number:
            count += 1
        mask <<= 1

    return count


def main():
    """
    Feels like cheating...
    In my defense, I am little bit tired to write this...
    :return:
    """
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        print(count_one_buts(int(line.strip())))

    test_cases.close()

if __name__ == '__main__':
    main()
