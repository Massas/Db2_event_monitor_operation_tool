#!/usr/bin/ksh
##############################################
##    clear_event_monitor_files.sh
##############################################

### 変数定義 ###
RET_CODE=""
NAME=""
HOME_DIR=`pwd`
TARGET_DIR=""

echo
echo '#================================='
echo '# clear_event_monitor_files.sh:START'
echo '#================================='
echo

### confファイル読み込み ###
echo "confファイルを読み込む" > /dev/null

. ./Db2_operate_event_monitor.conf

print_fundamental_information > /dev/null

connect_to_database > /dev/null

# イベントモニター名を一覧表示する
./check_event_monitor.sh 11 

echo ""
echo "アウトプットを削除したいイベントモニターの名前を指定してください"
read NAME
echo "入力した値： $NAME"
echo ""

# アウトプット先ディレクトリを取得する
echo "アウトプット先ディレクトリを取得する"
./check_event_monitor.sh 12 $NAME

TARGET_DIR=`cat target_dir_tmp.txt`
echo "アウトプット先ディレクトリ：$TARGET_DIR"

cd $TARGET_DIR

# ファイル削除
echo "ファイルが存在する場合、削除する:*.evt *.ctl *.fmt"

# 削除したいファイルの拡張子を'in'の後に指定する
for file_extension in evt ctl fmt
    do
        if [ -f *.${file_extension} ]; then
            # 対象となる拡張子のファイルを削除する
            rm -f *.${file_extension}
        else
            echo ""
        fi
    done

RET_CODE=$?

cd $HOME_DIR
rm -f target_dir_tmp.txt

print_result $0 $RET_CODE
