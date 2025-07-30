#!/bin/bash

# Run command: bash build_ios.sh
# Make executable: chmod +x build_ios.sh

echo "Starting iOS build..."

# Get current build timestamp (seconds since epoch)
BUILD_TIMESTAMP=$(date +%s)
echo "Build timestamp: $BUILD_TIMESTAMP"

# Clean project and fetch dependencies
flutter clean
flutter pub get

# Configure iOS project with BUILD_TIMESTAMP injected
flutter build ios --config-only \
    --release \
    --dart-define="BUILD_TIMESTAMP=$BUILD_TIMESTAMP"

# Open Xcode workspace for archiving and publishing
open ios/Runner.xcworkspace

echo "Configuration completed. You can now archive and publish from Xcode."
