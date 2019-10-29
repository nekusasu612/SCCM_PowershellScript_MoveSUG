# SCCM_PowershellScript_MoveSUG
Move an Software update in a specific SUG to another SUG.

# スクリプトについて
特定のソフトウェア更新プログラムグループに所属している更新プログラムを、
別のソフトウェア更新プログラムグループへ移動させるという運用がある場合にとても役に立つスクリプトです。

■使い方
1.以下のファイルをダウンロードし任意の場所（サイトサーバー上）に配置します。
・SoftwareUpdateGroup-List.csv
・SUG-SourceToDest.ps1

2.[SoftwareUpdateGroup-List.csv]を開き、[SUGSource]列に移動元であるソフトウェア更新プログラムグループ名を記入します。

3.[SUGDest]列に移動先であるソフトウェア更新プログラムグループ名を記入します。

4.記入完了後、[SUG-SourceToDest.ps1]をPowershell(管理者)で実行します。

5.移動元から移動先へ所属する更新プログラムが移動されます。
