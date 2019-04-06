#!/bin/bash
# sandor.balazsi@gmail.com

SCRIPT=$(basename $0)
declare -A POINT_VALUE=(
  [A]=1  [E]=1 [I]=1 [O]=1 [U]=1 [L]=1 [N]=1 [R]=1 [S]=1 [T]=1
  [D]=2  [G]=2
  [B]=3  [C]=3 [M]=3 [P]=3
  [F]=4  [H]=4 [V]=4 [W]=4 [Y]=4
  [K]=5
  [J]=8  [X]=8
  [Q]=10 [Z]=10
)

WORD="$1"
if [[ -z "${WORD}" ]]; then
  echo "usage: ${SCRIPT} <word>" >&2
  echo " e.g.: ${SCRIPT} apple" >&2
  exit 1
fi

POINTS=0
for CHAR in $(echo "${WORD}" | sed 's/\(.\)/\1\n/g'); do
  let POINTS="${POINTS} + ${POINT_VALUE[${CHAR^^}]}"
done
echo "scrabble score of \"${WORD}\": ${POINTS}"

