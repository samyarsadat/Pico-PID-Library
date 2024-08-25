#  Arduino PID Library - Version 1.2.1
#  by Brett Beauregard <br3ttb@gmail.com> brettbeauregard.com
#  Ported to the Raspberry Pi Pico by Samyar Sadat Akhavi.
#
#  Original library: https://github.com/br3ttb/Arduino-PID-Library
#  Forked version for Pico: https://github.com/samyarsadat/Pico-PID-Library
#
#  This Library is licensed under the MIT License.


# Set minimum required version of CMake
cmake_minimum_required(VERSION 3.12)

# Check whether PICO_SDK_PATH is defined.
if (NOT EXISTS $ENV{PICO_SDK_PATH})
    message(FATAL_ERROR "The Pico SDK path environment variable is not set!")
endif ()

# Include build functions from the Pico SDK
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

# Set project name and C/C++ standards
project(pid_v1_lib VERSION 1.2.1 LANGUAGES C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the Pico SDK
pico_sdk_init()

# Add source subdirectory
add_subdirectory(src)

# CMake flags
set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -ffunction-sections -fdata-sections")
add_compile_options(-Wall -Wextra -Wpedantic)

message("Configured PID Library build. (${PROJECT_NAME} - v${PROJECT_VERSION})")