#! /usr/bin/env python
import sys


def permutations(string, result):
    if len(string) == 1:
        result.append(string)
        return
    elif len(string) == 2:
        result.append(string)
        result.append(string[1] + string[0])
        return

    size = len(string)
    for i in range(size):
        c = string[i]
        temp = []
        permutations(string[0:i] + string[i+1:size], temp)
        for smaller in temp:
            result.append(c + smaller)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        result = []
        permutations(line.strip(), result)
        result.sort()
        print(','.join(result))

    test_cases.close()


if __name__ == '__main__':
    main()

