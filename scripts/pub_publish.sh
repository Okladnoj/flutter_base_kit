#!/bin/bash

# Run command: [bash pub_publish.sh]

# This script is intended for publishing flutter_base_kit on pub.dev.
# Before publishing, the script performs code analysis, tests, package verification, and code formatting.

# Change to the root directory of the project
cd "$(dirname "$0")/.."



# Your comments for the changelog split by "/"
comments=(
  "Remove unnecessary dependencies from main package to keep it lightweight"
  "Ensure compatibility between main package and all templates"
  "Update build_runner to ^2.4.8 for better compatibility"
  "Fix dependency conflicts between templates and main package"
)

# Increment the version number
echo -e "\033[32mIncrementing the version number...\033[0m"

# Increment version in pubspec.yaml
awk -F'.' -v OFS='.' '/version:/{++$3}1' pubspec.yaml > temp && mv temp pubspec.yaml

# Extract new version from pubspec.yaml
new_version=$(awk -F' ' '/version:/{print $2}' pubspec.yaml)

echo -e "\033[32mNew version: $new_version\033[0m"

# Update version in README.md (if it contains version references)
if grep -q "flutter_base_kit.*[0-9]\+\.[0-9]\+\.[0-9]\+" README.md; then
    sed -i '' "s/flutter_base_kit.*[0-9]\+\.[0-9]\+\.[0-9]\+/flutter_base_kit $new_version/g" README.md
    echo -e "\033[32mUpdated version in README.md\033[0m"
fi

# Update version in all template pubspec.yaml files
echo -e "\033[32mUpdating versions in templates...\033[0m"

# Update base_kit_app template
if [ -f "templates/base_kit_app/pubspec.yaml" ]; then
    sed -i '' "s/flutter_base_kit: \^[0-9]*\.[0-9]*\.[0-9]*/flutter_base_kit: ^$new_version/g" templates/base_kit_app/pubspec.yaml
    echo -e "\033[32mUpdated templates/base_kit_app/pubspec.yaml\033[0m"
fi

# Update base_kit_package template
if [ -f "templates/base_kit_package/pubspec.yaml" ]; then
    sed -i '' "s/flutter_base_kit: \^[0-9]*\.[0-9]*\.[0-9]*/flutter_base_kit: ^$new_version/g" templates/base_kit_package/pubspec.yaml
    echo -e "\033[32mUpdated templates/base_kit_package/pubspec.yaml\033[0m"
fi

# Update base_kit_tester template
if [ -f "templates/base_kit_tester/pubspec.yaml" ]; then
    sed -i '' "s/flutter_base_kit: \^[0-9]*\.[0-9]*\.[0-9]*/flutter_base_kit: ^$new_version/g" templates/base_kit_tester/pubspec.yaml
    echo -e "\033[32mUpdated templates/base_kit_tester/pubspec.yaml\033[0m"
fi

# Update CHANGELOG.md
echo -e "\033[32mUpdating CHANGELOG.md...\033[0m"

# Create changelog entry
changelog_entry="## $new_version

"
for comment in "${comments[@]}"; do
    changelog_entry+="- $comment
"
done
changelog_entry+="
"

# Create temporary file with new changelog entry
echo "$changelog_entry" > temp_changelog.md
cat CHANGELOG.md >> temp_changelog.md
mv temp_changelog.md CHANGELOG.md

echo -e "\033[32mUpdated CHANGELOG.md\033[0m"

# Run code analysis
echo -e "\033[32mRunning code analysis...\033[0m"
flutter analyze

# Run tests (if any)
echo -e "\033[32mRunning tests...\033[0m"
flutter test

# Format code
echo -e "\033[32mFormatting code...\033[0m"
dart format .

# Dry run to check for issues
echo -e "\033[32mRunning dry-run...\033[0m"
flutter pub publish --dry-run

# Ask for confirmation
echo -e "\033[33mDo you want to publish flutter_base_kit $new_version to pub.dev? (y/N)\033[0m"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    # Commit changes first
    echo -e "\033[32mCommitting changes...\033[0m"
    git add .
    git commit -m "Release $new_version
    
$(for comment in "${comments[@]}"; do echo "- $comment"; done)"
    
    # Create git tag
    echo -e "\033[32mCreating git tag...\033[0m"
    git tag -a "v$new_version" -m "Release $new_version"
    
    # Push changes to remote
    echo -e "\033[32mPushing changes to remote...\033[0m"
    git push && git push --tags
    
    if [ $? -ne 0 ]; then
        echo -e "\033[31m❌ Failed to push changes to remote\033[0m"
        echo -e "\033[33mPlease push manually: git push && git push --tags\033[0m"
        exit 1
    fi
    
    # Now publish to pub.dev
    echo -e "\033[32mPublishing to pub.dev...\033[0m"
    flutter pub publish
    
    if [ $? -eq 0 ]; then
        echo -e "\033[32m✅ Successfully published flutter_base_kit $new_version!\033[0m"
        echo -e "\033[32m✅ Release $new_version completed successfully!\033[0m"
        echo -e "\033[32m📋 Next steps:\033[0m"
        echo -e "\033[32m   - Update global installation: dart pub global activate flutter_base_kit\033[0m"
        echo -e "\033[32m   - Package will be available on pub.dev in 5-10 minutes\033[0m"
    else
        echo -e "\033[31m❌ Failed to publish package\033[0m"
        echo -e "\033[33mChanges have been committed and pushed, but package publishing failed\033[0m"
        exit 1
    fi
else
    echo -e "\033[33mPublishing cancelled\033[0m"
    exit 0
fi
