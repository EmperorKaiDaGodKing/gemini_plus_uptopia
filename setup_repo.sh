#!/bin/bash
set -e

echo "Setting up repository directory structure..."

# Create directory hierarchy
directories=(
    "protocols/media_analysis"
    "protocols/style_generation"
    "protocols/journaling"
    "protocols/system_prompts"
    "scripts"
    "schemas"
    "templates"
    "tests"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
    echo "Created directory: $dir"
done

# Initialize Python dependency tracking file
if [ ! -f "requirements.txt" ]; then
    cat <<EOF > requirements.txt
pydantic>=2.0.0
pyyaml>=6.0
pytest>=7.0.0
EOF
    echo "Created requirements.txt"
fi

# Initialize Node.js package setup
if [ ! -f "package.json" ]; then
    cat <<EOF > package.json
{
  "name": "ai-protocol-runner",
  "version": "1.0.0",
  "description": "Execution scripts and protocol definitions for AI automation.",
  "main": "scripts/index.js",
  "scripts": {
    "start": "node scripts/index.js",
    "test": "pytest"
  },
  "dependencies": {}
}
EOF
    echo "Created package.json"
fi

# Create default protocol schema template
cat <<EOF > templates/base_protocol.json
{
  "protocol_id": "example_protocol_v1",
  "title": "Example Protocol",
  "version": "1.0",
  "variables": [
    "input_text",
    "mode"
  ],
  "steps": [
    "Validate input variables",
    "Format execution prompt",
    "Return output payload"
  ]
}
EOF

# Install initial Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

echo "Repository initialization complete!"
