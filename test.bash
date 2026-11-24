#!/bin/bash
# SPDX-FileCopyrightText: 2026 YO-1015 <s25c1020kz@chibatech.ac.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

out=$(echo 2.5 60 20 2.5 | ./aimgpa)
[ "$?" = 0 ] || ng "$LINENO"
expected="2.50"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "2.5 60 20 3.0" | ./aimgpa)
[ "$?" = 0 ] || ng "$LINENO"
expected="4.50"
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "2.5 60 20" | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "2.5 あ 20 2.8" | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "2.5 60 0 2.8" | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "2.5 -10 20 2.8" | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "4.5 60 20 3.0" | ./aimgpa)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
