#! /usr/bin/env python
import sys
import math


class Matrix(object):
    def __init__(self, array):
        self.array = array;
        self.size = int(math.sqrt(len(array)))

    def get(self, i, j):
        return self.array[i * self.size + j]

    def put(self, i, j, value):
        self.array[i * self.size + j] = value

    def transpose(self):
        size = self.size
        for i in range(size):
            for j in range(i + 1, size):
                elem1 = self.get(i, j)
                elem2 = self.get(j, i)
                self.put(i, j, elem2)
                self.put(j, i, elem1)

    def reverse_row_order(self):
        size = self.size
        for i in range(0, size * size, size):
            cp = self.array[i:i+size]
            cp.reverse()
            for j in range(i, i + size):
                self.array[j] = cp[j - i]

    def __str__(self):
        size = self.size
        res = "";
        for i in range(size):
            for j in range(size):
                res += str(self.get(i, j)) + " "
            res += '\n'
        return res


def rotate(matrix):
    matrix.transpose()
    matrix.reverse_row_order()
    return matrix

def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        matrix = Matrix(line.strip().split(' '))
        print " ".join(rotate(matrix).array)

    test_cases.close()

if __name__ == '__main__':
    main()
