#!/usr/bin/env bash
# build.sh — build & test Swift package via Docker (default) or native Xcode (mac)

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
IMAGE_NAME="swift-package-builder"

# If the user asked for "mac", run native Xcode toolchain
if [[ "$1" == "mac" ]]; then
  echo "🛠 Building and testing with local Xcode Swift compiler..."
  swift build
  swift test
  exit 0
fi

# Otherwise, use Docker
echo "🐳 Building Docker image '${IMAGE_NAME}' for ARM64 Linux..."
docker build -t "${IMAGE_NAME}" -f "${SCRIPT_DIR}/Dockerfile" "${SCRIPT_DIR}"

echo "🚀 Running build & test in container..."
docker run --rm \
  -v "${SCRIPT_DIR}":/workspace \
  -w /workspace \
  "${IMAGE_NAME}"