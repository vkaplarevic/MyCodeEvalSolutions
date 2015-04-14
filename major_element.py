#! /usr/bin/env python
import sys


def find_major(array):
    hist = {}
    for x in array:
        try:
            hist[x] += 1
        except KeyError:
            hist[x] = 1

    length = len(array)
    for x in hist:
        if hist[x] > length // 2:
            return x

    return 'None'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(find_major([int(x) for x in line.strip().split(',')]))



    test_cases.close()

if __name__ == '__main__':
    main()
