#! /usr/bin/env python
import sys


def permutations(string, result):
    if len(string) == 1:
        result.append(string)
        return
    elif len(string) == 2:
        result.append(string)
        result.append(string[1] + string[0])
        return

    size = len(string)
    for i in range(size):
        c = string[i]
        temp = []
        permutations(string[0:i] + string[i+1:size], temp)
        for smaller in temp:
            result.append(c + smaller)


def create_of_length(length, chars, result):
    if len(chars) == 2:
        for i in range(0, length + 1):
            result.add(chars[0]*i + chars[1]*(length - i))
        return

    for i in range(0, length + 1):
        tmp_res = set()
        create_of_length(length - i, chars[1:], tmp_res)
        for tmp in tmp_res:
            result.add(chars[0]*i + tmp)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(',')
        length = int(tmp[0])
        chars = tmp[1]
        result = set()
        create_of_length(length, chars, result)

        res = set()
        for tmp_chars in result:
            tmp_res = []
            permutations(tmp_chars, tmp_res)
            for x in tmp_res:
                res.add(x)

        res_list = list(res)
        res_list.sort()
        print(','.join(res_list))

    test_cases.close()

if __name__ == '__main__':
    main()
