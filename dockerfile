# Use the official Swift Docker image (multi-arch, includes ARM64)
FROM swift:latest

# Create and set working directory
WORKDIR /workspace

# Copy your Package manifest and source
# (leverage Docker layer cache: first copy only Package.swift + Package-related files)
COPY Package.* ./
RUN swift package resolve

# Now copy the rest of your sources
COPY . .

# Build and test (disable sandbox on Linux for Docker)
CMD ["bash", "-lc", "swift build --disable-sandbox -q && swift test --disable-sandbox"]