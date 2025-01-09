#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the path to the configuration file relative to the script directory
CONFIG_FILE="$SCRIPT_DIR/../config_files/product_init.json"

# Function that check and validate arguments provided
check_args() {
    if [ $# -eq 0 ]; then
        echo "Error: No arguments provided."
        echo "Usage for initalization: $0 initialize_with_config"
        echo "Usage: $0 new_with_config <product_name> <one or more services>"
        exit 1
    fi

    if [ "$1" != "initialize_with_config" ] && [ "$1" != "new_with_config" ]; then
        echo "Error: Invalid argument '$1'."
        echo "Please use one of the following arguments:"
        echo "  - initialize_with_config"
        echo "  - new_with_config"
        exit 1
    fi

    if [ "$1" = "new_with_config" ]; then
        if [ $# -lt 3 ]; then
            echo "Erorr: please provide product name and at least one service"
            echo "Usage: $0 new_with_config <product_name> <one or more services>"
            exit 1
        fi
    fi
}

generate_structure() {
    local product="$1"
    shift
    local services=("$@")

    echo "Creating the file structure for product: $product"
    for service in "${services[@]}"; do

        echo "  Adding service: $service"
        service_dir="knowledge_by_product/$product/$service"
        mkdir -p "$service_dir/Architecture"
        mkdir -p "$service_dir/Examples"
        mkdir -p "$service_dir/Policies"

        # Create common files
        echo "# Overview of $service" > "$service_dir/README.md"
        # touch "$service_dir/Architecture/${service}-architecture.drawio"
        touch "$service_dir/Examples/${service,,}-cli-scripts.md"
        touch "$service_dir/Examples/${service,,}-sdk-example.py"
        touch "$service_dir/Examples/terraform-example.tf"
        touch "$service_dir/Policies/${service,,}-iam-policy.json"
        echo "# Certification-specific notes and tips for $service" > "$service_dir/Exam-Notes.md"
    done
}

# Function to handle initialize_with_config
initialize_with_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: Configuration file $CONFIG_FILE not found."
        exit 1
    fi

    # Parse JSON config and create structure
    products=$(jq -r 'keys[]' "$CONFIG_FILE")
    for product in $products; do
        services=$(jq -r ".\"$product\".services | keys[]" "$CONFIG_FILE")
        generate_structure "$product" $services
    done
}

# Function to handle new_with_config
new_with_config() {
    local product="$1"
    shift
    local services=("$@")

    generate_structure "$product" $services
}

# validate arguments
check_args "$@"

# Main script logic
case "$1" in
    "initialize_with_config")
        initialize_with_config
        ;;
    "new_with_config")
        shift
        new_with_config "$@"
        ;;
    *)
esac