FROM jupyter/scipy-notebook:2023-02-28 
USER root
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  nextcloud-desktop-cmd \
  python3-pip
COPY ./nc-sync /usr/local/bin/
USER jovyan
