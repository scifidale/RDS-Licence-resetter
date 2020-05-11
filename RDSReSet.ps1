# RDS Lab Licence Resetter 


$User = "Everyone"
$RDSLicKey = 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod'
$RDSServer = Test-path -path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod"
if ($RDSServer -eq "True") {.\Set-ACL\SetACL.exe -on "$RDSLicKey" -ot reg -actn setowner -ownr "n:$User"
.\Set-ACL\SetACL.exe -on "$RDSLicKey" -ot reg -actn ace -ace "n:$User;p:full"
Remove-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" -Recurse
eventcreate /id 555 /D "This Lab RDS Server has sucessfully reset its grace period" /T Information /L Application /so RDSLAB
Exit
} ELSE {
Eventcreate /id 555 /D "This is not an RDS server grace period will not be reset" /T Information /L Application /so RDSLAB
Exit
}