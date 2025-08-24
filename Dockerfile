# Python 3.13 소스 코드 이미지를 기반으로 시작
FROM python:3.13-slim AS build-env

# 필요한 빌드 종속성 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libssl-dev \
    libreadline-dev \
    libsqlite3-dev \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    wget

# Python 3.13 소스 코드 다운로드 및 압축 해제
RUN wget https://www.python.org/ftp/python/3.13.7/Python-3.13.7.tar.xz && \
    tar -xf Python-3.13.7.tar.xz

# GIL 없이 Python 컴파일 및 설치
WORKDIR /Python-3.13.7
RUN ./configure --prefix=/usr/local --disable-gil --without-gil --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall

