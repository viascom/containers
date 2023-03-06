# containers
Viascom container images


docker build \
--tag viascom/alpine:3.17.2 \
--rm \
.

docker build \
--tag viascom/jdk:1.0.0 \
--rm \
.

docker build \
--tag viascom/postgres:1.0.0 \
--pull \
--rm \
.