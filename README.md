# Custom ComfyUI Scripts

These custom ComfyUI starting scripts (.sh) are designed to make it easier to start the ComfyUI application with different configurations. To use them, follow the steps below:

1. Make sure you have ComfyUI installed on your system.
2. Download the scripts from this repository.
3. Place all the starting scripts in the root folder of your ComfyUI installation.
```bash
cp ./start*.sh <path_to_comfyui>
```

## Available Scripts

1. `start.sh`: This script starts the ComfyUI application using the GPU (default).
2. `start_cpu.sh`: This script starts the ComfyUI application using the CPU.
3. `start_lowvram.sh`: This script starts the ComfyUI application with low VRAM usage. (Useful for running large models with limited VRAM).
4. `add_swap.sh`: This script adds a temporary swap file to the system. (Useful for running large models with limited RAM).
5. `remove_swap.sh`: This script removes the temporary swap file from the system.

## Usage

If the scripts are not executable, run the following command in the terminal:
```bash
chmod +x ./*.sh
```

Open a terminal and navigate to the root folder of your ComfyUI installation. Then, run the desired script using the following command:

```bash
./<script_name>.sh
```

Replace `<script_name>` with the name of the script you want to execute.

Please note that all of these scripts are creating python virtual environment and installing all the required packages automatically. Feel free to modify the scripts to suit your specific needs. I am always accepting pull requests and feedback to improve the scripts. 
