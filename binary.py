#! /usr/bin/env python
import sys


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
        print(bin(int(line.strip()))[2:])

    test_cases.close()

if __name__ == '__main__':
    main()
