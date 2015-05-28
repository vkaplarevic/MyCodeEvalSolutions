#! /usr/bin/env python
import sys


### TODO: Implement this as recursive function...

def substitute(string, subs):
    if len(subs) == 0:
        # print('DONE')
        return string

    pair = subs[0]
    if len(pair[0]) > len(string):
        return substitute(string, subs[1:])
    try:
        #del subs[0]
        index = string.index(pair[0])

        # print('Replacing:', pair[0], 'with:', pair[1], subs)
        # print('LEFT :', string[0:index])
        # print('RIGHT:', string[index + len(pair[0]):])

        tmp = (
            substitute(string[0:index], subs[1:])
            + pair[1]
            + substitute(string[index + len(pair[0]):], subs[1:])
        )
        return tmp
    except ValueError:
        # print('Nope:', string, subs)
        # print()
        return substitute(string, subs[1:])


def substitution_iter(string, substitutions):
    available = [True] * len(string)
    for pair in substitutions:
        try:
            old_len = len(pair[0])
            new_len = len(pair[1])
            index = string.index(pair[0], 0)
            check = [True]*new_len

            while available[index: index + new_len] != check:
                index = string.index(pair[0], index + new_len)

            string = string[0:index] + pair[1] + string[index + old_len:]
            available = available[0:index] + [False] * new_len + available[index + old_len:]
        except ValueError:
            pass

    return string


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        string = tmp[0]
        tmp = tmp[1].split(',')

        substitutions = []
        for i in range(0, len(tmp), 2):
            substitutions.append((tmp[i], tmp[i + 1]))

        print(substitution_iter(string, substitutions))
        #print(substitute(string, substitutions))
        # print('Substitution for:', string)
        # print('RESULT(old)', do_substitution(string, substitutions))
        # print('RESULT(new)', substitute(string, substitutions))

    test_cases.close()


if __name__ == '__main__':
    main()
