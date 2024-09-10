#!/bin/bash

# Default Configuration
DEFAULT_SWAP_SIZE="16G"             # Default size of the swapfile
DEFAULT_SWAPFILE_PATH="./swapfile"  # Default path for the swapfile

# Function to display help
show_help() {
    echo "Usage: $0 [-s swap_size] [-p swapfile_path]"
    echo ""
    echo "Options:"
    echo "  -s, --size        Size of the swapfile (e.g., 4G, 16G). Defaults to $DEFAULT_SWAP_SIZE."
    echo "  -p, --path        Path to create the swapfile. Defaults to $DEFAULT_SWAPFILE_PATH."
    echo "  -h, --help        Display this help message."
    echo ""
    exit 0
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -s|--size)
            SWAP_SIZE="$2"
            shift 2
            ;;
        -p|--path)
            SWAPFILE_PATH="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            ;;
    esac
done

# Use default values if not provided via CLI
SWAP_SIZE="${SWAP_SIZE:-$DEFAULT_SWAP_SIZE}"
SWAPFILE_PATH="${SWAPFILE_PATH:-$DEFAULT_SWAPFILE_PATH}"

# Check if the specified directory exists
SWAP_DIR=$(dirname "$SWAPFILE_PATH")
if [ ! -d "$SWAP_DIR" ]; then
    echo "The specified directory $SWAP_DIR does not exist. Exiting."
    exit 1
fi

# Check if swapfile already exists
if [ -f "$SWAPFILE_PATH" ]; then
    echo "Swapfile already exists at $SWAPFILE_PATH. Exiting."
    exit 1
fi

# Create the swapfile using dd (to ensure compatibility)
sudo dd if=/dev/zero of="$SWAPFILE_PATH" bs=1M count=$(echo $SWAP_SIZE | tr -d 'G' | awk '{print $1*1024}')

# Set the correct permissions
sudo chmod 600 "$SWAPFILE_PATH"

# Set up the swap space
sudo mkswap "$SWAPFILE_PATH"

# Enable the swapfile
sudo swapon "$SWAPFILE_PATH"

# Verify the swap is active
sudo swapon --show

# Display the updated swap information
free -h

echo "Swapfile of $SWAP_SIZE created and activated at $SWAPFILE_PATH."

