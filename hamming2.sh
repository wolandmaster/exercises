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

DIFF=""; DISTANCE=0
for ((POS = 0; POS < ${#STR1}; POS++)); do
  if [[ "${STR1:${POS}:1}" != "${STR2:${POS}:1}" ]]; then
    DIFF="${DIFF}^"
    ((DISTANCE++))
  else
    DIFF="${DIFF} "
  fi
done

echo "${STR1}"
echo "${STR2}"
echo "${DIFF} = ${DISTANCE}"

