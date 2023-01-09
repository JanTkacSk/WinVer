$ProductName = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').ProductName

function Get-W2k8Version {

$OSName = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').ProductName
$CurrentVersion = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentVersion
$CurrentBuild = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentBuild

Return "$OSName, $CurrentVersion`.$CurrentBuild"

}

function Get-W2k12Version {

$OSName = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').ProductName
$CurrentVersion = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentVersion
$CurrentBuild = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentBuild
$UBR = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').UBR

Return "$OSName, $CurrentVersion`.$CurrentBuild`.$UBR"

}

function Get-W2k16Version {
    
$OSName = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').ProductName
$MajorVersion = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentMajorVersionNumber
$MinorVersion = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentMinorVersionNumber
$OSBuild = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').CurrentBuild
$UBR = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').UBR
$ReleaseID = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion').ReleaseID

Return "$OSName ($ReleaseID), $MajorVersion`.$MinorVersion`.$OSBuild`.$UBR"


}


switch -Regex ($ProductName) 

{

("Server 2008") {Get-W2k8Version}
("Server 2012") {Get-W2k12Version}
("Server 2016") {Get-W2k16Version}
("Server 2019") {Get-W2k16Version}
("Windows 10") {Get-W2k16Version}

}