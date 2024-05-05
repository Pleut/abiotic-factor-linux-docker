# Abiotic Factor Linux Docker
For operating a dedicated server in Docker in order to use it under Linux.
The container uses Wine to run the server under Linux. 

## Setup
Setup and start via docker-compose with `docker-compose up -d --build`.

In the docker-compose.yml config file, the environment variables `ServerPassword` and `SteamServerName` should be adjusted.

## Update
There are two ways to update the game server:
1. By setting the `AutoUpdate` environment variable to `true`. This checks for updates every time the container is started.
2. By rebuilding the Docker image.

## Configuration
An example configuration for docker-compose can be found in the `docker-compose.yml` file.
In addition to the default settings, which can be set via the environment variables, further arguments can be specified via the `AdditionalArgs` environment variable.

Possible launch parameters and further information on the dedicated servers for Abiotic Factor can be found [here](https://github.com/DFJacob/AbioticFactorDedicatedServer/wiki/Technical-%E2%80%90-Launch-Parameters).

## Credits
Thanks to @sirwillis92 for finding a solution to the startup problem with the `LogOnline: Warning: OSS: Async task 'FOnlineAsyncTaskSteamCreateServer bWasSuccessful: 0' failed in 15` message.