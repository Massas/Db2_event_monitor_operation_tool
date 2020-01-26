#!/usr/bin/ksh
##############################################
##    create_event_monitor.sh
##############################################

# 第一引数：イベントモニター名
# 第二引数：イベントモニターのタイプ
# 第一引数：イベントモニターのアウトプット先ディレクトリ

echo
echo '#================================='
echo '# create_event_monitor.sh:START'
echo '#================================='
echo

# 変数定義 ###
RET_CODE=""

### confファイル読み込み ###
echo "confファイルを読み込む"

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database

date >> create_event_monitor.txt
echo "db2 \"create event monitor $1 for $2 write to file '$3' buffersize 50 maxfiles 100 maxfilesize 1000 append\""
db2 "create event monitor $1 for $2 write to file '$3' buffersize 50 maxfiles 100 maxfilesize 1000 append" | tee create_event_monitor.txt

# 実行結果を保存
RET_CODE=$?

print_result $0 $RET_CODE
