# PlantUML Exporter v1.0.0

Professional command-line tool for exporting PlantUML diagrams to high-quality PNG images with VSCode-compatible configuration.

## 🎯 Initial Release Features

✅ **Professional Export**: Export all `.puml` files to high-quality PNG images  
✅ **VSCode Compatible**: Same configuration as VSCode PlantUML extension  
✅ **Large Diagrams**: 8192px size limit (handles complex diagrams)  
✅ **Batch Processing**: Export multiple diagrams concurrently  
✅ **Auto Documentation**: Generates index file with all diagrams  
✅ **Production Ready**: Optimized for CI/CD pipelines  

## �� Installation

### Manual Installation
```bash
git clone https://github.com/pnbaocuong/plantuml-exporter.git
cd plantuml-exporter
make install
```

### Homebrew (Coming Soon)
```bash
brew install pnbaocuong/tap/plantuml-exporter
```

## 🚀 Usage

```bash
cd your-project-with-puml-files
plantuml-exporter
```

## 🛠️ Technical Specs

- **Size Limit**: 8192 pixels (2x default)
- **Memory**: 2GB JVM heap
- **Encoding**: UTF-8
- **Output**: High-quality PNG
- **Platform**: macOS, Linux

## 📊 What's Included

- **Main Script**: `plantuml-exporter` command
- **Installation**: Auto install/uninstall scripts
- **Documentation**: Complete README and guides
- **Build System**: Professional Makefile
- **Homebrew**: Ready-to-use formula

---

**Author**: [Michael Pham](https://github.com/pnbaocuong)  
**License**: MIT  
**Repository**: https://github.com/pnbaocuong/plantuml-exporter

⭐ **If this tool helped you, please star the repository!**
