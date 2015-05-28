#! /usr/bin/env python
import sys


def multiply(list1, list2):
    if len(list1) != len(list2):
        return

    res = []
    for i in range(len(list1)):
        res.append(list1[i] * list2[i])

    return ' '.join([str(x) for x in res])


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(" | ")
        list1 = [int(x) for x in tmp[0].split(' ')]
        list2 = [int(x) for x in tmp[1].split(' ')]
        print(multiply(list1, list2))

if __name__ == '__main__':
    main()
