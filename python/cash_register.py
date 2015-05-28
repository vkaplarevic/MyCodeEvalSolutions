#! /usr/bin/env python
import sys

BILL_NAMES = {
    1: 'PENNY',
    5: 'NICKEL',
    10: 'DIME',
    25: 'QUARTER',
    50: 'HALF DOLLAR',
    100: 'ONE',
    200: 'TWO',
    500: 'FIVE',
    1000: 'TEN',
    2000: 'TWENTY',
    5000: 'FIFTY',
    10000: 'ONE HUNDRED'
}

BILLS = [10000, 5000, 2000, 1000, 500, 200, 100, 50, 25, 10, 5, 1]


def write_number(number):
    if number < 0:
        return 'ERROR'
    elif number == 0:
        return 'ZERO'

    result = []
    for amount in BILLS:
        if number == 0:
            break

        if amount > number:
            continue

        count = number // amount
        number = number % amount

        if count > 0:
            result.append(','.join([BILL_NAMES[amount]] * count))

        if number == 0:
            break

    return ','.join(result)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        tmp = line.strip().split(';')
        diff = int(float(tmp[1])*100) - int(float(tmp[0])*100)
        #print(write_number(int(diff)), diff, int(diff), line.strip())
        print(write_number(diff))
    test_cases.close()


if __name__ == '__main__':
    main()
