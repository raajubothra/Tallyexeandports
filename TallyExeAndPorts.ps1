$TallyPrime = "C:\TallyPrime\tally.exe"
$TallyGatewayServer = "C:\TallyPrime\tallygatewayserver.exe"
$TallyLicensePort = "9999"
$TallyOdbcPort    =  "9000"


New-NetFirewallRule -Program $TallyPrime -Action Allow -Profile Any -DisplayName "Allow TallyPrime" -Description "Tally TallyPrime Application" -Direction Outbound

New-NetFirewallRule -Program $TallyPrime -Action Allow -Profile Any -DisplayName "Allow TallyPrime" -Description "Tally TallyPrime Application" -Direction Inbound
New-NetFirewallRule -Program $TallyGatewayServer -Action Allow -Profile Any -DisplayName "Allow Tally Gateway Server" -Description "Allow Tally GateWay Server for Licensing" -Direction Outbound
New-NetFirewallRule -Program $TallyGatewayServer -Action Allow -Profile Any -DisplayName "Allow Tally Gateway Server" -Description "Allow Tally GateWay Server for Licensing" -Direction Inbound
New-NetFirewallRule -DisplayName "Allow Tally License Port" -Direction Outbound  -Profile Any -Description "Allow TallyLicense Port" -LocalPort $TallyLicensePort -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow Tally License Port" -Direction Inbound  -Profile Any -Description "Allow TallyLicense Port" -LocalPort $TallyLicensePort -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow Tally ODBC Port" -Direction Inbound  -Profile Any -Description "Allow Tally ODBC Port" -LocalPort $TallyOdbcPort -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow Tally ODBC Port" -Direction Outbound  -Profile Any -Description "Allow Tally ODBC Port" -LocalPort $TallyOdbcPort -Protocol TCP -Action Allow