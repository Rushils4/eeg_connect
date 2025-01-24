cmake_minimum_required(VERSION 3.16)

project(eeg_connect_backend LANGUAGES CXX OBJC OBJCXX)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_COMPILER "clang++")
set(CMAKE_OBJCXX_COMPILER "clang++")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_OBJCXX_STANDARD 17)
set(CMAKE_OBJCXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -x objective-c++")

set(LIBRARY_VERSION 0.0.1)

include_directories(${PROJECT_SOURCE_DIR}/includes)
include_directories(${CMAKE_SOURCE_DIR}/libbluetoothserialport/includes)

# Add the static library
add_library(bluetoothserialport STATIC IMPORTED)
set_target_properties(bluetoothserialport PROPERTIES
    IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libbluetoothserialport/libbluetoothserialport.a
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/libbluetoothserialport/includes;${CMAKE_SOURCE_DIR}/libbluetoothserialport/includes/osx"
)

set(SOURCES
    src/channel.cpp
    src/headset.cpp
)

set_source_files_properties(
    src/channel.cpp PROPERTIES LANGUAGE OBJCXX
    src/headset.cpp PROPERTIES LANGUAGE OBJCXX
)

add_library(eeg_connect SHARED ${SOURCES})

# Link against the static library
find_library(FOUNDATION_FRAMEWORK Foundation)
find_library(APPKIT_FRAMEWORK AppKit)

target_link_libraries(eeg_connect 
                      PRIVATE bluetoothserialport
                      ${FOUNDATION_FRAMEWORK}
                      ${APPKIT_FRAMEWORK})

set_target_properties(eeg_connect PROPERTIES VERSION 0.0.1 SOVERSION 0.0.1)

# Mark btScan as an imported executable
add_executable(btScan IMPORTED)
set_target_properties(btScan PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libbluetoothserialport/btScan)

install(TARGETS eeg_connect DESTINATION lib)
install(PROGRAMS ${CMAKE_SOURCE_DIR}/libbluetoothserialport/btScan DESTINATION lib)  # Install btScan
install(DIRECTORY includes/ DESTINATION include)
install(DIRECTORY eeg_data/ DESTINATION data)

export(TARGETS eeg_connect FILE ${PROJECT_BINARY_DIR}/eeg_connect_backend.cmake)