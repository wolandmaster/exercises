#!/bin/bash
# sandor.balazsi@gmail.com

SCRIPT=$(basename $0)

NUM="$1"
if [[ -z "${NUM}" ]]; then
  echo "usage: ${SCRIPT} <number>" >&2
  echo " e.g.: ${SCRIPT} 42" >&2
  exit 1
fi

ITER=0
while [[ ${NUM} > 1 ]]; do
  [[ $((${NUM} % 2)) -eq 0 ]] \
  && NUM=$((${NUM} / 2)) \
  || NUM=$((${NUM} * 3 + 1))

  echo "$((++ITER)). N=${NUM}"
done
echo "total stopping time: ${ITER}"

