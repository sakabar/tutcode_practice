# tutcode_practice

TUT-Codeの練習アプリです。  

使い方  
`./script/tutcode_practice.sh problem.txt 5`  
第一引数は問題が含まれたファイル、第二引数は出題数です。サンプルとして、problemというファイルが同梱されています。  
現在の仕様では、3ストロークの漢字のみが出題されます。  
出題された漢字がkanji_log.txtに、正解した漢字がpositive_log.txtに、不正解の漢字がnegative_log.txtに追記されます。  

TODO  
`$iter`がproblemの行数よりも多かった時の挙動  
3打鍵以外にも対応?  
