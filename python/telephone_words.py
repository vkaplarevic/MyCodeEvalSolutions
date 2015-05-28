#! /usr/bin/env python
import sys


DIGITS = {
    '0': ['0'],
    '1': ['1'],
    '2': ['a', 'b', 'c'],
    '3': ['d', 'e', 'f'],
    '4': ['g', 'h', 'i'],
    '5': ['j', 'k', 'l'],
    '6': ['m', 'n', 'o'],
    '7': ['p', 'q', 'r', 's'],
    '8': ['t', 'u', 'v'],
    '9': ['w', 'x', 'y', 'z']
}


def combinations(ca, index, length):
    if index == length - 1:
        return ca[index]

    values = ca[index]
    result = []
    for value in values:
        tmp_result = combinations(ca, index + 1, length)
        for tmp in tmp_result:
            result.append(value + tmp)

    return result


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        striped = line.strip()
        res = combinations([DIGITS[x] for x in striped], 0, len(striped))
        print(','.join(res))
    test_cases.close()


if __name__ == '__main__':
    main()
