#! /usr/bin/env python
import sys



def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        arr = sorted([int(x.split(",")[1]) for x in line.strip()[:-1].split("; ")])
        print ",".join([str(arr[0])] + [ str(arr[x] - arr[x-1]) for x in xrange(1, len(arr))])

    test_cases.close()

if __name__ == '__main__':
    main()
