#! /usr/bin/env python
import math


def is_prime(num):
    if num == 1:
        return False

    if num == 2:
        return True

    if num % 2 == 0:
        return False

    divide = 3
    while divide < math.sqrt(num) + 1:
        if num % divide == 0:
            return False
        divide += 1

    return True


def main():
    result = 2
    count = 1
    x = 3
    while True:
        if is_prime(x):
            result += x
            count += 1

        if count == 1000:
            break

        x += 2

    print(result)

if __name__ == '__main__':
    main()
