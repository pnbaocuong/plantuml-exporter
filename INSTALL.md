# PlantUML Exporter - Installation Guide

## Quick Install

### Homebrew (macOS/Linux)
```bash
brew install pnbaocuong/tap/plantuml-exporter
```

### Manual Installation
```bash
git clone https://github.com/pnbaocuong/plantuml-exporter.git
cd plantuml-exporter
make install
```

## Requirements
- Java 8+ (auto-installed with Homebrew)
- Internet connection (for PlantUML.jar download)

## Usage
```bash
cd your-project-with-puml-files
plantuml-exporter
```

## Uninstall
```bash
# Homebrew
brew uninstall plantuml-exporter

# Manual
make uninstall
```
