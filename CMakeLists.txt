cmake_minimum_required(VERSION 3.20)

project(AlphaRemovalCpp VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(alpha_removal
    src/main.cpp
)

include(CTest)

if(BUILD_TESTING)
    include(FetchContent)

    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
    )

    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    FetchContent_MakeAvailable(googletest)

    add_executable(alpha_removal_tests
        tests/test1.cpp
    )

    target_link_libraries(alpha_removal_tests
        PRIVATE
            GTest::gtest_main
    )

    include(GoogleTest)
    gtest_discover_tests(alpha_removal_tests)
endif()