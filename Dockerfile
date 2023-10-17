FROM ubuntu:20.04 as base

ENV DEBIAN_FRONTEND=noninteractive
ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket

RUN mkdir -p /app/allan_variance_ros

WORKDIR /app/allan_variance_ros

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get update && apt-get install build-essential software-properties-common -y \
    sudo \
    cmake \
    libboost-all-dev \
    graphviz \
    libgl1-mesa-dev \
    libglew-dev \
    libhdf5-dev \
    libfreetype6-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libavutil-dev \
    sed \
    gcc-9 \
    g++-9 \
    gdb \
    zlib1g \
    ninja-build \
    wget \
    zsh \
    ffmpeg \
    libgflags-dev \
    python3 \
    python3-pip \
    git \
    unzip \
    python3-dev \
    libopenblas-dev \
    bzip2 \
    ca-certificates \
    curl \
    libgoogle-glog-dev \
    libgflags-dev \
    libatlas-base-dev \
    libsuitesparse-dev \
    libfmt-dev \
    libflann-dev

RUN pip3 install scipy tqdm

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt update && \
    apt install ros-noetic-desktop -y

RUN apt-get update && apt-get install python3-rosdep -y \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    python3-rosdep \
    python3-catkin-tools && \ 
    rosdep init && \
    rosdep update

RUN apt-get update && apt-get install -y \
    ros-noetic-roscpp \
    ros-noetic-rospy \
    ros-noetic-std-msgs \
    ros-noetic-sensor-msgs \
    ros-noetic-geometry-msgs \
    ros-noetic-nav-msgs \
    ros-noetic-tf \
    ros-noetic-rosbag \
    ros-noetic-message-generation \
    ros-noetic-eigen-conversions
