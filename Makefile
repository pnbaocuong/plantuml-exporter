# ========================================
# PlantUML Exporter Makefile
# Version: 1.0.0
# Author: Michael Pham
# ========================================

.PHONY: all install uninstall test clean help version

# Variables
PROJECT_NAME = plantuml-exporter
VERSION = $(shell cat VERSION)
INSTALL_DIR = /usr/local/bin
CONFIG_DIR = $(HOME)/.plantuml-exporter
SCRIPT_DIR = scripts
BIN_DIR = bin

# Default target
all: help

# Install the command
install:
	@echo "🚀 Installing $(PROJECT_NAME) v$(VERSION)..."
	@bash $(SCRIPT_DIR)/install.sh

# Uninstall the command
uninstall:
	@echo "🗑️  Uninstalling $(PROJECT_NAME)..."
	@bash $(SCRIPT_DIR)/uninstall.sh

# Test installation
test:
	@echo "🧪 Testing $(PROJECT_NAME) installation..."
	@if command -v $(PROJECT_NAME) >/dev/null 2>&1; then \
		echo "✅ $(PROJECT_NAME) is installed and available"; \
		$(PROJECT_NAME) --version || echo "❌ Version check failed"; \
	else \
		echo "❌ $(PROJECT_NAME) is not installed or not in PATH"; \
		exit 1; \
	fi

# Local test (without installation)
test-local:
	@echo "🧪 Testing local script..."
	@bash $(BIN_DIR)/$(PROJECT_NAME) --help || true

# Clean build artifacts
clean:
	@echo "�� Cleaning up..."
	@find . -name "*.tmp" -delete
	@find . -name ".DS_Store" -delete
	@rm -rf build/
	@echo "✅ Clean complete"

# Package for distribution
package: clean
	@echo "📦 Creating distribution package..."
	@mkdir -p build
	@tar -czf build/$(PROJECT_NAME)-$(VERSION).tar.gz \
		--exclude='.git' \
		--exclude='build' \
		--exclude='*.tmp' \
		--exclude='.DS_Store' \
		.
	@echo "✅ Package created: build/$(PROJECT_NAME)-$(VERSION).tar.gz"

# Show version
version:
	@echo "$(PROJECT_NAME) v$(VERSION)"

# Development setup
dev-setup:
	@echo "�� Setting up development environment..."
	@chmod +x $(BIN_DIR)/$(PROJECT_NAME)
	@chmod +x $(SCRIPT_DIR)/install.sh
	@chmod +x $(SCRIPT_DIR)/uninstall.sh
	@echo "✅ Development setup complete"

# Validate scripts
validate:
	@echo "🔍 Validating shell scripts..."
	@if command -v shellcheck >/dev/null 2>&1; then \
		shellcheck $(BIN_DIR)/$(PROJECT_NAME); \
		shellcheck $(SCRIPT_DIR)/install.sh; \
		shellcheck $(SCRIPT_DIR)/uninstall.sh; \
		echo "✅ All scripts validated"; \
	else \
		echo "⚠️  shellcheck not found. Install it for script validation"; \
		echo "   macOS: brew install shellcheck"; \
		echo "   Linux: sudo apt-get install shellcheck"; \
	fi

# Release checklist
release-check:
	@echo "🚀 Pre-release validation..."
	@echo "📋 Checking required files..."
	@test -f VERSION || (echo "❌ VERSION file missing" && exit 1)
	@test -f README.md || (echo "❌ README.md missing" && exit 1)
	@test -f LICENSE || (echo "❌ LICENSE file missing" && exit 1)
	@test -f $(BIN_DIR)/$(PROJECT_NAME) || (echo "❌ Main script missing" && exit 1)
	@test -f $(SCRIPT_DIR)/install.sh || (echo "❌ Install script missing" && exit 1)
	@test -f $(SCRIPT_DIR)/uninstall.sh || (echo "❌ Uninstall script missing" && exit 1)
	@echo "✅ All required files present"
	@make validate
	@echo "🎉 Ready for release!"

# Help
help:
	@echo "$(PROJECT_NAME) v$(VERSION) - Build and Installation"
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "📦 Build & Package:"
	@echo "  make package        Create distribution package"
	@echo "  make clean          Clean build artifacts"
	@echo ""
	@echo "🚀 Installation:"
	@echo "  make install        Install $(PROJECT_NAME) to system"
	@echo "  make uninstall      Remove $(PROJECT_NAME) from system"
	@echo ""
	@echo "🧪 Testing:"
	@echo "  make test           Test installed command"
	@echo "  make test-local     Test local script (no install)"
	@echo ""
	@echo "🔧 Development:"
	@echo "  make dev-setup      Set up development environment"
	@echo "  make validate       Validate shell scripts with shellcheck"
	@echo "  make version        Show current version"
	@echo ""
	@echo "🚀 Release:"
	@echo "  make release-check  Validate everything for release"
	@echo ""
	@echo "💡 Usage after installation:"
	@echo "  $(PROJECT_NAME)     Export PlantUML diagrams"
	@echo ""
