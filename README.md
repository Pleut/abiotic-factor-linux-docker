# Abiotic Factor Linux Docker
> [!WARNING]  
> The Docker container often doesn't establish a successful connection to the Steam servers and is therefore not visible in the server browser. However, after a few restarts it always works for me. If `LogOnline: Warning: OSS: Async task 'FOnlineAsyncTaskSteamCreateServer bWasSuccessful: 0' failed in 15` appears in the container log, the connection has failed and the container must be restarted.


For operating a dedicated server in Docker in order to use it under Linux.
The container uses Wine to run the server under Linux. 

## Usage
Setup and start via docker-compose with `docker-compose up -d --build`.

In the docker-compose.yml config file, the environment variables `ServerPassword` and `SteamServerName` should be adjusted.

## Configuration
An example configuration for docker-compose can be found in the `docker-compose.yml` file.
In addition to the default settings, which can be set via the environment variables, further arguments can be specified via the `AdditionalArgs` environment variable.

Possible launch parameters and further information on the dedicated servers for Abiotic Factor can be found [here](https://github.com/DFJacob/AbioticFactorDedicatedServer/wiki/Technical-%E2%80%90-Launch-Parameters).