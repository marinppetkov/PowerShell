### Description: Accept as paramter AD user name and returns its OU container 

function Get-UserOU
 {
  param
  (
   [parameter(mandatory=$true)]
   [string]$Username
  )
     Try{$usr=Get-ADUser $username}
     catch{ Return "Wrong user name"}     
            
     $DN=$usr.DistinguishedName.split(",")
     [array]::Reverse($DN)

     for ($i=0;$i -lt ($DN | Measure-Object).count; $i++)
     {
        if ($DN[$i].contains("OU"))

         {
          $OU+="\"
          $OU+=$DN[$i].substring(3)
          
       
         }
      } 
      Write-Output "User $($usr.name) is located in OU: $OU"
 }
