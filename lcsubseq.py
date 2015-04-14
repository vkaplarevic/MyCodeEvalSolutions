#! /usr/bin/env python
import sys


cached_subsequences = {}


def subsequence_of_size_k(string, start, k, result):
    cached = cached_subsequences[string]
    if start not in cached:
        cached[start] = {}
    else:
        if k in cached[start]:
            for ss in cached[start][k]:
                result.add(ss)
            return

    size = len(string)
    if k == 1:
        for x in range(start, size):
            result.add(string[x])
        return

    for i in range(start, size - k + 1):
        tmp_res = set()
        subsequence_of_size_k(string, i + 1, k - 1, tmp_res)
        for ss in tmp_res:
            result.add(string[i] + ss)

    cached[start][k] = result


def is_subequence_of(sequence, string):
    sequence_index = 0
    sequence_size = len(sequence)

    for string_index in range(0, len(string)):
        if string[string_index] == sequence[sequence_index]:
            sequence_index += 1

        if sequence_index == sequence_size:
            return True

    return sequence_index == sequence_size


def longest_subsequence(str1, str2):
    size1 = len(str1)
    size2 = len(str2)
    limit = min(size1, size2)

    for k in range(limit, 0, -1):
        res1 = set()
        subsequence_of_size_k(str1, 0, k, res1)

        for sseq in res1:
            if is_subequence_of(sseq, str2):
                return sseq

    return None


    # for k in range(size1, 0, -1):
    #     result = []
    #     if k == size1:
    #         result.append(str1)
    #     else:
    #         subsequence_of_size_k(str1, 0, k, result)
    #
    #     #print(result)
    #     for sequence in result:
    #         # print('Checking:', sequence, 'for string:', str2)
    #         if is_subequence_of(sequence, str2):
    #             return sequence

    return None


def main():
    # str = 'test'
    # for k in range(len(str), 0, -1):
    #     result = []
    #     subsequence_of_size_k(str, 0, k, result)
    #     print(result)
    #print(is_subequence_of('MJAU', 'MZJAWXU'))
    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n':
            continue

        if line[-1] == -1:
            line = line[0:-1]

        tmp = line.split(';')

        ### We are going to store previously calculated values...
        cached_subsequences[tmp[0]] = {}
        cached_subsequences[tmp[1]] = {}
        print(longest_subsequence(tmp[0], tmp[1]))
        break

    test_cases.close()


if __name__ == '__main__':
    main()