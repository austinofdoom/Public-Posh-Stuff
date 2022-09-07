#show all recycle bins
Get-ChildItem 'C:\$Recycle.bin\' -Force

#empty all recycle bins
Get-ChildItem 'C:\$Recycle.bin\' -Force | Remove-Item -Recurse -force

#show empty recycle bins
if (!(Get-ChildItem 'C:\$Recycle.bin\' -Force)) {"`nAll bins emptied."}
