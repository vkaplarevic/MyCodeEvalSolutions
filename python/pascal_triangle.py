#! /usr/bin/env python
import sys


def pascal_triangle(power):
    if power == 0:
        return ''

    result = [1]
    index = 0

    for i in range(0, power - 1):
        result.append(1)
        for j in range(i, 2*i):
            result.append(result[index] + result[index + 1])
            index += 1
        result.append(1)
        index += 1

    return ' '.join([str(x) for x in result])


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        power = int(line.strip())
        print(pascal_triangle(power))

    test_cases.close()

if __name__ == '__main__':
    main()
