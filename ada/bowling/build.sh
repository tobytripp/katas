#!/bin/bash

echo "Building Ada project with Docker..."
docker build -t ada-project .

echo "Build complete!"
echo "To run: ./run.sh"
echo "For development: docker-compose run ada-dev"