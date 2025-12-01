#!/bin/bash
set -e

echo "🚀 Pushing all template submodules to origin main"
echo "=================================================="

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find all directories ending with -template
for template_dir in "$SCRIPT_DIR"/*-template; do
  if [ -d "$template_dir" ]; then
    template_name=$(basename "$template_dir")
    echo ""
    echo "📦 Processing $template_name..."
    
    cd "$template_dir"
    
    echo "   Pushing to origin main..."
    git push origin main -f
    echo "   ✅ Successfully pushed $template_name"
    
    cd "$SCRIPT_DIR"
  fi
done

echo ""
echo "✨ All template submodules pushed successfully!"

