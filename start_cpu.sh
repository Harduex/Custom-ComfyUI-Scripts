#!/bin/bash

# Useful if you don't have enoug space in your /tmp directory
TMPDIR='./.tmp'

# custom script for activating venv and starting comfyui
source .venv/bin/activate && python main.py --cpu
