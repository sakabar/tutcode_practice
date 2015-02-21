#!/bin/zsh

problem=$1 #問題集合のファイル
iter=$2 #出題数
kanji_log="" #出題した漢字の一覧
positive_log="" #正解した漢字の一覧
negative_log="" #不正解の漢字の一覧

BASEDIR=$(cd $(dirname $0);pwd)
log_dir=$BASEDIR"/../log"

len=`grep '"[a-z]" "[a-z]" "[a-z]"' $problem | grep -v ";;" | wc -l | grep -o "[0-9]\+"`
echo "$len個の漢字の中から出題されます。"

for i in {1..$iter}
do
  rnd=$[$RANDOM % $len + 1]
  line=`grep '"[a-z]" "[a-z]" "[a-z]"' $problem | head -n $rnd | tail -n1`
  stroke=`echo $line | grep -o '"[a-z]"' | tr -d '\n' | tr -d '"'`
  kanji=`echo $line | grep -o '"."' | grep -v "[a-z]" | tr -d '"' | nkf -w`
  kanji_log=$kanji_log$kanji

  echo $kanji
  read input
  input_utf8=`echo $input | nkf -w`
  if test $input_utf8 = $kanji; then
    echo "OK"
    positive_log=$positive_log$kanji
  else
    echo $stroke
    negative_log=$negative_log$kanji
    read str
  fi
done

echo $kanji_log >> $log_dir/kanji_log.txt
echo $positive_log >> $log_dir/positive_log.txt
echo $negative_log >> $log_dir/negative_log.txt
