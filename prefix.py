#! /usr/bin/env python
import sys


def evaluate(tokens):
    operations = []     # Queue...
    numbers = []        # Stack...

    for token in tokens:
        if token == '*' or token == '/' or token == '+':
            operations.insert(0, token)
        else:
            numbers.insert(0, int(token))

    while operations and numbers:
        op = operations.pop(0)
        e1 = numbers.pop()
        e2 = numbers.pop()

        if op == '*':
            numbers.append(e1 * e2)
        elif op == '/':
            numbers.append(e1 / e2)
        elif op == '+':
            numbers.append(e1 + e2)

    return int(numbers.pop())


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        print(evaluate(line.split(' ')))
    test_cases.close()

if __name__ == '__main__':
    main()
