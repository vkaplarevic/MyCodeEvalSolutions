#! /usr/bin/env python
import sys



def stepwise(word):
    return " ".join( [ "*"*c +  word[c] for c in xrange(len(word)) ])


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        word = max(line.strip().split(" "), key=lambda x:len(x))
        print stepwise(word)

    test_cases.close()


if __name__ == '__main__':
    main()

