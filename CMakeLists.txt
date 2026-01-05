cmake_minimum_required(VERSION 3.10)

# Menghilangkan warning CMP0074 dari OpenCV/vcpkg
cmake_policy(SET CMP0074 NEW)

project(cpp-scope)

set(CMAKE_CXX_STANDARD 17)

# Cari OpenCV
find_package(OpenCV REQUIRED)

include_directories(include ${OpenCV_INCLUDE_DIRS})

# Pastikan file .cpp ada di folder src/
file(GLOB SOURCES "src/*.cpp")

# Kita beri nama executable 'cpp-scope' agar sama dengan nama folder
add_executable(cpp-scope ${SOURCES})

# Link OpenCV
target_link_libraries(cpp-scope ${OpenCV_LIBS})