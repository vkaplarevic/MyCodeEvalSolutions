#! /usr/bin/env python
import sys


def jolly_jumper(array, count):
    jolly_set = set([x for x in range(1, count)])
    for i in range(1, count):
        dist = abs(array[i - 1] - array[i])
        if dist not in jolly_set:
            return 'Not jolly'
        jolly_set.remove(dist)

    return 'Jolly'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        tmp = line.strip().split(' ')
        count = int(tmp[0])
        if len(tmp) != count + 1:
            print('Wrong input format!')
            break

        array = [int(tmp[i]) for i in range(1, count + 1)]
        print(jolly_jumper(array, count))


    test_cases.close()

if __name__ == '__main__':
    main()
