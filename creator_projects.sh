#!/bin/bash

# Run command: [bash creator_projects.sh]

# 1.1. Create plugin with all platforms
# flutter create \
#   --org com.okji \
#   --template=package \
#   --platforms=android,ios,web,windows,linux,macos \
#   flutter_base_kit

# 1.2. Tester (empty application)
flutter create \
  --org com.okji \
  --template=app \
  --empty \
  example
