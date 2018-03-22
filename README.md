# VMware validation/remediation from Docker using Vester #

We have multiple times had issues after our service provider had replaced an ESXi host in our environment, the new hosts would have the correct settings, so we needed something that could validate our configurations.

After looking around the internet I stumbled on Vester [https://github.com/WahlNetwork/Vester](https://github.com/WahlNetwork/Vester "Vester") full documentation can be found here [https://wahlnetwork.github.io/Vester](https://wahlnetwork.github.io/Vester "here").

So I made some test configurations and started running them against my environment, and everything was fine, until some from my team wanted to run some tests themselves. Since I am the only Windows guy on the team, we quickly realized that Vester was not working on PowerShell Core on Linux.

So I set out to update Vester to make it work on "Linux", so I spun up the vmware/powerclicore docker image and went through multiple iterations, until I actually figured out, it was not my code changes that broke the tests, it was actually something in PhotonOS that did not play well with PowerShell/Pester.

So I switched to using the microsoft/powershell docker image that is based on Ubuntu, and my modified Vester just worked.

Currently I am just iterating through different tests on my local machine, that is why I cook everything in the docker container, the plan is that this will be hooked into our CI system and run from there.

In time I would like my changes to go back into Vester, so I do not need to use a custom version, currently I am facing some issues with their tests, that I do not have the time to figure out, so hopefully in the next couple of weeks I will find some time, or get a hold of one of the maintainers of Vester to discuss the changes







