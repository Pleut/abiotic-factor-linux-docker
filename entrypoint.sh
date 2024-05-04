SetUsePerfThreads="-useperfthreads "
if [[ $UsePerfThreads == "false" ]]; then
    SetUsePerfThreads=""
fi

SetNoAsyncLoadingThread="-NoAsyncLoadingThread "
if [[ $NoAsyncLoadingThread == "false" ]]; then
    SetNoAsyncLoadingThread=""
fi

MaxServerPlayers="${MaxServerPlayers:-6}"
Port="${Port:-7777}"
QueryPort="${QueryPort:-27015}"
ServerPassword="${ServerPassword:-password}"
SteamServerName="${SteamServerName:-LinuxServer}"
WorldSaveName="${WorldSaveName:-Cascade}"
AdditionalArgs="${AdditionalArgs:-}"

# Check for updates
if [[ $AutoUpdate == "true" ]]; then
    steamcmd \
    +@sSteamCmdForcePlatformType windows \
    +force_install_dir /server \
    +login anonymous \
    +app_update 2857200 validate \
    +quit
fi

cd /server/AbioticFactor/Binaries/Win64
wine AbioticFactorServer-Win64-Shipping.exe $SetUsePerfThreads$SetNoAsyncLoadingThread-MaxServerPlayers=$MaxServerPlayers \
    -PORT=$Port -QueryPort=$QueryPort -ServerPassword=$ServerPassword \
    -SteamServerName="$SteamServerName" -WorldSaveName="$WorldSaveName" $AdditionalArgs