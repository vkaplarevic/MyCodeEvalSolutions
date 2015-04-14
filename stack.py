#! /usr/bin/env python
import sys


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        stack = []
        if line == '\n' or line == '':
            continue
        for x in line.split(' '):
            stack.append(int(x))

        count = 0
        while stack:
            num = stack.pop()
            if count == 0:
                print(num, end=' ')
            count = (count + 1) % 2
        print()

    test_cases.close()


if __name__ == '__main__':
    main()
