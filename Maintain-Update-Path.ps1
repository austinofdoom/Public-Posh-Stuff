  #add a new path to the end of PATH?
$pathtoadd = ';' + $(Read-Host 'New path to add to PATH?').ToString()

  #null out $newpath just in case
$newPath = $null
  #define the default windows locations
$winpath = 'C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;'
  #get the current path var
$currentpath = [System.Environment]::GetEnvironmentVariable('PATH')
  #trim out every instance of each part of the default windows path (who likes duplicates???)
$trimmedpath = $currentpath.Replace('C:\WINDOWS\System32\OpenSSH\;','').Replace('C:\WINDOWS\System32\WindowsPowerShell\v1.0\;','').Replace('C:\WINDOWS\System32\Wbem;','').Replace('C:\WINDOWS\system32;','').Replace('C:\WINDOWS;','')

  #create the new PATH var
$newPath = $winpath + $trimmedpath + $pathtoadd
  #set the new PATH Var for machine and process
[System.Environment]::SetEnvironmentVariable('PATH', $newPath, [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('PATH', $newPath, [System.EnvironmentVariableTarget]::Process)

  # Don't need to change user vars
#[System.Environment]::SetEnvironmentVariable($variableNameToAdd, $variableValueToAdd, [System.EnvironmentVariableTarget]::User)