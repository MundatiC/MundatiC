#!/bin/bash

# Define the path to the README file
README="$(readlink -f ~/Desktop/Projects/Llawi/README.md)"

# Define a temporary file
TEMP_README="$(mktemp --tmpdir="$(dirname "$README")")"

# Check if "Hello, guys!" exists in the file
if grep -q "Hello, guys!" "$README"; then
    # Replace "Hello, guys!" with "Hello, folks!"
    sed 's/Hello, guys!/Hello, folks!/' "$README" > "$TEMP_README"
else
    # Replace "Hello, folks!" with "Hello, guys!"
    sed 's/Hello, folks!/Hello, guys!/' "$README" > "$TEMP_README"
fi

# Overwrite the original file with the temp file
mv "$TEMP_README" "$README"

# Add and commit changes
if ! git diff --quiet; then
    git add "$README"
    git commit -m "Update README"
else
    echo "No changes to commit."
fi

# Push changes
if git diff --quiet origin/main; then
    git push origin main
else
    echo "Local branch is not up-to-date with remote. Aborting push."
fi