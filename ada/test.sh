#!/bin/bash

echo "Running Ada unit tests with Docker..."
docker build -t ada-project .
docker run --rm ada-project ./bin/test_runner