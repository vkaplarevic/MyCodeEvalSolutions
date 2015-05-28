#! /usr/bin/env python
import sys


def bsearch(numbers, left, right, value):
    if left >= right:
        return False

    middle = (left + right - 1) // 2
    if numbers[middle] == value:
        return True
    elif value < numbers[middle]:
        return bsearch(numbers, left, middle, value)
    else:
        return bsearch(numbers, middle + 1, right, value)


def find_pairs_equal_to(numbers, value):
    length = len(numbers)
    result = []
    index = 0

    while index < length and 2 * numbers[index] < value:
        search = value - numbers[index]
        if bsearch(numbers, index, length, search):
            result.append(str(numbers[index]) + ',' + str(search))
        index += 1

    return ';'.join(result) if result else 'NULL'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        print(find_pairs_equal_to([int(x) for x in tmp[0].split(',')], int(tmp[1])))
    test_cases.close()


if __name__ == '__main__':
    main()
