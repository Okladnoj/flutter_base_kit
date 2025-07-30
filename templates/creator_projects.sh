#!/bin/bash

# Run command: [bash creator_projects.sh]

# 1.1. Create plugin with all platforms
flutter create \
  --org com.base.kit \
  --template=plugin \
  --platforms=android,ios,web,windows,linux,macos \
  base_kit_package

# 1.2. Tester (empty application)
flutter create \
  --org com.base.kit \
  --template=app \
  --empty \
  base_kit_tester
