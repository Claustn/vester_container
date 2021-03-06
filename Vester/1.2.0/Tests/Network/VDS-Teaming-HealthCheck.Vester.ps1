﻿# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'VDS Teaming and Failover HealthCheck State'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'On/Off switch to control the VDS Teaming and Failover HealthCheck setting'

# The config entry stating the desired values
$Desired = $cfg.vds.healthcheckteaming

# The test value's data type, to help with conversion: bool/string/int
$Type = 'bool'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    ($Object.ExtensionData.Config.HealthCheckConfig.Enable)[1]
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    Get-View -VIObject $object.name | 
    foreach {$_.UpdateDVSHealthCheckConfig(@((New-Object Vmware.Vim.VMwareDVSTeamingHealthCheckConfig -property @{enable=$Desired})))}
}