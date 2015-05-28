#! /usr/bin/env python
import sys


class Node(object):
    """
    Node implementation for the tree.
    """
    def __init__(self, value):
        """
        :param value:
        :return:
        """
        self.value = value
        self.left = None
        self.right = None

    def __eq__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return other.value == self.value

    def __ne__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return other.value != self.value

    def __gt__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return self.value > other.value

    def __ge__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return self.value > other.value

    def __lt__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return self.value < other.value

    def __le__(self, other):
        if type(other) is not Node:
            raise TypeError()
        return self.value <= other.value

    def __str__(self):
        return str(self.value)

    def __repr__(self):
        return str(self.value)


class Tree(object):
    """
    Tree class and implementation.
    """
    def __init__(self):
        self.root = None
        self.count = 0

    @staticmethod
    def __append(parent, node):
        """
        :param parent:
        :param node:
        :return:
        """
        if parent is None:
            return node

        if node < parent:
            parent.left = Tree.__append(parent.left, node)
        else:
            parent.right = Tree.__append(parent.right, node)

        return parent

    def append(self, value):
        """
        :param value:
        :return:
        """
        if self.root is None:
            self.root = Node(value)
        else:
            self.root = Tree.__append(self.root, Node(value))

        self.count += 1

    @staticmethod
    def __common_ancestor(root, n1, n2):
        if n1 < root and n2 < root:
            return Tree.__common_ancestor(root.left, n1, n2)
        elif n1 >= root and n2 >= root:
            return Tree.__common_ancestor(root.right, n1, n2)
        else:
            return root.value

    @staticmethod
    def __find_node(root, value):
        if root is None:
            return None

        if root.value == value:
            return root

        if value < root.value:
            return Tree.__find_node(root.left, value)
        elif value > root.value:
            return Tree.__find_node(root.right, value)

    def common_ancestor(self, val1, val2):
        n1 = Tree.__find_node(self.root, val1)
        if n1 is None:
            return None

        n2 = Tree.__find_node(self.root, val2)
        if n2 is None:
            return None

        return Tree.__common_ancestor(self.root, n1, n2)


def main():
    if len(sys.argv) != 2:
        print('Please provide path to test cases!')
        return

    tree = Tree()
    tree.append(30)
    tree.append(8)
    tree.append(52)
    tree.append(3)
    tree.append(20)
    tree.append(10)
    tree.append(29)

    test_cases = open(sys.argv[1], 'r')
    for line in test_cases:
        if line == '\n' or line == '':
            continue
        tmp = line.strip().split(' ')
        print(tree.common_ancestor(int(tmp[0]), int(tmp[1])))
    test_cases.close()

if __name__ == '__main__':
    main()
