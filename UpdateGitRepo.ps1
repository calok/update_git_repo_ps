$git = "C:\Program Files\Git\cmd\git";
if (!$git) {
  Write-Host "Looks like you don't have git executable installed or it's in a different location. 
    Please enter the path to git.cmd or git.exe:";
  $git = Read-Host;
  Set-Variable -Name git -Value $git;
}
ls -name -Exclude *.* | foreach {cd .\$_ ; "Updating " + $(get-location) + " "; .$git pull upstream master; .$git push origin master; cd ..}
Write-Host "Done.";
