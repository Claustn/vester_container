# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'Account Unlock Time'

# Test description: How New-VesterConfig explains this value to the user
$Description = '0 (off) or number of seconds that an account is locked out'

# The config entry stating the desired values
$Desired = $cfg.host.accountunlocktime

# The test value's data type, to help with conversion: bool/string/int
$Type = 'int'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    (Get-AdvancedSetting -Entity $Object | Where-Object -FilterScript {
        $_.Name -eq 'Security.AccountUnlockTime'
    }).Value
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    Get-AdvancedSetting -Entity $Object | Where-Object -FilterScript {
            $_.Name -eq 'Security.AccountUnlockTime'
        } | Set-AdvancedSetting -Value $Desired -Confirm:$false -ErrorAction Stop
}
