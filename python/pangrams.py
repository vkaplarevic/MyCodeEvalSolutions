#! /usr/bin/env python
import sys


def missing_letters(text):
    alphabet_set = set()
    for x in range(ord('a'), ord('z') + 1):
        alphabet_set.add(chr(x))

    alphabet_set -= set([c.lower() for c in text])
    result = list(alphabet_set)
    result.sort()
    return 'NULL' if not result else ''.join(result)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(missing_letters(line.strip()))

    test_cases.close()

if __name__ == '__main__':
    main()
