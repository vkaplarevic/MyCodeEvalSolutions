#! /usr/bin/env python

import sys
import math
import json
import types


def sum_up_ids(json_obj):
    result = 0
    result_ids = 0

    if isinstance(json_obj, dict):
        for key in json_obj:
            if key == "id":
                result_ids += json_obj[key]
            elif key == "label":
                result += result_ids

            if isinstance(json_obj[key], list) or isinstance(json_obj[key], dict):
                result += sum_up_ids(json_obj[key])
    elif isinstance(json_obj, list):
        for elem in json_obj:
            result += sum_up_ids(elem)

    return result


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue

        json_obj = json.loads(line.strip())
        print sum_up_ids(json_obj) 
    test_cases.close()

if __name__ == '__main__':
    main()
