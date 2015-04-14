#! /usr/bin/env python
import sys

print('LittleEndian' if sys.byteorder == 'little' else 'BigEndian')