FROM nvcr.io/nvidia/cuda:11.6.0-devel-ubuntu18.04

# Expose default SSH port
EXPOSE 22

ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies for convinient development inside container
RUN apt-get update && apt-get install -y \
    sudo \
    tmux \
    openssh-server \
    build-essential \
    pkg-config \
    cmake \
    git \
    wget \
    curl \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda3
ENV CONDADIR /opt/miniconda3
ENV CONDAEXE ${CONDADIR}/bin/conda
RUN apt-get update && apt-get install -y wget \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 2>/dev/null \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p ${CONDADIR} \
    && useradd -m anaconda --uid=6666 && echo "anaconda:anaconda" | chpasswd \
    && chown -R anaconda:anaconda ${CONDADIR} \
    && chmod -R g+w ${CONDADIR} \
    && ${CONDAEXE} clean -a -y \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

# User setup
ARG USER=user
ARG UID=1000
ARG GID=1000
ARG PW=1

# Add user and his password
RUN useradd -m ${USER} --uid=${UID} \
    && echo "${USER}:${PW}" | chpasswd \
    && usermod -s /bin/bash ${USER} \
    && usermod -a -G sudo ${USER}

WORKDIR /home/${USER}