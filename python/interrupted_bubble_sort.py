#! /usr/bin/env python
import sys


def bubble_sort_iteration(array, iteration):
    size = len(array)
    for i in range(size):
        for j in range(1, size - i):
            if array[j - 1] > array[j]:
                array[j - 1], array[j] = array[j], array[j - 1]

        if i == iteration - 1:
            return


def main():
    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        tmp = line.split(' | ')
        iteration = int(tmp[1])
        array = [int(x) for x in tmp[0].split(' ')]
        bubble_sort_iteration(array, iteration)
        print(' '.join([str(x) for x in array]))
    test_cases.close()


if __name__ == '__main__':
    main()

