MaxServerPlayers="${MaxServerPlayers:-6}"
Port="${Port:-7777}"
QueryPort="${QueryPort:-27015}"
ServerPassword="${ServerPassword:-password}"
SteamServerName="${SteamServerName:-LinuxServer}"
cd /server/AbioticFactor/Binaries/Win64
wine AbioticFactorServer-Win64-Shipping.exe -log -useperfthreads -NoAsyncLoadingThread -MaxServerPlayers=$MaxServerPlayers -PORT=$Port -QueryPort=$QueryPort -ServerPassword=$ServerPassword -SteamServerName="$SteamServerName"