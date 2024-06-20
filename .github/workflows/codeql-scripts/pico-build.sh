#!/bin/bash
#  Arduino PID Library - Version 1.2.1
#  by Brett Beauregard <br3ttb@gmail.com> brettbeauregard.com
#  Ported to the Raspberry Pi Pico by Samyar Sadat Akhavi.
#
#  See https://github.com/samyarsadat/ROS-Robot for more information about this script.
#
#  Original library: https://github.com/br3ttb/Arduino-PID-Library
#  Forked version for Pico: https://github.com/samyarsadat/Pico-PID-Library
#
#  This Library is licensed under the MIT License.

set -e

# Get arguments
SOURCE_DIR=$1
OUTPUT_DIR="build"
BOARD_NAME="pico"
CMAKE_ARGS=""
MAKEFILES_GENERATOR="Unix Makefiles"

# Validate arguments
if [ -z "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory not provided."
    exit 1
fi

if [ -z "$OUTPUT_DIR" ]; then
    echo "ERROR: Output directory not provided."
    exit 1
fi

if [ -z "$BOARD_NAME" ]; then
    BOARD_NAME="pico"
fi

if [ -z "$MAKEFILES_GENERATOR" ]; then
    MAKEFILES_GENERATOR="Ninja"
fi

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory does not exist."
    exit 1
fi

# Make paths absolute
OUTPUT_DIR_RELATIVE="$SOURCE_DIR/$OUTPUT_DIR"
SOURCE_DIR="$GITHUB_WORKSPACE/$SOURCE_DIR"
OUTPUT_DIR="$SOURCE_DIR/$OUTPUT_DIR"

# Echo arguments
echo "Configuration:"
echo "SOURCE_DIR=$SOURCE_DIR"
echo "OUTPUT_DIR=$OUTPUT_DIR"
echo "BOARD_NAME=$BOARD_NAME"
echo "CMAKE_ARGS=$CMAKE_ARGS"
echo "MAKEFILES_GENERATOR=$MAKEFILES_GENERATOR"

# Build the project
echo "Generating build files..."
mkdir "$OUTPUT_DIR" && cd "$OUTPUT_DIR"
cmake -DPICO_BOARD="$BOARD_NAME" -S "$SOURCE_DIR" -B "$OUTPUT_DIR" -G "$MAKEFILES_GENERATOR" $CMAKE_ARGS

echo "Building project..."
cd "$OUTPUT_DIR" && make -j$(nproc)