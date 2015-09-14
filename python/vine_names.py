#! /usr/bin/env python
import sys


def find_vine(vines, letters):
    wSet = {word: list(word) for word in vines}
    result = []

    for vine in vines:
        to_add = True
        for letter in letters:
            if letter not in wSet[vine]:
                to_add = False
            else:
                index = wSet[vine].index(letter)
                del wSet[vine][index]

        if to_add:
            result.append(vine)

    return result


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(" | ")
        vines = tmp[0].split(" ")
        letters = list(tmp[1])

        results = find_vine(vines, letters)
        if len(results) == 0:
            print "False"
        else:
            print " ".join(results)

    test_cases.close()

if __name__ == '__main__':
    main()

