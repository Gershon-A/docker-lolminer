# T-Rex NVIDIA GPU miner (Ethash / Kawpow / Octopus / MTP)
Original repository
https://github.com/Lolliedieb/lolMiner-releases.git
This image build [lolMiner] lolMiner 1.18a from https://github.com/Lolliedieb/lolMiner-releases
It requires a CUDA compatible docker implementation so you should probably go
for [nvidia-docker].

Originally, this docker image madded for use with Kubernetes on [] and not tested locally.

## Build images

```
git clone git remote add origin https://github.com/Gershon-A/docker-lolminer.git
cd docker-lolminer
docker build -t lolminer .
```

## Publish it somewhere

```
docker tag lolminer:latest docker.domain.com/mining/lolminer:latest
docker push docker.domain.com/mining/lolminer:latest
```

## Test it (using DockerHub published image)

```
nvidia-docker pull gershona/lolminer:latest
nvidia-docker run -it --rm gershona/lolminer:latest /lolminer --help
```
