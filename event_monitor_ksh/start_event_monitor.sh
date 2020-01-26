#!/usr/bin/ksh
##############################################
##    start_event_monitor.sh
##############################################

# 第一引数：イベントモニター名

echo
echo '#================================='
echo '# start_event_monitor.sh:START'
echo '#================================='
echo

### 変数定義 ###
RET_CODE=""

### confファイル読み込み ###
echo "confファイルを読み込む"

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database

echo "db2 set event monitor $1 state 1"
db2 set event monitor $1 state 1

RET_CODE=$?

print_result $0 $RET_CODE
