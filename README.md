# Welcome to the Db2_event_monitor_operation_tool wiki!
## このツールではDb2のCUI監視ツール イベントモニターの管理・操作を行うことが出来ます
### This tool can manage and operate your Db2's event monitor!!

機能は以下の８つです。
Functions in this tool is below.

1. イベントモニターの作成 (create your event monitor.)
2. イベントモニターの削除 (drop your event monitor.)
3. イベントモニターの起動 (start your event monitor.)
4. イベントモニターの停止 (stop your event monitor.)
5. イベントモニターの設定・状況確認 (check your event monitor.(e.g. STATUS))
6. イベントモニターのフォーマット (format your event monitor's output)
7. イベントモニターのアウトプット削除 (delete your event monitor's output)
8. スクリプト終了 (quit this tool)

***

## ツールの使用手順 How To Use This Tool!
***
1. このリポジトリをダウンロードします (Download this repository.)
2. Db2をインストールしたサーバの、任意のディレクトリに配置します (locate this tool on your server Installed IBM Db2(LUW).)
3. viコマンド等エディタを使用して、Db2_operate_event_monitor.confのシェル変数に適当な値を設定します (To use this tool, edit below value in Db2_operate_event_monitor.conf with editer(e.g. vi).)
```Shell
DBNAME=""
ID=""
PASSWD=""
OWNER=""
GROUP=""
```
4. Db2のインスタンスオーナーに切り替えます (switch user to instance owner of Db2.)
5. ツールを実行します (execute this tool!)
```
./Db2_operate_event_monitor.sh
```

6. ツールが起動される (start this tool)

[ツール起動後の各機能の操作方法 (How to use functions after starting this tool)](https://github.com/Massas/Db2_event_monitor_operation_tool/wiki/START)
