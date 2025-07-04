#!/bin/bash

# ========================================
# PlantUML Exporter Installation Script
# Version: 1.0.0
# Author: Michael Pham
# ========================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.plantuml-exporter"

echo "🚀 Installing PlantUML Exporter..."

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "⚠️  This script should not be run as root"
    echo "   Please run without sudo. The script will ask for permission when needed."
    exit 1
fi

# Check Java installation
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    echo "   Please install Java 8+ before proceeding"
    echo "   macOS: brew install openjdk@11"
    echo "   Linux: sudo apt-get install openjdk-11-jre"
    exit 1
fi

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | sed 's/^1\.//' | cut -d'.' -f1)
if [[ $JAVA_VERSION -lt 8 ]]; then
    echo "❌ Java version $JAVA_VERSION is too old"
    echo "   Please install Java 8 or higher"
    exit 1
fi

echo "✅ Java version $JAVA_VERSION detected"

# Create config directory
mkdir -p "$CONFIG_DIR"
echo "�� Created config directory: $CONFIG_DIR"

# Copy the main script
echo "📋 Installing command to $INSTALL_DIR..."
if [[ -w "$INSTALL_DIR" ]]; then
    cp "$PROJECT_DIR/bin/plantuml-exporter" "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/plantuml-exporter"
else
    echo "🔐 Need administrator privileges to install to $INSTALL_DIR"
    sudo cp "$PROJECT_DIR/bin/plantuml-exporter" "$INSTALL_DIR/"
    sudo chmod +x "$INSTALL_DIR/plantuml-exporter"
fi

# Create version file
echo "1.0.0" > "$CONFIG_DIR/version"

# Test installation
echo "🧪 Testing installation..."
if command -v plantuml-exporter &> /dev/null; then
    echo "✅ PlantUML Exporter installed successfully!"
    echo ""
    echo "📖 Usage:"
    echo "   plantuml-exporter              # Export all .puml files in current directory"
    echo "   plantuml-exporter --help       # Show help"
    echo "   plantuml-exporter --version     # Show version"
    echo ""
    echo "🔧 Configuration directory: $CONFIG_DIR"
    echo "📍 Installed to: $INSTALL_DIR/plantuml-exporter"
    echo ""
    echo "💡 To uninstall, run: bash scripts/uninstall.sh"
else
    echo "❌ Installation failed. Command not found in PATH."
    exit 1
fi

echo ""
echo "🎉 Installation complete!"
echo "   You can now use 'plantuml-exporter' command from anywhere!"
