﻿# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'VDS Link Discovery Operation Protocol'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'Set the link discovery protocol operataion for the VDS (Advertise, Listen, Both, and Disabled)'

# The config entry stating the desired values
$Desired = $cfg.vds.linkoperation

# The test value's data type, to help with conversion: bool/string/int
$Type = 'string'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    $Object.LinkDiscoveryProtocolOperation
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    Set-VDSwitch $Object -LinkDiscoveryProtocolOperation $Desired -Confirm:$FALSE -ErrorAction Stop
}
