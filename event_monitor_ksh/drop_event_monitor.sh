#!/usr/bin/ksh
##############################################
##    drop_event_monitor.sh
##############################################

# 第一引数：イベントモニター名

echo
echo '#================================='
echo '# drop_event_monitor.sh:START'
echo '#================================='
echo

### 変数定義 ###
RET_CODE=""

### confファイル読み込み ###
echo "confファイルを読み込む" > /dev/null

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database > /dev/null

echo "db2 \"drop event monitor $1\"" > /dev/null
echo "drop event monitor"
db2 "drop event monitor $1"

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
