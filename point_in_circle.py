#! /usr/bin/env python
import sys
import re


def inside_circle(center, radius, point):
    res = (center[0] - point[0])**2 + (center[1] - point[1])**2 < radius**2
    return 'true' if res else 'false'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        line = line.strip()
        tmp = [float(x) for x in (re.split("Center: \(|\); Radius: |, |; Point: \(|\)", line)[1:-1])]
        center = (tmp[0], tmp[1])
        radius = tmp[2]
        point = (tmp[3], tmp[4])
        print(inside_circle(center, radius, point))

    test_cases.close()

if __name__ == '__main__':
    main()
