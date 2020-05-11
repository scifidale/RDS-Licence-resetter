# RDS Lab Licence Resetter 

$User = Everyone
$RDSServer = Test-path -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod'
if ($RDSServer = "True") {.\SetACL.exe -on "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" -ot reg -actn setowner -ownr "n:$User"
SetACL.exe -on "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod" -ot reg -actn ace -ace "n:$User"
Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod\L$RT*"
eventcreate /id 555 /D "This Lab RDS Server has sucessfully reset its grace period" /T Information /L Application /so RDSLAB}

Exit