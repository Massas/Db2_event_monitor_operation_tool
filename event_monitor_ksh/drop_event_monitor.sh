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
echo "confファイルを読み込む"

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database

echo "db2 \"drop event monitor $1\""
db2 "drop event monitor $1"

RET_CODE=$?

print_result $0 $RET_CODE

if [ $RET_CODE -eq 0 ]
then
    echo "db2 commit"
    db2 commit
else
    echo "db2 rollback"
    db2 rollback
fi