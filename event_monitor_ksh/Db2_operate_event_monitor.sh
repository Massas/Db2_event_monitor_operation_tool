#!/usr/bin/ksh
##############################################
##    operate_event_monitor.sh
##############################################

# 本スクリプトは、Db2のイベントモニターを操作・管理するためのシェルスクリプトです。

# 機能は大きく以下の8つです
# １．イベントモニターの作成
# ２．イベントモニターの削除
# ３．イベントモニターの起動
# ４．イベントモニターの停止
# ５．イベントモニターの設定・状況確認
# ６．イベントモニターのフォーマット
# ７．イベントモニターのアウトプット削除
# ８．スクリプト終了

### confファイル読み込み ###
echo "confファイルを読み込む\n"

. ./Db2_operate_event_monitor.conf

### 変数定義 ###

### メイン動作 ###

print_fundamental_information

connect_to_database

# 機能の選択
select cmd in CREATE DROP START STOP CHECK FORMAT CLEAR QUIT
do
	case $cmd in
		CREATE)
			echo "イベントモニターを作成します\n"
			
			create_event_monitor
			;;
		DROP)
			echo "イベントモニターを削除します\n"
			
			drop_event_monitor
			;;
		START)
			echo "イベントモニターの起動を行います\n"
			
			start_event_monitor
			;;
		STOP)
			echo "イベントモニターの提訴を行います\n"
			
			stop_event_monitor
			;;
		CHECK)
			echo "イベントモニターの設定・状況を確認します\n"
			
			check_event_monitor
			;;
		FORMAT)
			echo "イベントモニターのフォーマットを行います\n"
			
			format_event_monitor
			;;
		CLEAR)
			echo "イベントモニターのアウトプットファイルを削除します\n"
			
			clear_event_monitor_files
			;;
		QUIT)
			echo "スクリプトの処理を終了します\n"
			break
			;;
		*)
			echo "$REPLY という選択肢はありません"
	esac
done