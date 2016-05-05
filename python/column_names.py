#! /usr/bin/env python
import sys


def convert(number):
    d = 1;
    result = []
    while number > 0:
        d = number % 26
        number = number // 26 if d > 0 else (number // 26) - 1 
        result = [ chr(ord('A') + d - 1) if d > 0 else 'Z' ] + result

    return ''.join(result)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return


    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        line.strip()
        if line == '':
            continue

        print(convert(int(line)))

    test_cases.close()


if __name__ == '__main__':
    main()

