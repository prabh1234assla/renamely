# !/bin/bash

# Function to rename .js to .ts
rename_js_to_ts() {
    find "$1" -type f -name "*.js" | while read -r file; do
        if [[ "$file" != */node_modules/* && "$file" != *.config.js ]]; then
            mv "$file" "${file%.js}.ts"
            echo "Renamed $file to ${file%.js}.ts"
        fi
    done
}

# Function to rename .jsx to .tsx
rename_jsx_to_tsx() {
    find "$1" -type f -name "*.jsx" | while read -r file; do
        if [[ "$file" != */node_modules/* ]]; then
            mv "$file" "${file%.jsx}.tsx"
            echo "Renamed $file to ${file%.jsx}.tsx"
        fi
    done
}

# Main function to process the directory
main() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <directory>"
        exit 1
    fi
    
    directory=$1
    
    if [ ! -d "$directory" ]; then
        echo "Error: Directory $directory does not exist."
        exit 1
    fi
    
    rename_js_to_ts "$directory"
    rename_jsx_to_tsx "$directory"
    
    echo "Renaming completed."
}

# Execute the main function with the provided argument
main "$1"
