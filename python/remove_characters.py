#! /usr/bin/env python
import sys


def remove_characters(text, chars):
    for c in chars:
        while c in text:
            text.remove(c)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        tmp = line.strip().split(', ')
        text = list(tmp[0])
        remove_characters(text, tmp[1])
        print(''.join(text))
    test_cases.close()

if __name__ == '__main__':
    main()
