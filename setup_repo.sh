#!/bin/bash

# Define the main directories for your protocols
directories=(
    "protocols/media_analysis"
    "protocols/style_generation"
    "protocols/journaling"
    "protocols/system_prompts"
    "templates"
)

# Create the directories
for dir in "${directories[@]}"; do
    mkdir -p "$dir"
    echo "Created directory: $dir"
done

# Create a baseline template file
cat <<EOF > templates/base_protocol_template.md
# Protocol Name: [Name]
**Version:** 1.0
**Trigger Phrase:** [Trigger]

## Variables Required
* [Variable 1]
* [Variable 2]

## Execution Sequence
1. Step one
2. Step two
EOF

echo "Repository scaffolding complete."
