# Basic CMakeLists.txt

project(mooncake)

# Src files
file(GLOB_RECURSE MOONCAKE_SRCS
    ${MOONCAKE_ROOT_DIR}/src/*.c
    ${MOONCAKE_ROOT_DIR}/src/*.cc
    ${MOONCAKE_ROOT_DIR}/src/*.cpp
)
# Include
set(MOONCAKE_INCS
    ${MOONCAKE_ROOT_DIR}/src/
)


add_library(${PROJECT_NAME} ${MOONCAKE_SRCS})
target_include_directories(${PROJECT_NAME} PUBLIC ${MOONCAKE_INCS})


option(MOONCAKE_BUILD_EXAMPLE "Build example" ON)


# Example
if(MOONCAKE_BUILD_EXAMPLE)
    add_subdirectory(./example/)
endif()



# CTest
enable_testing()

# Basic
add_test(basic example/basic)