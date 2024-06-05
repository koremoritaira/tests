#!/bin/bash

# Function to fetch the content of a web page
fetch_web_page() {
    local url=$1
    echo "Fetching content from $url..."
    curl -s $url -o webpage.html
    echo "Content saved to webpage.html"
}

# Function to download a file from a given URL
download_file() {
    local file_url=$1
    local output_file=$2
    echo "Downloading file from $file_url..."
    curl -s $file_url -o $output_file
    echo "File saved as $output_file"
}

# Function to make a POST request with JSON data
post_json_data() {
    local url=$1
    local json_data=$2
    echo "Posting JSON data to $url..."
    curl -s -X POST -H "Content-Type: application/json" -d "$json_data" $url
    echo "POST request completed"
}

# Main script execution
echo "Starting script..."

# Fetch content from a web page
fetch_web_page "http://example.com"

# Download a file
download_file "http://example.com/somefile.txt" "downloaded_file.txt"

# Post JSON data
json='{"name": "John", "age": 30}'
post_json_data "http://example.com/api" "$json"

echo "Script completed."