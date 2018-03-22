# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'Sync Time Settings'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'VMware Tools sets the time of the guest operating system to be the same as the time of the host'

# The config entry stating the desired values
$Desired = $cfg.vm.synctimesettings

# The test value's data type, to help with conversion: bool/string/int
$Type = 'bool'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    $Object.ExtensionData.Config.Tools.SyncTimeWithHost
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    $Spec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $Spec.ChangeVersion = $Object.ExtensionData.Config.ChangeVersion
    $Spec.Tools = New-Object VMware.Vim.ToolsConfigInfo
    $Spec.Tools.SyncTimeWithHost = $Desired
    $Object.ExtensionData.ReconfigVM_Task($Spec)
}