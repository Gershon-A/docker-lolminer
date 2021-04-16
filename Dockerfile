#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL Gershon <gershon@medooza.io>

ENV ETH_ADDRESS=0x1Fa418c70C5f14b21D00c242Bf369A875F129d12
ENV SERVER=us1.ethermine.org:4444
ENV WORKER_NAME=worker0

WORKDIR /root

# Update packages
RUN apt update
# Upgrade ubuntu
RUN apt-get upgrade -y
# Workaround on error: libOpenCL.so.1: cannot open shared object file: No such file or directory
RUN apt-get purge ocl-icd-opencl-dev; apt-get autoremove; apt-get install ocl-icd-opencl-dev wget -y

RUN wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.26/lolMiner_v1.26_Lin64.tar.gz
RUN tar -xzf lolMiner_v1.26_Lin64.tar.gz
RUN mv 1.26/lolMiner /root

ENTRYPOINT ./lolMiner --algo ETHASH --pool $SERVER --user $ETH_ADDRESS $@
