#!/bin/bash

# ========================================
# PlantUML Exporter Uninstallation Script
# Version: 1.0.0
# Author: Michael Pham
# ========================================

set -e

INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.plantuml-exporter"

echo "🗑️  Uninstalling PlantUML Exporter..."

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "⚠️  This script should not be run as root"
    echo "   Please run without sudo. The script will ask for permission when needed."
    exit 1
fi

# Check if command exists
if ! command -v plantuml-exporter &> /dev/null; then
    echo "⚠️  PlantUML Exporter is not installed or not in PATH"
    echo "   Nothing to uninstall."
    exit 0
fi

# Get current version
CURRENT_VERSION=""
if [[ -f "$CONFIG_DIR/version" ]]; then
    CURRENT_VERSION=$(cat "$CONFIG_DIR/version")
    echo "📋 Found installed version: $CURRENT_VERSION"
fi

# Confirm uninstallation
echo ""
echo "This will remove:"
echo "   • Command: $INSTALL_DIR/plantuml-exporter"
echo "   • Configuration: $CONFIG_DIR"
echo ""
read -p "Are you sure you want to uninstall? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Uninstallation cancelled."
    exit 0
fi

# Remove the main command
echo "🗑️  Removing command..."
if [[ -f "$INSTALL_DIR/plantuml-exporter" ]]; then
    if [[ -w "$INSTALL_DIR" ]]; then
        rm "$INSTALL_DIR/plantuml-exporter"
    else
        echo "🔐 Need administrator privileges to remove from $INSTALL_DIR"
        sudo rm "$INSTALL_DIR/plantuml-exporter"
    fi
    echo "✅ Removed: $INSTALL_DIR/plantuml-exporter"
else
    echo "⚠️  Command not found: $INSTALL_DIR/plantuml-exporter"
fi

# Remove configuration directory
if [[ -d "$CONFIG_DIR" ]]; then
    echo "🗑️  Removing configuration directory..."
    rm -rf "$CONFIG_DIR"
    echo "✅ Removed: $CONFIG_DIR"
fi

# Verify uninstallation
echo ""
echo "🧪 Verifying uninstallation..."
if ! command -v plantuml-exporter &> /dev/null; then
    echo "✅ PlantUML Exporter has been successfully uninstalled!"
    echo ""
    echo "🔄 To reinstall, run: bash scripts/install.sh"
else
    echo "❌ Uninstallation may have failed. Command still found in PATH."
    echo "   Please check your PATH or restart your shell."
    exit 1
fi

echo ""
echo "🎉 Uninstallation complete!"
echo "   Thank you for using PlantUML Exporter!"
