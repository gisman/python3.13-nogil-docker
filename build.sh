IMAGE_NAME="python3.13t"
TAG="202508"

# 빌드
echo "Docker 이미지 빌드 중..."
docker build -t ${IMAGE_NAME}:${TAG} .

# Tag the image for the local registry
# docker tag ${IMAGE_NAME}:${TAG} localhost:5300/${IMAGE_NAME}:${TAG}

# Push the image to the local registry
# docker push localhost:5300/${IMAGE_NAME}:${TAG}


# Pull test

# docker pull localhost:5300/${IMAGE_NAME}:${TAG}
# docker pull docker.gimi9.com/geocoder-api:latest
