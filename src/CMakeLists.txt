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

# Add source files
add_library(${PROJECT_NAME} PID_v1.c++)

# Include header files
target_include_directories(${PROJECT_NAME} PUBLIC ../include)

# Link to libraries
target_link_libraries(${PROJECT_NAME} pico_stdlib)