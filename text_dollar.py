#! /usr/bin/env python
import sys

NUMBER_NAMES = {
    0: 'Zero',
    1: 'One',
    2: 'Two',
    3: 'Three',
    4: 'Four',
    5: 'Five',
    6: 'Six',
    7: 'Seven',
    8: 'Eight',
    9: 'Nine',
    10: 'Ten',
    11: 'Eleven',
    12: 'Twelve',
    13: 'Thirteen',
    14: 'Fourteen',
    15: 'Fifteen',
    16: 'Sixteen',
    17: 'Seventeen',
    18: 'Eighteen',
    19: 'Nineteen',
    20: 'Twenty',
    30: 'Thirty',
    40: 'Forty',
    50: 'Fifty',
    60: 'Sixty',
    70: 'Seventy',
    80: 'Eighty',
    90: 'Ninety',
    100: 'Hundred',
    1000: 'Thousand',
    1000000: 'Million',
    1000000000: 'Billion',
}

TENS = {30, 40, 50, 60, 70, 80, 90}
DIVS = [1000000000, 1000000, 1000, 100, 10, 1]
ADD_ON_SET = {1000000000, 1000000, 1000, 100}


def get_number_name(arg_number, add_one=True):
    if arg_number in NUMBER_NAMES:
        one = ''
        if arg_number in ADD_ON_SET and add_one:
            one = 'One'
        return one + NUMBER_NAMES[arg_number]

    number = arg_number
    string = ''
    for div in DIVS:
        if number < div:
            continue

        count = number // div
        if number in NUMBER_NAMES:
            string += get_number_name(number)
            number = 0
        else:
            if count * div in NUMBER_NAMES:
                string += get_number_name(count * div)
            else:
                string += get_number_name(count) + get_number_name(div, False)
        number %= div

    return string


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        if line[0] == '#':
            continue
        print(get_number_name(int(line.strip())) + 'Dollars')
    test_cases.close()

if __name__ == '__main__':
    main()
