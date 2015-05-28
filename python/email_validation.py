#! /usr/bin/env python
import sys
import re

PATTERN_STR = r'^"[a-z|A-Z|0-9|_|-|+|.|@]+"|[a-z|A-Z|0-9|_|-|+|.?]*@{1}[a-z|0-9]+\.{1}[a-z|0-9|-]+\.?[a-z|0-9|-]{2,}'
PATTERN = re.compile(PATTERN_STR)


def validate_email(email):
    m = PATTERN.match(email)
    if m and m.group(0) == email:
        return 'true'
    return 'false'


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(validate_email(line.strip()))

    test_cases.close()


if __name__ == '__main__':
    main()
