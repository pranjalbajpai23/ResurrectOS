#!/bin/bash

# Check if the file containing the last opened applications exists
if [ -f "last_session.txt" ]; then
    # Read the file and open the listed applications or files
    while IFS= read -r app_or_file
    do
        # Check if the item is a file
        if [ -f "$app_or_file" ]; then
            # Open the file with the default application
            xdg-open "$app_or_file" &
        else
            # Assume it's an application and try to open it
            $app_or_file &
        fi
    done < "last_session.txt"

    echo "Restored last session."
else
    echo "No previous session found."
fi
