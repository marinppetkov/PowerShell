
#Description: Checks which groups/users have explicit permissions to folders/subfolders/files
#Accepts as parameter the folder or file path with option for recursive check 
function Get-ExplicitPermissions{

 param(
 [parameter(mandatory=$true, position=1)]
 [string]$path,
 [switch]$Recurse 
 )

 $Objects=Get-ChildItem -Recurse:$Recurse -Path $path | select FullName
 foreach ($object in $Objects.Fullname){
     if ($ExpPermissions=$(get-item -path $object).getaccesscontrol().access|where {$_.IsInherited -like "False"}){
         Write-Host "User(s)/group(s) $($ExpPermissions.IdentityReference) has/have explicit permissions on $object"
         }
     }
}
