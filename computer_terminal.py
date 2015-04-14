#! /usr/bin/env python
import sys


MODE_INSERT = 1
MODE_OVERWRITE = 2


TERMINAL = [['' for _ in range(10)] for __ in range(10)]
CURSOR = [0, 0]
CURRENT_MODE = MODE_OVERWRITE


def print_at_cursor(character):
    TERMINAL[CURSOR[0]][CURSOR[1]] = character
    x = CURSOR[0]
    y = CURSOR[1]

    if CURRENT_MODE == MODE_INSERT:
        tmp = [TERMINAL[x][i] for i in range(y, 10)]
        for i in range(y + 1, 10):
            TERMINAL[x][i] = tmp[y - i]

    TERMINAL[x][y] = character
    if y < 9:
        CURSOR[1] += 1


def execute_command(command):
    global CURRENT_MODE

    if command == 'h':
        CURSOR[0] = 0
        CURSOR[1] = 0
    elif command == 'c':
        for row in TERMINAL:
            for i in range(10):
                row[i] = ' '
    elif command == 'b':
        CURSOR[1] = 0
    elif command == 'd':
        if CURSOR[0] < 9:
            CURSOR[0] += 1
    elif command == 'u':
        if CURSOR[0] > 0:
            CURSOR[0] -= 1
    elif command == 'l':
        if CURSOR[1] > 0:
            CURSOR[1] -= 1
    elif command == 'r':
        if CURSOR[1] < 9:
            CURSOR[1] += 1
    elif command == 'i':
        CURRENT_MODE = MODE_INSERT
    elif command == 'o':
        CURRENT_MODE = MODE_OVERWRITE
    elif command == '^':
        print_at_cursor('^')
    elif command == 'e':
        x = CURSOR[0]
        y = CURSOR[1]
        for i in range(y, 10):
            TERMINAL[x][i] = ''


def move_cursor(x, y):
    CURSOR[0] = x
    CURSOR[1] = y


def execute(line):
    global CURSOR
    index = 0
    length = len(line)
    while index < length:
        c = line[index]
        if c == '^':
            index += 1
            if str.isdigit(line[index]) and str.isdigit(line[index + 1]):
                move_cursor(int(line[index]), int(line[index + 1]))
                index += 1
            else:
                execute_command(line[index])
        else:
            print_at_cursor(c)

        index += 1


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        execute(line.strip())
    test_cases.close()

    print('\n'.join([''.join([c for c in row]) for row in TERMINAL]))


if __name__ == '__main__':
    main()
