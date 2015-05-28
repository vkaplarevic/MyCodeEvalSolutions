#! /usr/bin/env python
import sys


def bit_positions(x, p1, p2):
    mask1 = 1 << p1 - 1
    mask2 = 1 << p2 - 1
    return str(((mask1 & x) >> p1 - 1) == ((mask2 & x) >> p2 - 1)).lower()
    # bits = bin(x)
    # n = len(bits)
    # return bits[n - p1] == bits[n - p2]


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().strip().split(',')
        print(bit_positions(int(tmp[0]), int(tmp[1]), int(tmp[2])))
    test_cases.close()


if __name__ == '__main__':
    main()
