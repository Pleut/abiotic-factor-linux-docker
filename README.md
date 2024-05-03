# Abiotic Factor Linux Docker
> [!WARNING]  
> The Docker container often doesn't establish a successful connection to the Steam servers and is therefore not visible in the server browser. However, after a few restarts it always works for me. If `LogOnline: Warning: OSS: Async task 'FOnlineAsyncTaskSteamCreateServer bWasSuccessful: 0' failed in 15` appears in the container log, the connection has failed and the container must be restarted.


For operating a dedicated server in Docker in order to use it under Linux.
The container uses Wine to run the server under Linux. 

## Usage
Setup and start via docker-compose with `docker-compose up -d --build`.

In the docker-compose.yml config file, the environment variables `ServerPassword` and `SteamServerName` should be adjusted.