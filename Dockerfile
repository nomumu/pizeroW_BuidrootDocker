FROM ubuntu:focal
LABEL maintainer="nomumu <nomumu-github@koso2-dan.ddo.jp>"

# for Buildroot
RUN apt-get update -y && apt-get install -y apt-utils
RUN apt-get update -y && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 
RUN apt-get update -y && apt-get install -y git bc bison flex libssl-dev make libc6-dev libncurses5-dev wget
RUN apt-get update -y && apt-get install -y crossbuild-essential-armhf
RUN apt-get update -y && apt-get install -y cpio unzip rsync python3
RUN apt-get update -y && apt-get install -y vim

WORKDIR /work
RUN wget https://buildroot.org/downloads/buildroot-2021.02.3.tar.gz && tar xzvf buildroot-2021.02.3.tar.gz
RUN mv /work/buildroot-2021.02.3 /work/buildroot

COPY scripts/build.sh /build.sh
COPY scripts/imgcopy.sh /imgcopy.sh
COPY scripts/entry.sh /entry.sh

CMD /entry.sh