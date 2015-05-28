#! /usr/bin/env python
import sys


class Node(object):
    def __init__(self, value):
        self.value = value
        self.next = None


class MyList(object):
    def __init__(self):
        self.root = None

    def append(self, value):
        node = Node(value)
        if not self.root:
            self.root = node
            return

        p = self.root
        while p.next:
            p = p.next
        p.next = node

    def m_to_the_last(self, m):
        p = self.root
        q = self.root

        count = 1
        while q.next and count < m:
            q = q.next
            count += 1

        while q.next:
            p = p.next
            q = q.next

        return p.value


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        elements = line.strip().split(' ')
        m = int(elements[-1])
        elements = elements[:-1]

        if m > len(elements):
            continue

        my_list = MyList()
        for e in elements:
            my_list.append(e)

        print(my_list.m_to_the_last(m))

    test_cases.close()

if __name__ == '__main__':
    main()
