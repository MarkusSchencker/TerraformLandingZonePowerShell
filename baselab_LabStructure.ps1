$ErrorActionPreference = "continue"

#Setup Variables
$DCRoot = "DC=schencker,DC=org"
$LabDCRoot = "OU=Lab,DC=schencker,DC=org"
#Create Root Lab OU
New-ADOrganizationalUnit -Name "Lab" -Path $DCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab Environment"
#Create Other OUs
New-ADOrganizationalUnit -Name "Users" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab Users"
New-ADOrganizationalUnit -Name "Service Accounts" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab Service Accounts"
New-ADOrganizationalUnit -Name "Servers" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab Servers"
New-ADOrganizationalUnit -Name "WVD" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab WVD Session Hosts"
New-ADOrganizationalUnit -Name "Computers" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab Computers"
New-ADOrganizationalUnit -Name "ANF" -Path $LabDCRoot -ProtectedFromAccidentalDeletion $False -Description "Lab ANF Objects"

$WVDLabDCRoot = "OU=WVD,$($LabDCRoot)"
New-ADOrganizationalUnit -Name "Computers" -Path $WVDLabDCRoot -ProtectedFromAccidentalDeletion $False -Description "WVD Computers"
New-ADOrganizationalUnit -Name "Users" -Path $WVDLabDCRoot -ProtectedFromAccidentalDeletion $False -Description "WVD Users"
New-ADOrganizationalUnit -Name "Groups" -Path $WVDLabDCRoot -ProtectedFromAccidentalDeletion $False -Description "WVD Groups"
New-ADOrganizationalUnit -Name "Users" -Path $WVDLabDCRoot -ProtectedFromAccidentalDeletion $False -Description "WVD Users"

$WVDComputersLabDCRoot = "OU=Computers,$($WVDLabDCRoot)"
New-ADOrganizationalUnit -Name "Prod" -Path "$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Desktop-1" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Desktop-2" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Apps-1" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Apps-2" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "VDI" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Storage" -Path "OU=Prod,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Test" -Path "$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Desktop" -Path "OU=Test,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Apps" -Path "OU=Test,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Storage" -Path "OU=Test,$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
New-ADOrganizationalUnit -Name "Template" -Path "$($WVDComputersLabDCRoot)" -ProtectedFromAccidentalDeletion $False
