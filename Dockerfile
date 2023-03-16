FROM jupyter/scipy-notebook:2023-02-28 
USER root
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  fuse \
  python3-pip \
  wget
RUN wget https://downloads.rclone.org/rclone-current-linux-amd64.deb \
    && dpkg -i rclone-current-linux-amd64.deb && rm rclone-current-linux-amd64.deb
USER jovyan
COPY ./mount.sh /home/jovyan/mount.sh
