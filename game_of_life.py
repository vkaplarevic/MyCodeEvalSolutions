#! /usr/bin/env python
import sys


def str_life_matrix(matrix):
    s = ''
    for row in matrix:
        for c in row:
            if c:
                s += '*'
            else:
                s += '.'
        s += '\n'
    return s


def life_iteration(matrix):
    n = len(matrix)
    new_matrix = [[False] * n for _ in range(n)]

    for i in range(n):
        for j in range(n):
            ni_start = i if i - 1 < 0 else i - 1
            ni_end = i if i + 1 >= n else i + 1
            nj_start = j if j - 1 < 0 else j - 1
            nj_end = j if j + 1 >= n else j + 1
            alive_count = 0

            for ni in range(ni_start, ni_end + 1):
                for nj in range(nj_start, nj_end + 1):
                    if ni == i and nj == j:
                        continue

                    if matrix[ni][nj]:
                        alive_count += 1

            if matrix[i][j]:
                if alive_count == 2 or alive_count == 3:
                    new_matrix[i][j] = True
            else:
                if alive_count == 3:
                    new_matrix[i][j] = True

    return new_matrix


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    matrix = []
    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        matrix.append(
            [True if x == '*' else False for x in line.strip()]
        )
    test_cases.close()

    for _ in range(10):
        matrix = life_iteration(matrix)

    print(str_life_matrix(matrix))


if __name__ == '__main__':
    main()
