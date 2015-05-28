#! /usr/bin/env python

def is_prime(num):
    if num % 2 == 0:
        return False

    divide = 3
    while divide < num // 2:
        if num % divide == 0:
            return False
        divide += 1

    return True


def main():
    num = 1000
    while num > 0:
        str_num = str(num)
        if is_prime(num) and str_num[::-1] == str_num:
            break
        num -= 1
    print(num)


if __name__ == '__main__':
    main()
