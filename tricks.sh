#!/bin/bash


function forSum() {
  max=11

  sum=0
  for((i=0; i<$max; i++)); do
    let sum+=$i

  done
  echo $sum
}

function modular() {
  for((i=0; i<10; i++)); do
    let "m3 = i % 5"
    echo $m3
    if [ "$m3" -ne 3 ]; then
      continue
    fi
    break

  done
  echo "here"

}

function slt {
  select s in {1..3}; do
    echo $s
    break
  done

}

function backup {
  cat $0 > backup.sh

}

function arrays {
  a=({1..10})
  echo ${a[@]}
  echo ${a[*]}
  echo ${#a[@]}

  b=thisisastring
  echo $b
  echo "b.length = ${#b}"


}

function append {
  declare -a a
  for ((i=2; i<7; i++)); do
    a=( "${a[@]}" $i )
  done

  unset a[2]
  for j in ${a[@]}; do
    echo $j
  done

  echo "${a[@]:1:2}"
  echo ${a[@]}
}

function recurse() {
  local depth="$1"

  if [ "$depth" -gt 0 ]; then
    result=$(recurse $((( depth - 1 ))))
    echo $((( depth + result )))
  else
    echo 0
  fi

}

function str2int() {
  echo "ibase=16; $(echo $1 | xxd -p -u)" | bc
}

function int2str() {
  echo "obase=16; $1" | bc | xxd -r -p
}

int2str $1
