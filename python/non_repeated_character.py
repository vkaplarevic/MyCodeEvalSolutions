#! /usr/bin/env python
import sys


def non_repeated_character(string):
    index = 0
    length = len(string)
    while index < length:
        unique = True
        for i in range(0, index):
            if string[i] == string[index]:
                unique = False
                break

        if not unique:
            index += 1
            continue

        for i in range(index + 1, length):
            if string[i] == string[index]:
                unique = False
                break

        if unique:
            return string[index]
        index += 1

    return None


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(non_repeated_character(line.strip()))
    test_cases.close()

if __name__ == '__main__':
    main()
