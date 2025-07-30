#!/bin/bash

# Flutter App Template Generator
# This script creates a new Flutter app from the template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 <app_name> [options]"
    echo ""
    echo "Arguments:"
    echo "  app_name    Name of the new Flutter app"
    echo ""
    echo "Options:"
    echo "  -h, --help  Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 my_awesome_app"
}

# Function to validate app name
validate_app_name() {
    local app_name=$1
    
    # Check if app name is provided
    if [ -z "$app_name" ]; then
        print_error "App name is required"
        show_usage
        exit 1
    fi
    
    # Check if app name contains only lowercase letters, numbers, and underscores
    if [[ ! "$app_name" =~ ^[a-z][a-z0-9_]*$ ]]; then
        print_error "App name must start with a lowercase letter and contain only lowercase letters, numbers, and underscores"
        exit 1
    fi
    
    # Check if directory already exists
    if [ -d "$app_name" ]; then
        print_error "Directory '$app_name' already exists"
        exit 1
    fi
}

# Function to replace placeholders in files
replace_placeholders() {
    local app_name=$1
    local app_name_upper=$(echo "$app_name" | tr '[:lower:]' '[:upper:]')
    local app_name_title=$(echo "$app_name" | sed 's/_/ /g' | sed 's/\b\w/\U&/g')
    
    print_info "Replacing placeholders with app name: $app_name"
    
    # Find and replace in all files
    find "$app_name" -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.json" -o -name "*.md" \) -exec sed -i '' \
        -e "s/app_template/$app_name/g" \
        -e "s/APP_TEMPLATE/$app_name_upper/g" \
        -e "s/App Template/$app_name_title/g" \
        {} +
}

# Function to update pubspec.yaml
update_pubspec() {
    local app_name=$1
    local pubspec_file="$app_name/pubspec.yaml"
    
    print_info "Updating pubspec.yaml"
    
    # Update the name field
    sed -i '' "s/name: app_template/name: $app_name/" "$pubspec_file"
    
    # Update the description
    local app_name_title=$(echo "$app_name" | sed 's/_/ /g' | sed 's/\b\w/\U&/g')
    sed -i '' "s/description: \"Flutter app template with base structure\"/description: \"$app_name_title - Flutter application\"/" "$pubspec_file"
    
    # Remove the flutter_base_kit dependency
    sed -i '' '/# Flutter Base Kit/,+2d' "$pubspec_file"
}

# Function to clean up template-specific files
cleanup_template_files() {
    local app_name=$1
    
    print_info "Cleaning up template-specific files"
    
    # Remove template-specific files and directories
    rm -rf "$app_name/.dart_tool"
    rm -rf "$app_name/build"
    rm -f "$app_name/pubspec.lock"
    rm -f "$app_name/app_template.iml"
    
    # Remove generated files that will be regenerated
    find "$app_name" -name "*.g.dart" -delete
    find "$app_name" -name "*.freezed.dart" -delete
    find "$app_name" -name "*.config.dart" -delete
    find "$app_name" -name "*.gr.dart" -delete
}

# Function to create README for the new app
create_readme() {
    local app_name=$1
    local app_name_title=$(echo "$app_name" | sed 's/_/ /g' | sed 's/\b\w/\U&/g')
    local readme_file="$app_name/README.md"
    
    print_info "Creating README.md"
    
    cat > "$readme_file" << EOF
# $app_name_title

A Flutter application built with the Flutter Base Kit template.

## Features

- **State Management**: Provider pattern for state management
- **Dependency Injection**: GetIt for dependency injection
- **Routing**: AutoRoute for navigation
- **Network**: Dio + Retrofit for API calls
- **Models**: Freezed for immutable data classes
- **Localization**: Multi-language support
- **Themes**: Light and dark theme support
- **Asset Generation**: Flutter Gen for asset management

## Getting Started

1. Install dependencies:
   \`\`\`bash
   flutter pub get
   \`\`\`

2. Generate code:
   \`\`\`bash
   flutter packages pub run build_runner build
   \`\`\`

3. Run the app:
   \`\`\`bash
   flutter run
   \`\`\`

## Project Structure

\`\`\`
lib/
├── api/           # API services and network layer
├── base/          # Base classes and utilities
├── config/        # App configuration
├── core/          # Core functionality and providers
├── di/            # Dependency injection setup
├── l10n/          # Localization files
├── models/        # Data models
├── routes/        # App routing
├── services/      # Business logic services
├── themes/        # App themes
├── ui/            # UI components and pages
└── utils/         # Utility functions
\`\`\`

## Development

This app was created using the Flutter Base Kit template. For more information about the template, visit the [Flutter Base Kit repository](https://github.com/Okladnoj/flutter_base_kit).

## License

This project is licensed under the MIT License.
EOF
}

# Main function
main() {
    # Parse command line arguments
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        show_usage
        exit 0
    fi
    
    local app_name=$1
    
    # Validate app name
    validate_app_name "$app_name"
    
    print_info "Creating new Flutter app: $app_name"
    
    # Get the directory where this script is located
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local template_dir="$script_dir/../templates/app_template"
    
    # Check if template directory exists
    if [ ! -d "$template_dir" ]; then
        print_error "Template directory not found: $template_dir"
        exit 1
    fi
    
    # Copy template to new app directory
    print_info "Copying template files..."
    cp -r "$template_dir" "$app_name"
    
    # Replace placeholders
    replace_placeholders "$app_name"
    
    # Update pubspec.yaml
    update_pubspec "$app_name"
    
    # Clean up template-specific files
    cleanup_template_files "$app_name"
    
    # Create README
    create_readme "$app_name"
    
    print_success "Flutter app '$app_name' created successfully!"
    print_info "Next steps:"
    print_info "1. cd $app_name"
    print_info "2. flutter pub get"
    print_info "3. flutter packages pub run build_runner build"
    print_info "4. flutter run"
}

# Run main function with all arguments
main "$@" 