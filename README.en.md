# Python 3.13 NoGIL Docker Image

This repository provides a Docker image built from Python 3.13 source code with the Global Interpreter Lock (GIL) removed.

## Features

- Build Python 3.13 from source
- Remove GIL using the `--without-gil` option

## Usage

### 1. Build the Image

```bash
$ IMAGE_NAME="python3.13t"
$ TAG="202508"

$ docker build -t ${IMAGE_NAME}:${TAG} .
```

### 2. Run and Test the Container

To execute a bash shell inside the container, use the following command:

```bash
$ IMAGE_NAME="python3.13t"
$ TAG="202508"
$ docker run --rm -it ${IMAGE_NAME}:${TAG} bash
```

To confirm the Python and pip versions, ensure that "experimental free-threading build" is displayed in the output.

```bash
ls /usr/local/bin/python*
/usr/local/bin/python          /usr/local/bin/python3.13
/usr/local/bin/python-config   /usr/local/bin/python3.13-config
/usr/local/bin/python3         /usr/local/bin/python3.13t
/usr/local/bin/python3-config  /usr/local/bin/python3.13t-config

python -VV
Python 3.13.7 experimental free-threading build (main, Aug 23 2025, 20:46:14) [GCC 14.2.0]

ls /usr/local/bin/pip*
/usr/local/bin/pip  /usr/local/bin/pip3  /usr/local/bin/pip3.13

pip -V
pip 25.2 from /usr/local/lib/python3.13t/site-packages/pip (python 3.13)

```
Alternatively, verify the Python version directly using the following command:

```bash
$ docker run --rm -it ${IMAGE_NAME}:${TAG} python3.13 -c "import sys; print(sys.version)"
3.13.7 experimental free-threading build (main, Aug 23 2025, 20:46:14) [GCC 14.2.0]
```

### 3. Push to Registry

```bash
docker tag <image_name>:<tag> <registry_address>/<image_name>:<tag>
docker push <registry_address>/<image_name>:<tag>
```

## Dockerfile Overview

- Build stage: Compile Python 3.13 from source

## Notes

- Full static build is complex and requires all libraries to be statically linked.

## License

MIT
