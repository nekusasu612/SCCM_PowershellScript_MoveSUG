
 #############################################################################
# Title : ����̃\�t�g�E�F�A�X�V�v���O�����O���[�v���̍X�V�v���O�����𑼂̃\�t�g�E�F�A�X�V�v���O�����O���[�v�ֈړ�����
#############################################################################


# SCCM���W���[���擾
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

# �X�N���v�g�ꏊ�錾
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$CSVFile  = "$ScriptDir\SoftwareUpdateGroup-List.csv"
$log      = "$ScriptDir\SoftwareUpdateGroup.log"
$date     = Get-Date -Format "dd-MM-yyyy hh:mm:ss"
"---------------------  Script started at $date (DD-MM-YYYY hh:mm:ss) ---------------------" + "`r`n" | Out-File $log -append

# CSV�t�@�C���ǂݍ���
$OutPutPath = Import-CSV $CSVFile -Encoding Default #| ForEach-Object 

# �X�V�v���O�����O���[�v�ւ̈ړ����{
Foreach( $x in $OutPutPath){
  $SUGSource=$x.SUGSource
  $SUGDest=$x.SUGDest

 $SUGs = Get-CMSoftwareUpdateGroup -Name $SUGSource
 $Updates = $SUGs.Updates
 Add-CMSoftwareUpdateToGroup -SoftwareUpdateGroupName $SUGDest -SoftwareUpdateId $Updates
}

  "---------------------  Script finished at $date (DD-MM-YYYY hh:mm:ss) ---------------------" + "`r`n" | Out-File $log -append