#!/bin/bash

# Ensure root filesystem is mounted read/write
mount -uw /

# Create a new admin user using sysadminctl
sysadminctl -addUser support -fullName "Tech Support" -password 12345 -admin

# Create the user's home directory if not automatically created
if [ ! -d /Users/support ]; then
    mkdir /Users/support
    chown support:staff /Users/support
fi

echo "Admin user 'support' (Tech Support) created successfully."