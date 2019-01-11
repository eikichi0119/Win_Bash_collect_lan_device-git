@ECHO Off
set startTime=%time%
ECHO Starting the IP Scan
FOR /L %%z IN (1,1,254) DO @(
echo Pinging IP: 10.0.9.%%z
ping -n 1 -w 500 10.0.9.%%z | FIND /i "Reply">>IPScanResults.txt
nbtstat -A 10.0.9.%%z | FIND /i "<20>">>IPScanResults.txt
)
)
ECHO Run Time = %startTime% to %time%>>IPScanResults.txt
ECHO *** IP Scan Complete. ***
ECHO Check the file called IPScanResults.txt to see the results
ECHO Run Time = %startTime% to %time%
