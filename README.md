# asterisk_deb

docker build .
docker run --mount type=bind,source=$(pwd)/build,target=/usr/local/src -it IMAGE_ID


Download files from build directory