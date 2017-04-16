
<#

.SYNOPSIS
Download and install all updates from Microsoft Update service.

.DESCRIPTION
* Register to Microsoft Update service.
* Download of all updates from Microsoft Update.
* Install of all updates from Microsoft Update.
* Make automatically reboot of system.

.PARAMETER
Script not need any input parameters.

.OUTPUTS
Output is fordarded to display.

.EXAMPLE
C:\> install-allupdates.cmd

.LINK
http://www.michalzobec.cz/

.NOTES
Install Microsoft Updates
version 17.04.17.1
Install all Microsoft Updates (command line tool).
(c) 2015-2017 Michal Zobec, ZOBEC Consulting. All Rights Reserved.
web: www.michalzobec.cz

#>

<# options
WhatInstall All/Critical
#>
$WhatInstall    ='All'

## import modulu
Import-Module PSWindowsUpdate

## pridani service managera pro microsoft update
## Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d –Confirm:$false
$mu = New-Object -ComObject Microsoft.Update.ServiceManager -Strict 
$mu.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")

## stazeni a instalace vsech aktualizaci, vcetne automatickeho restartu
Get-WUInstall –MicrosoftUpdate –AcceptAll –AutoReboot
