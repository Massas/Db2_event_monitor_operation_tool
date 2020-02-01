#!/usr/bin/ksh
##############################################
##    check_event_monitor.sh
##############################################

# 第一引数：モード
# 第に引数：イベントモニター名

### 変数定義 ###
RET_CODE=""

### confファイル読み込み ###
echo "confファイルを読み込む" > /dev/null

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database > /dev/null

# モードにより処理分岐
# check_event_monitor.shから実行される処理ブロック
if [ $1 -eq 1 ]; then
    # STATUS
    echo "db2 \"select case when event_mon_state(evmonname) = 1 then 'ON' else 'OFF' end state,substr(evmonname,1,30) as evmonname from syscat.eventmonitors\"" > /dev/null
    db2 "select case when event_mon_state(evmonname) = 1 then 'ON' else 'OFF' end state,substr(evmonname,1,30) as evmonname from syscat.eventmonitors"

elif [ $1 -eq 2 ]; then
    # TARGETDIR
    echo "db2 \"select substr(evmonname,1,30) as evmonname,substr(target,1,100) as targetdir from syscat.eventmonitors\"" > /dev/null
    db2 "select substr(evmonname,1,30) as evmonname,substr(target,1,100) as targetdir from syscat.eventmonitors"

elif [ $1 -eq 3 ]; then
    # ALL
    echo "db2 \"select case when event_mon_state(evmonname) = 1 then 'ON' else 'OFF' end state,substr(evmonname,1,30) as evmonname,target_type,substr(target,1,100) as targetdir from syscat.eventmonitors\"" > /dev/null
    db2 "select case when event_mon_state(evmonname) = 1 then 'ON' else 'OFF' end state,substr(evmonname,1,30) as evmonname,target_type,substr(target,1,100) as targetdir from syscat.eventmonitors"

# 個別のシェルスクリプトから実行される処理
elif [ $1 -eq 11 ]; then
    # イベントモニター名のみを取得する
    echo "現存するイベントモニターは以下"
    echo "======================================================================="
    db2 -x "select substr(evmonname,1,30) as evmonname from syscat.eventmonitors"
    echo "======================================================================="

elif [ $1 -eq 12 ]; then
    # イベントモニターのアウトプット先ディレクトリのみを取得する
    db2 -x "select substr(target,1,100) as targetdir from syscat.eventmonitors where evmonname='$2'" > target_dir_tmp.txt

else
    echo ""
fi

RET_CODE=$?

print_result $0 $RET_CODE
