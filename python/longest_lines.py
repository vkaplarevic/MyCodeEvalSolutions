#! /usr/bin/env python

import sys


def __add_to_heap(heap, line):
    if line[-1] == '\n':
        heap.append(line[0:-1])
    else:
        heap.append(line)

    index = len(heap) - 1
    while True:
        if index == 0:
            return

        parent_index = index // 2
        if len(heap[parent_index]) > len(heap[index]):
            return
        else:
            heap[parent_index], heap[index] = heap[index], heap[parent_index]
            index = parent_index


def heap_solution():
    heap = []
    test_cases = open(sys.argv[1], 'r')
    k = int(test_cases.readline()[0:-1])
    for line in test_cases:
        __add_to_heap(heap, line)

    heap.sort(reverse=True, key=lambda x: len(x))
    for i in range(k):
        print(heap[i])


if __name__ == '__main__':
    heap_solution()
