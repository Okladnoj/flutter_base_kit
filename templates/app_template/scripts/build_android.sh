#!/bin/bash

# Run command: bash build_android.sh
# Make executable: chmod +x build_android.sh

echo "Starting Android build..."

# Get current build timestamp (seconds since epoch)
BUILD_TIMESTAMP=$(date +%s)
echo "Build timestamp: $BUILD_TIMESTAMP"

# Ask for build type (APK or App Bundle)
read -p "Select build type: 1 for APK, 2 for App Bundle [default: 1]: " CHOICE
CHOICE=${CHOICE:-1}

# Prepare project
flutter clean
flutter pub get

# Execute build with BUILD_TIMESTAMP define
if [ "$CHOICE" = "2" ]; then
  echo "Running appbundle build..."
  flutter build appbundle --release \
    --dart-define="BUILD_TIMESTAMP=$BUILD_TIMESTAMP"
else
  echo "Running apk build..."
  flutter build apk --release \
    --dart-define="BUILD_TIMESTAMP=$BUILD_TIMESTAMP"
fi

echo "Build completed."
