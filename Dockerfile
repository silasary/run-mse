FROM ubuntu:20.04 AS build
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common && \
    apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc && \
    apt-add-repository 'deb https://repos.codelite.org/wx3.1.4/ubuntu/ groovy universe' && \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y build-essential g++ libboost-dev libhunspell-dev git \
    wget xvfb \
    libssl-dev libboost-regex-dev \
    libwxbase3.1-0-unofficial3 \
    libwxbase3.1unofficial3-dev \
    libwxgtk3.1-0-unofficial3 \
    libwxgtk3.1unofficial3-dev \
    wx3.1-headers \
    wx-common \
    pkg-config \
    libgtk-3-dev \ 
    libnotify-dev

WORKDIR /cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5.tar.gz
RUN tar -zxvf cmake-3.16.5.tar.gz
WORKDIR /cmake/cmake-3.16.5

RUN ./bootstrap
RUN make
RUN make install

WORKDIR /src
RUN git clone https://github.com/twanvl/MagicSetEditor2 .
ADD CMakeLists.patch .
RUN git apply CMakeLists.patch

WORKDIR /src/build
RUN ln -s wx-3.1-unofficial3 /usr/include/wx-3.1-unofficial
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN cmake --build .

ENTRYPOINT [ "/bin/bash" ]