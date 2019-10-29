# SCCM_PowershellScript_MoveSUG
Move an Software update in a specific SUG to another SUG.

# スクリプトについて
特定のソフトウェア更新プログラムグループに所属している更新プログラムを、
別のソフトウェア更新プログラムグループへ移動させるという運用がある場合にとても役に立つスクリプトです。

■使い方<br>
1.以下のファイルをダウンロードし任意の場所（サイトサーバー上）に配置します。

・SoftwareUpdateGroup-List.csv
・SUG-SourceToDest.ps1

2.[SoftwareUpdateGroup-List.csv]を開き、[SUGSource]列に移動元であるソフトウェア更新プログラムグループ名を記入します。

3.[SUGDest]列に移動先であるソフトウェア更新プログラムグループ名を記入します。

4.記入完了後、[SUG-SourceToDest.ps1]をPowershell(管理者)で実行します。

5.移動元から移動先へ所属する更新プログラムが移動されます。


# About scripts(In English)
This script is very useful when there is an operation to move an update program belonging to a specific software update group to another software update group.

■ How to use<br>
1. Download the following file and place it in any location (on the site server).

・ SoftwareUpdateGroup-List.csv 
・ SUG-SourceToDest.ps1

2. Open [SoftwareUpdateGroup-List.csv] and enter the name of the software update program group that is the move source in the [SUGSource] column.

3. Enter the destination software update group name in the [SUGDest] column.

4. After completing the entry, execute [SUG-SourceToDest.ps1] with Powershell (administrator).

5. The update program belonging to the move source is moved from the move source.
