#!/bin/bash
# sandor.balazsi@gmail.com

SCRIPT=$(basename $0)

STR1="$1"; STR2="$2"
if [[ -z "${STR1}" ]] || [[ -z "${STR2}" ]]; then
  echo "usage: ${SCRIPT} <string 1> <string 2>" >&2
  echo " e.g.: ${SCRIPT} ABCDE ABBDF" >&2
  exit 1
fi

if [[ ${#STR1} != ${#STR2} ]]; then
  echo "The two strings must be the same length!" >&2
  exit 1
fi

# cmp -bl <(echo "${STR1}") <(echo "${STR2}") | wc -l

cmp -bl <(echo "${STR1}") <(echo "${STR2}") \
| awk '{ printf("pos %d: %s -> %s\n", $1, $3, $5) }
   END { printf("hamming distance: %s\n", NR)}'

