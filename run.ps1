$null = import-module Vester
$null = Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer
Invoke-Vester -Config /root/Test-Configs/HPBlades.json