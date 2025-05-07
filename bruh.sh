#!/bin/bash

# Define variables
USERNAME="support"
FULLNAME="Support Account"
PASSWORD="12345"
USERID="501"
GROUPID="80"
HOMEDIR="/Users/$USERNAME"

# Create the user
dscl . -create /Users/$USERNAME
dscl . -create /Users/$USERNAME UserShell /bin/bash
dscl . -create /Users/$USERNAME RealName "$FULLNAME"
dscl . -create /Users/$USERNAME UniqueID "$USERID"
dscl . -create /Users/$USERNAME PrimaryGroupID "$GROUPID"
dscl . -create /Users/$USERNAME NFSHomeDirectory "$HOMEDIR"
dscl . -passwd /Users/$USERNAME "$PASSWORD"

# Add to admin group
dscl . -append /Groups/admin GroupMembership $USERNAME

# Create home directory if it doesn't exist
if [ ! -d "$HOMEDIR" ]; then
    mkdir "$HOMEDIR"
    chown "$USERNAME":staff "$HOMEDIR"
fi

echo "Admin user '$USERNAME' created successfully."