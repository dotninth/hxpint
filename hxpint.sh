#!/bin/bash

# Check if Laravel Pint is installed
if ! composer global show laravel/pint >/dev/null 2>&1; then
    echo "Laravel Pint is not installed."
    read -p "Would you like to install it now? (Y/N): " choice
    case "$choice" in
        [Yy]*)
            composer global require laravel/pint
            ;;
        [Nn]*)
            echo "Laravel Pint is required for formatting. Exiting..."
            exit 1
            ;;
        *)
            echo "Invalid input. Exiting..."
            exit 1
            ;;
    esac
fi

show_usage() {
    echo "Usage:" >&2
    echo "  $0 <file>          # Format file" >&2
    echo "  $0 --stdin         # Format code from stdin" >&2
    exit 1
}

tmp_dir=$(mktemp -d)
tmp_file="$tmp_dir/temp.php"

cleanup() {
    rm -rf "$tmp_dir"
}

trap cleanup EXIT

if [ "$1" == "--stdin" ]; then
    # Read from stdin
    cat > "$tmp_file"
elif [ $# -eq 1 ] && [ -f "$1" ]; then
    # Copy input file to temporary directory
    cp "$1" "$tmp_file"
else
    show_usage
fi

pint "$tmp_file" -q

cat "$tmp_file"

