#!/usr/bin/ksh
##############################################
##    format_event_monitor.sh
##############################################

### 変数定義 ###
RET_CODE=""
NAME=""
HOME_DIR=`pwd`
TARGET_DIR=""

### confファイル読み込み ###
echo "confファイルを読み込む\n"

. ./Db2_operate_event_monitor.conf

print_fundamental_information

connect_to_database

# イベントモニター名を一覧表示する
./check_event_monitor.sh 'A'

echo ""
echo "アウトプットを削除したいイベントモニターの名前を指定してください\n"
read NAME
echo "入力した値： $NAME\n"
echo ""

# アウトプット先ディレクトリを取得する
./check_event_monitor.sh 'B' $NAME

TARGET_DIR=`cat target_dir_tmp.txt`
echo "アウトプット先ディレクトリ：$TARGET_DIR\n"

cd $TARGET_DIR

echo "イベントモニター$NAMEのフォーマット\n"
echo "db2evmon -db DBNAME -evm $NAME > $NAME.fmt\n"
db2evmon -db DBNAME -evm $NAME > $NAME.fmt

RET_CODE=$?
print_result $0 $RET_CODE

cd $HOME_DIR
rm -f target_dir_tmp.txt
