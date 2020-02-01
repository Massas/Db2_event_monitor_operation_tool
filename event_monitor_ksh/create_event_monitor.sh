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
. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database > /dev/null

echo "db2 \"create event monitor $1 for $2 write to file '$3' buffersize 50 maxfiles 100 maxfilesize 1000 append\"" > /dev/null
echo "create event monitor"
db2 "create event monitor $1 for $2 write to file '$3' buffersize 50 maxfiles 100 maxfilesize 1000 append"

# 実行結果を保存
RET_CODE=$?

if [ $RET_CODE -eq 0 ]
then
    echo ""
    echo "commitを発行する"
    db2 commit
    echo ""
else
    echo ""
    echo "rollbackする"
    db2 rollback
    echo ""
fi

print_result $0 $RET_CODE
