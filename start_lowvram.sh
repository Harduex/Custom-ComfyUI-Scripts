#!/bin/bash
# Custom script for activating the virtual environment and starting comfyui

# Useful if you don't have enoug space in your /tmp directory
TMPDIR='./.tmp'

# Create the virtual environment if it doesn't exist already
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
fi

# Activate the virtual environment and start comfyui
source .venv/bin/activate
python main.py --lowvram
