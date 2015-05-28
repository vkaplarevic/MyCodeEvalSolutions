#! /usr/bin/env python
import sys


COINS = [5, 3, 1]


def minimum_coins(total):
    count = 0
    while total > 0:
        for coin in COINS:
            if total >= coin:
                total -= coin
                count += 1
                break

    return count


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(minimum_coins(int(line.strip())))

if __name__ == '__main__':
    main()
