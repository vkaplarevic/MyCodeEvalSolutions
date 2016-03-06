#! /usr/bin/env python
import sys




# This is the main function...
def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(line.strip().lower())
    test_cases.close()


if __name__ == '__main__':
    main()
