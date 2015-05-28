#! /usr/bin/env python
import sys
from collections import deque


def is_prime(num):
    if num % 2 == 0:
        return False

    divide = 3
    while divide < num // 2:
        if num % divide == 0:
            return False
        divide += 1

    return True


def cyclic_permutations(array):
    d = deque(array)
    res = []
    for i in range(len(array)):
        d.rotate()
        res.append(list(d))
    return res


def count_valid(permutations):
    count = 0
    for c in permutations:
        primes = True
        for i in range(1, len(c)):
            if not is_prime(c[i - 1] + c[i]):
                primes = False
                break

        # if not is_prime(c[0] + c[len(c) - 1]):
        #     primes = False

        if primes:
            count += 1

    return count


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        n = int(line.strip())
        array = [i for i in range(1, n + 1)]
        cyclics = cyclic_permutations(array)
        print(cyclics)
        print(count_valid(cyclics))

    test_cases.close()

if __name__ == '__main__':
    main()
