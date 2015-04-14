#! /usr/bin/env python
import sys


def contains_trailing(text, tail):
    index_text = len(text) - 1
    index_tail = len(tail) - 1

    if index_tail > index_text:
        return 0

    while index_tail >= 0:
        if text[index_text] == tail[index_tail]:
            index_text -= 1
            index_tail -= 1
        else:
            return 0

    return 1


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        tmp = line.strip().split(',')
        print(contains_trailing(tmp[0], tmp[1]))
    test_cases.close()

if __name__ == '__main__':
    main()
