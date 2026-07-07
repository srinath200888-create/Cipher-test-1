#!/bin/bash
# cipher-knowledge setup script for Mac/Linux
# Run from your project root: bash cipher-knowledge/scripts/setup.sh

PROJECT_ROOT=$(pwd)
CIPHER_DIR="$PROJECT_ROOT/cipher-knowledge"
DOT_OPENCODE="$PROJECT_ROOT/.opencode"

echo "=== Cipher Knowledge Setup ==="
echo "Project root: $PROJECT_ROOT"
echo ""

# Check if cipher-knowledge exists
if [ ! -d "$CIPHER_DIR" ]; then
    echo "ERROR: cipher-knowledge directory not found!"
    echo "Make sure you cloned it: git clone https://github.com/srinath200888-create/cipher-knowledge"
    exit 1
fi

# Copy opencode.json if not already present
if [ ! -f "$PROJECT_ROOT/opencode.json" ]; then
    cp "$CIPHER_DIR/opencode.json" "$PROJECT_ROOT/opencode.json"
    echo "[+] Copied opencode.json to project root"
else
    echo "[~] opencode.json already exists (skipped)"
fi

# Create symlink for .opencode directory
if [ ! -d "$DOT_OPENCODE" ]; then
    ln -s "$CIPHER_DIR/.opencode" "$DOT_OPENCODE"
    echo "[+] Created .opencode symlink"
else
    echo "[~] .opencode already exists (skipped)"
fi

echo ""
echo "=== Setup Complete ==="
echo "Restart OpenCode for changes to take effect."
echo ""
echo "Try these commands in OpenCode:"
echo "  /health          - Verify everything is loaded"
echo "  @vibe-coder     - Build an app from scratch"
echo "  /suggest-stack  - Get tech stack recommendations"
