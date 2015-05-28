#! /usr/bin/env python
import sys
import re
import random


def find_cycle(start, interaction):
    queue = [start]
    set_result = set()
    checked = set()

    while True:
        if len(queue) == 0:
            break

        current = queue[0]
        del queue[0]

        set_result.add(current)
        checked.add(current)

        if current not in interaction:
            continue

        for neighbor in interaction[current]:
            if (neighbor not in checked
                    and neighbor in interaction
                    and start in interaction[neighbor]):
                queue.append(neighbor)

    result = list(set_result)
    result.sort()
    return result


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    interaction = {}
    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = re.split('    |\t', line.strip())
        user1 = tmp[1]
        user2 = tmp[2]

        if user1 not in interaction:
            interaction[user1] = set()

        interaction[user1].add(user2)
    test_cases.close()

    clusters = []
    cycle_checks = set(interaction.keys())
    while cycle_checks:
        result = find_cycle(random.sample(cycle_checks, 1)[0],
                            interaction)
        if len(result) > 2:
            clusters.append(', '.join(result))

        for checked in result:
            if checked in cycle_checks:
                cycle_checks.remove(checked)

    clusters.sort()
    print('\n'.join(clusters))

if __name__ == '__main__':
    main()
