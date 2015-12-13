#! /usr/bin/env python
import sys

BOARD = [
    list("ABCE"),
    list("SFCS"),
    list("ADEE")
]

INDEXES = {}

def create_indexes():
    for i in range(0, len(BOARD)):
        for j in range(0, len(BOARD[0])):
            letter = BOARD[i][j]
            if letter not in INDEXES:
                INDEXES[letter] = []
            INDEXES[letter].append((i,j))

def neighbours(p):
    result = []
    if p[0] - 1 >= 0:
        result.append((p[0] - 1, p[1]))
    if p[0] + 1 < len(BOARD):
        result.append((p[0] + 1, p[1]))
    if p[1] - 1 >= 0:
        result.append((p[0], p[1] - 1))
    if p[1] + 1 < len(BOARD[0]):
        result.append((p[0], p[1] + 1))
    return result


def contains_path(word, recreated, original, checked, defined_pos=None):
    if word == "":
        return recreated == original

    c = word[0]
    left = word[1:]
    positions = None

    if defined_pos is None:
        # This will be executed only the first time 
        # every next time we are going to have 
        # the position of the current first letter!
        positions = [p for p in INDEXES[c] if p not in checked]
    else:
        positions = [defined_pos]
    
    result = False
    for p in positions:
        if left != "":
            tmp = neighbours(p)
            ns = [n for n in tmp if n not in checked and left[0] == BOARD[n[0]][n[1]] ]
            for n in ns:
                cchecked = set(checked)
                cchecked.add(p)
                result = result or contains_path(left, recreated[:] + c , original, cchecked, n)
        else:
            result = result or contains_path("", recreated[:] + c, original, checked)

    return result



def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    create_indexes()

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases: 
        line = line.strip()
        if line == '':
            continue
        print(str(contains_path(line, "", line, set())))


if __name__ == '__main__':
    main()


