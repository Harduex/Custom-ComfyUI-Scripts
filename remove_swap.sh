#!/bin/bash

# Default Configuration
DEFAULT_SWAPFILE_PATH="./swapfile" # Default path for the swapfile

# Function to display help
show_help() {
    echo "Usage: $0 [-p swapfile_path]"
    echo ""
    echo "Options:"
    echo "  -p, --path        Path of the swapfile to remove. Defaults to $DEFAULT_SWAPFILE_PATH."
    echo "  -h, --help        Display this help message."
    echo ""
    exit 0
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
    -p | --path)
        SWAPFILE_PATH="$2"
        shift 2
        ;;
    -h | --help)
        show_help
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        ;;
    esac
done

# Use default value if not provided via CLI
SWAPFILE_PATH="${SWAPFILE_PATH:-$DEFAULT_SWAPFILE_PATH}"

# Check if the swapfile exists
if [ ! -f "$SWAPFILE_PATH" ]; then
    echo "Swapfile $SWAPFILE_PATH does not exist. Exiting."
    exit 1
fi

# Disable the swapfile
sudo swapoff "$SWAPFILE_PATH"

# Remove the swapfile
sudo rm "$SWAPFILE_PATH"

# Verify that the swapfile is removed
if [ ! -f "$SWAPFILE_PATH" ]; then
    echo "Swapfile $SWAPFILE_PATH has been removed successfully."
else
    echo "Failed to remove swapfile $SWAPFILE_PATH."
    exit 1
fi

# Display the updated swap information
sudo swapon --show
free -h
