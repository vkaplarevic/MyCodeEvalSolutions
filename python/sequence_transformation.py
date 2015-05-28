#! /usr/bin/env python
import sys


def find_transformation(source, target):
    source_list = list(source)
    count = len(source_list)
    print(source_list)




def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        temp = line.strip().split(' ')
        find_transformation(temp[0], temp[1])



    test_cases.close()

if __name__ == '__main__':
    main()
