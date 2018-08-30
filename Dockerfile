FROM ubuntu:latest

ENV DOOMWADDIR /wads

RUN apt-get update -y && \
    apt-get install -y software-properties-common wget && \
    wget -O- http://debian.drdteam.org/drdteam.gpg | apt-key add - && \
    apt-add-repository 'deb http://debian.drdteam.org/ stable multiverse' && \
    apt-get update -y && \
    apt-get install -y zandronum-server && \
    wget -P $DOOMWADDIR http://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad

EXPOSE 10666

VOLUME $DOOMWADDIR

ENTRYPOINT zandronum-server