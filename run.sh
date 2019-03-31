#!/bin/bash
set -e
IMAGE_NAME="lutris"
docker build -t ${IMAGE_NAME} .
x11docker --gpu --home --clipboard --pulseaudio ${IMAGE_NAME}