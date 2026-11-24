#!/usr/bin/python3
#SPDX-FileCopyrightText: 2026 YO-1015 <s25c1020kz@chitatech.ac.jp>
#SPDX-Licinse-Identifier: BSD-3-Clause

import sys

tokens = sys.stdin.read().split()

if len(tokens) != 4:
    sys.stderr.write(
            "入力エラー : ４つの数値を入力する必要があります(現在のGPA、修得済単位数、今学期履修中単位数、目標GPA"
            )
    sys.exit(1)
