#!/bin/sh

docker run --runtime=nvidia \
           --device /dev/snd \
           --device /dev/i2c-7 \
           --network=host \
           --env-file .env \
           -v=/ssd/model:/model \
           -v=./voices:/usr/local/app/voices. \
           -v=./local:/root/.local \
           -v=./cache:/root/.cache \
           -t robermar2/jetson-voice-assistant:0.15