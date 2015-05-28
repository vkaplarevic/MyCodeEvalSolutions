#! /usr/bin/env python
import sys


def is_rotation(word1, word2):
    if len(word1) != len(word2):
        return 'False'

    for i in range(len(word1)):
        tmp = word1[i:] + word1[:i]
        if word2 == tmp:
            return 'True'

    return 'False'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(',')
        print(is_rotation(tmp[0], tmp[1]))
    test_cases.close()


if __name__ == '__main__':
    main()
