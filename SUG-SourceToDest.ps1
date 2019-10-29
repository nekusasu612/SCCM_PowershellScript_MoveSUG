
 #############################################################################
# Title : 特定のソフトウェア更新プログラムグループ内の更新プログラムを他のソフトウェア更新プログラムグループへ移動する
#############################################################################


# SCCMモジュール取得
Try
{
  import-module (Join-Path $(Split-Path $env:SMS_ADMIN_UI_PATH) ConfigurationManager.psd1)
  $SiteCode=Get-PSDrive -PSProvider CMSITE
  cd ((Get-PSDrive -PSProvider CMSite).Name + ':')

}
Catch
{
  Write-Host "[ERROR]`t SCCM Module couldn't be loaded. Script will stop!"
  Exit 1
}

# スクリプト場所宣言
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$CSVFile  = "$ScriptDir\SoftwareUpdateGroup-List.csv"
$log      = "$ScriptDir\SoftwareUpdateGroup.log"
$date     = Get-Date -Format "dd-MM-yyyy hh:mm:ss"
"---------------------  Script started at $date (DD-MM-YYYY hh:mm:ss) ---------------------" + "`r`n" | Out-File $log -append

# CSVファイル読み込み
$OutPutPath = Import-CSV $CSVFile -Encoding Default #| ForEach-Object 

# 更新プログラムグループへの移動実施
Foreach( $x in $OutPutPath){
  $SUGSource=$x.SUGSource
  $SUGDest=$x.SUGDest

 $SUGs = Get-CMSoftwareUpdateGroup -Name $SUGSource
 $Updates = $SUGs.Updates
 Add-CMSoftwareUpdateToGroup -SoftwareUpdateGroupName $SUGDest -SoftwareUpdateId $Updates
}

  "---------------------  Script finished at $date (DD-MM-YYYY hh:mm:ss) ---------------------" + "`r`n" | Out-File $log -append