# copy DSC modules into system modules folder
$customModuleDirectory = Join-Path $env:SystemDrive "\Program Files\WindowsPowerShell\Modules"
$customModuleSrc = Join-Path $applicationPath "Deploy\xWebAdministration"
Copy-Item -Verbose -Force -Recurse -Path $customModuleSrc -Destination $customModuleDirectory 

$ConfigData = @{
    AllNodes = @(
		@{ NodeName = "*"},

        @{
			NodeName = $env:COMPUTERNAME
            DeploymentPath = $env:SystemDrive + "\inetpub\FF"
        }
    );
}