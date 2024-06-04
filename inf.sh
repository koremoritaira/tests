#!/bin/bash

# Script to get information about koremori.com

DOMAIN="koremori.tech"

echo "Gathering information for $DOMAIN..."
echo

# Check if necessary tools are installed
REQUIRED_TOOLS=("whois" "dig" "curl")
for TOOL in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v $TOOL &> /dev/null; then
        echo "Error: $TOOL is not installed. Please install it and try again."
        exit 1
    fi
done

# Get domain WHOIS information
echo "WHOIS information:"
whois $DOMAIN
echo

# Get DNS records
echo "DNS records:"
dig +short ANY $DOMAIN
echo

# Get website HTTP headers
echo "HTTP headers:"
curl -I $DOMAIN
echo

# Get website content (first 20 lines)
echo "Website content (first 20 lines):"
curl -s $DOMAIN | head -n 20
echo

echo "Information gathering complete."