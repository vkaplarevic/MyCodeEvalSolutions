#! /usr/bin/env python


def main():
    s = ''
    for i in range(1, 13):
        for j in range(1, 13):
            s += ('%4d' % (i*j))
        s += '\n'
    print(s)


if __name__ == '__main__':
    main()
