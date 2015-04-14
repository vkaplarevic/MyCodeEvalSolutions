#! /usr/bin/env python
import sys
import math


def dist(p1, p2):
    return math.sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)


def closest_pair(points, left, right):
    count = right - left
    if count == 0:
        return float("inf")

    if count == 1:
        return dist(points[left], points[right])
    elif count == 2:
        return min(min(dist(points[left], points[right]),
                       dist(points[left + 1], points[right])),
                   dist(points[left], points[left + 1]))

    middle = right - count // 2 - 1
    dl = closest_pair(points, left, middle)
    dr = closest_pair(points, middle + 1, right)

    d = min(dl, dr)
    dlr = float("inf")
    strip = (points[middle][0] + points[middle + 1][0]) / 2

    for il in range(left, middle + 1):
        if abs(strip - points[il][0]) >= d:
            continue

        for ir in range(middle + 1, right + 1):
            if abs(points[ir][0] - strip) >= d:
                continue

            candidate = dist(points[il], points[ir])
            if candidate < dlr:
                dlr = candidate

    return min(d, dlr)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    points = None
    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        temp = line.strip().split(' ')
        if len(temp) == 1:
            if points is not None:
                points.sort(key=lambda p: p[0])
                print("%.4f" % closest_pair(points, 0, len(points) - 1))

            points = []
            points_count = int(temp[0])
            if points_count == 0:
                break
        else:
            points.append((float(temp[0]), float(temp[1])))

    test_cases.close()

if __name__ == '__main__':
    main()
