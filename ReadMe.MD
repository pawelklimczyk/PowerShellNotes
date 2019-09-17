Viewing the PSModulePath variable
---------------------------------

`$Env:PSModulePath`


Prompring for confirmation
----
$confirmation = Read-Host "Do you want to continue? [y/N]"
if ($confirmation -ne 'y') { exit }
