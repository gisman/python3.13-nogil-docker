[English Version](README.en.md)

# Python 3.13.7 NoGIL Docker 이미지

GIL이 제거된 Python 3.13.7을 빌드하여 Docker 이미지로 제공합니다.

> 2025년 8월 현재 공식 Docker Hub에는 GIL이 제거된 Python 3.13 이미지가 없습니다.
> apt ppa에서 제공되는 Python 3.13 nogil은 속도가 느립니다.

## 주요 특징

- Python 3.13.7 소스에서 직접 빌드
- `--without-gil` 옵션으로 GIL 제거

## 사용 방법

### 1. 이미지 빌드

```bash
$ IMAGE_NAME="python3.13t"
$ TAG="202508"

$ docker build -t ${IMAGE_NAME}:${TAG} .
```

### 2. 컨테이너 실행 및 테스트

bash shell 실행
```bash
$ IMAGE_NAME="python3.13t"
$ TAG="202508"
$ docker run --rm -it ${IMAGE_NAME}:${TAG} bash
```

python 및 pip 버전 확인. "experimental free-threading build"가 출력되는지 확인.
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

또는 아래처럼 바로 Python 버전 확인
```bash
$ docker run --rm -it ${IMAGE_NAME}:${TAG} python3.13 -c "import sys; print(sys.version)"
3.13.7 experimental free-threading build (main, Aug 23 2025, 20:46:14) [GCC 14.2.0]
```

### 3. 이미지 레지스트리 푸시
```bash
docker tag ${IMAGE_NAME}:${TAG} <레지스트리주소>/${IMAGE_NAME}:${TAG}
docker push <레지스트리주소>/${IMAGE_NAME}:${TAG}
```

## Dockerfile 설명

- 빌드 단계에서 Python 3.13.7을 소스에서 빌드

## 참고

- 정적 빌드는 실패.

## 라이선스

MIT
