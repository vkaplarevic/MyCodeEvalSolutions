#! /usr/bin/env python
import sys
import math

def find_minimum_distance(houses):
    start = min(houses)
    end     = max(houses)

    result = float("inf");

    for t_house in xrange(start, end):
        total = sum([ abs(t_house - h) for h in houses])
        if total < result:
            result = total

    return result


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        houses = [int(x) for x in line.strip().split(" ")[1:]]
        print find_minimum_distance(houses)

    test_cases.close()

if __name__ == '__main__':
    main()
