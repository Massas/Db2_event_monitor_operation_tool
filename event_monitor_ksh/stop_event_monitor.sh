#!/usr/bin/ksh
##############################################
##    stop_event_monitor.sh
##############################################

# 第一引数：イベントモニター名

echo
echo '#================================='
echo '# stop_event_monitor.sh:START'
echo '#================================='
echo

### 変数定義 ###
RET_CODE=""

### confファイル読み込み ###
echo "confファイルを読み込む"

. ./Db2_operate_event_monitor.conf > /dev/null

print_fundamental_information

connect_to_database > /dev/null

echo "db2 set event monitor $1 state 0"
db2 set event monitor $1 state 0

RET_CODE=$?

print_result $0 $RET_CODE
