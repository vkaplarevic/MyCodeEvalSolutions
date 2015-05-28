#! /usr/bin/env python
import sys


def sieve(end):
    a = [True for _ in range(2, end)]
    for i in range(2, end):
        for j in range(i*i, end, i):
            a[j - 2] = False
    return [x for x in range(2, end) if a[x - 2] is True]


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    # Generate all prime number using Sieve of Eratosthenes algorithm...
    primes = sieve(10000)

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        n = int(line.strip())
        print(','.join([str(x) for x in primes if x < n]))
    test_cases.close()


if __name__ == '__main__':
    main()
