# PlantUML Exporter

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/pnbaocuong/plantuml-exporter/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![macOS](https://img.shields.io/badge/macOS-supported-brightgreen.svg)](https://github.com/pnbaocuong/plantuml-exporter)
[![Linux](https://img.shields.io/badge/Linux-supported-brightgreen.svg)](https://github.com/pnbaocuong/plantuml-exporter)

A professional command-line tool for exporting PlantUML diagrams to high-quality PNG images with optimal configurations.

## Features

✅ **Professional Export**: Export all `.puml` files to high-quality PNG images
✅ **VSCode Compatible**: Uses the same configuration as VSCode PlantUML extension
✅ **Large Diagrams**: Handles complex diagrams without size truncation
✅ **Batch Processing**: Export multiple diagrams concurrently
✅ **Auto Documentation**: Generates index file with all diagrams
✅ **Production Ready**: Optimized for CI/CD pipelines

## Installation

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

- **Java 8+**: Required for PlantUML execution
- **Internet connection**: For downloading PlantUML.jar if not present

## Usage

### Basic Usage

```bash
# Export all .puml files in current directory
plantuml-exporter

# Export files in specific directory
cd /path/to/your/diagrams
plantuml-exporter
```

### Configuration

The tool uses optimal settings compatible with VSCode PlantUML extension:

- **Size Limit**: 8192 pixels (handles large diagrams)
- **Memory**: 2GB JVM heap
- **Security**: Unrestricted mode for full functionality  
- **Encoding**: UTF-8 for international support
- **Output**: High-quality PNG format

### Output Structure

```
your-project/
├── diagram1.puml
├── diagram2.puml
└── images/
    ├── README.md          # Auto-generated index
    ├── diagram1.png
    └── diagram2.png
```

## Examples

### Single Project Export

```bash
cd my-project
plantuml-exporter
```

### CI/CD Integration

```yaml
# GitHub Actions example
- name: Export PlantUML Diagrams
  run: plantuml-exporter
  
- name: Commit Generated Images
  run: |
    git add images/
    git commit -m "Update diagram images"
```

### Docker Usage

```bash
# Run in Docker container
docker run --rm -v $(pwd):/workspace pnbaocuong/plantuml-exporter
```

## Advanced Configuration

### Custom PlantUML.jar Location

Set environment variable:
```bash
export PLANTUML_JAR_PATH="/path/to/custom/plantuml.jar"
plantuml-exporter
```

### Memory Settings

For very large diagrams:
```bash
export JAVA_OPTS="-Xmx4g"
plantuml-exporter
```

## Troubleshooting

### Common Issues

1. **Java not found**: Install Java 8+ and ensure it's in PATH
2. **Permission denied**: Run `chmod +x /usr/local/bin/plantuml-exporter`
3. **Large diagrams truncated**: Tool automatically handles this with 8192 size limit

### Debug Mode

```bash
plantuml-exporter --debug
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Created by [Michael Pham](https://github.com/pnbaocuong)

- Email: pnbaocuong@gmail.com
- GitHub: [@pnbaocuong](https://github.com/pnbaocuong)
- LinkedIn: [Michael Pham](https://www.linkedin.com/in/michael-pham-913808108/)

## Acknowledgments

- [PlantUML](https://plantuml.com/) for the amazing diagramming tool
- [VSCode PlantUML Extension](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) for configuration inspiration
- The open-source community for continuous improvement

## Changelog

### v1.0.0
- Initial release
- Professional export functionality
- VSCode extension compatibility
- Large diagram support
- Auto-documentation generation

---

**⭐ If this tool helped you, please give it a star on GitHub!**
