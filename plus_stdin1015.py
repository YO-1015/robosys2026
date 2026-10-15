#!/usr/bin/python3
import sys

x = 0.0
for line in sys.stdin:
    try:
        x += float(line)
    except ValueError:
        x += float(line)

print(x)
