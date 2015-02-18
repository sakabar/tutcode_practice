#!/bin/zsh

problem=$1
iter=$2
len=`grep '"[a-z]" "[a-z]" "[a-z]"' $problem | grep -v ";;" | wc -l | grep -o "[0-9]\+"`
echo "$len個の漢字の中から出題されます。"

for i in {1..$iter}
do
  rnd=$[$RANDOM % $len + 1]
  line=`grep '"[a-z]" "[a-z]" "[a-z]"' $problem | head -n $rnd | tail -n1`
  stroke=`echo $line | grep -o '"[a-z]"' | tr -d '\n' | tr -d '"'`
  kanji=`echo $line | grep -o '"."' | grep -v "[a-z]" | tr -d '"' | nkf -w`

  echo $kanji
  read input
  input_utf8=`echo $input | nkf -w`
  if test $input_utf8 = $kanji; then
    echo "OK"
  else
    echo $stroke
    read str
  fi
done
