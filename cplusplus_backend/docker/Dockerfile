##########################################
# Base ROS 2 Humble Image + Dependencies #
##########################################

FROM --platform=arm64 ros:humble-ros-core-jammy AS primary_image

LABEL author="Rushil Shah <rushils4@illinois.edu>"
LABEL maintainer="Rushil Shah <shahrushil520@gmail.com>"

# Dependencies Installation
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt-get update -y
RUN apt-get install -y  tree \
                        curl \
                        gnupg2 \
                        lsb-release \
                        build-essential \
                        git \
                        python3-pip \
                        wget \
                        cmake \
                        vim \
                        g++

RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

######################################
# Primary Image + Custom Environment #
######################################

FROM primary_image

# Copy Directory
RUN mkdir /home/eeg_connect/
COPY . /home/eeg_connect/

# Install Further Dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y  libglfw3 \
                        libglfw3-dev \
                        pkg-config \
                        mesa-utils \
                        libgl1-mesa-glx \
                        libgl1-mesa-dev \
                        libgl1-mesa-dri \
                        libglu1-mesa-dev \
                        x11-apps \
                        x11-utils

RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

# Aliases
# RUN cp /home/eeg_connect/docker/.bash_aliases /home/
# RUN echo "source /home/.bash_aliases" > /home/.bashrc
# RUN source /home/.bashrc

WORKDIR /home/eeg_connect/gui/dear_imgui/examples/example_glfw_opengl3

CMD ["bash"]