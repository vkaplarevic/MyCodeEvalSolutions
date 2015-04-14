#! /usr/bin/env python
import sys


def reverse_group(array, k):
    length = len(array)
    if k > length:
        return ','.join(array)

    result = []
    for i in range(0, length, k):
        if i + k <= length:
            result += array[i:i + k][::-1]
        else:
            result += array[i:i + k]

    return ','.join(result)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        print(reverse_group(tmp[0].split(','), int(tmp[1])))
    test_cases.close()


if __name__ == '__main__':
    main()
