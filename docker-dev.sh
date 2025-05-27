#!/bin/sh
export INPUT_DEVICE=/dev/snd/controlC0
export OUTPUT_DEVICE=/dev/snd/controlC0
export CONTEXT_LENGTH=340
export VOCALIZER_CLASS=CoquiTTS
export WHISPER_MODEL=base
export LM_MODEL=mistral-7b-openorca.Q2_K.gguf
export WAKE_WORD=jenkins

docker run --runtime=nvidia \
           --device /dev/snd \
           --device /dev/i2c-7 \
           --network=host \
           -v=./model:/ssd/model \
           -v=./voices:/usr/local/app/voices \
           -v=./start-voice-assistant.py:/usr/local/app/start-voice-assistant.py \
           -v=./coqui_tts.py:/usr/local/app/conqui_tts.py \
           -v=./local:/root/.local \
           -v=./cache:/root/.cache \
           -it docker.io/robermar2/jetson-voice-assistant:0.1 /bin/bash

