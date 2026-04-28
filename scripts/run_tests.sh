#!/usr/bin/env bash

set -euo pipefail

BUILD_DIR="build-test"

if [[ "${1:-}" == "clean" ]]; then
    echo "Removing test build directory..."
    rm -rf "$BUILD_DIR"
fi

echo "Configuring test build..."
cmake -S . -B "$BUILD_DIR" -DBUILD_TESTING=ON

echo "Building test build..."
cmake --build "$BUILD_DIR" --parallel

echo "Running tests..."
ctest --test-dir "$BUILD_DIR" --output-on-failure