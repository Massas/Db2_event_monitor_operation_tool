#!/usr/bin/ksh
##############################################
##    format_event_monitor.sh
##############################################

### 変数定義 ###
RET_CODE=""
NAME=""
HOME_DIR=`pwd`
TARGET_DIR=""

echo
echo '#================================='
echo '# format_event_monitor.sh:START'
echo '#================================='
echo

### confファイル読み込み ###
echo "confファイルを読み込む"

. ./Db2_operate_event_monitor.conf

echo "言語を日本語(Ja_JP)に設定する"
export LANG=Ja_JP

print_fundamental_information

connect_to_database

# イベントモニター名を一覧表示する
./check_event_monitor.sh 11 

echo ""
echo "フォーマットしたいイベントモニターの名前を指定してください"
read NAME
echo "入力した値： $NAME"
echo ""

# アウトプット先ディレクトリを取得する
./check_event_monitor.sh 12 $NAME

TARGET_DIR=`cat target_dir_tmp.txt`
echo "アウトプット先ディレクトリ：$TARGET_DIR"

cd $TARGET_DIR

echo "イベントモニター$NAMEのフォーマットを行う"
echo "db2evmon -db DBNAME -evm $NAME > $NAME.fmt"
db2evmon -db DBNAME -evm $NAME > $NAME.fmt

RET_CODE=$?
print_result $0 $RET_CODE

cd $HOME_DIR
rm -f target_dir_tmp.txt
