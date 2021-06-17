Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "E:\windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "schencker.org" `
-DomainNetbiosName "schencker" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "E:\windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "E:\windows\SYSVOL" `
-Force:$true
