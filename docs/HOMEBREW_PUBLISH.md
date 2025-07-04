# Hướng dẫn Publish PlantUML Exporter lên Homebrew

## Tổng quan

Để publish **PlantUML Exporter** lên Homebrew, bạn cần thực hiện các bước sau:

## 1. Setup GitHub Repository

### Tạo Repository
```bash
# Tạo repo mới trên GitHub
# Repository name: plantuml-exporter
# Description: Professional command-line tool for exporting PlantUML diagrams
# Public repository
# Add README, License (MIT)
```

### Push Code
```bash
git init
git add .
git commit -m "Initial release v1.0.0"
git branch -M main
git remote add origin https://github.com/pnbaocuong/plantuml-exporter.git
git push -u origin main
```

## 2. Tạo Release với Tag

### Tạo Git Tag
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### Tạo GitHub Release
1. Vào GitHub repository
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.0.0`
4. Release title: `PlantUML Exporter v1.0.0`

## 3. Lấy SHA256 Checksum

```bash
# Download the release tarball
curl -sSL https://github.com/pnbaocuong/plantuml-exporter/archive/v1.0.0.tar.gz -o plantuml-exporter-1.0.0.tar.gz

# Calculate SHA256
shasum -a 256 plantuml-exporter-1.0.0.tar.gz
```

## 4. Tạo Homebrew Tap

### Tạo tap repository
```bash
# Tạo repo mới: homebrew-tap
# URL: https://github.com/pnbaocuong/homebrew-tap
```

### Clone và setup
```bash
git clone https://github.com/pnbaocuong/homebrew-tap.git
cd homebrew-tap
mkdir -p Formula
cp ../plantuml-exporter/docs/plantuml-exporter.rb Formula/
git add .
git commit -m "Add plantuml-exporter formula"
git push origin main
```

### Test locally
```bash
brew tap pnbaocuong/tap
brew install plantuml-exporter
```

## 5. Verification Steps

### Test Formula Locally
```bash
# Install from tap
brew install pnbaocuong/tap/plantuml-exporter

# Test functionality
cd /tmp
echo '@startuml
A -> B: test
@enduml' > test.puml

plantuml-exporter
ls images/  # Should contain test.png
```

### Audit Formula
```bash
brew audit pnbaocuong/tap/plantuml-exporter
brew style pnbaocuong/tap/plantuml-exporter
```

## Commands Summary

```bash
# 1. Setup & Release
git tag v1.0.0 && git push origin v1.0.0

# 2. Get SHA256
curl -sSL https://github.com/pnbaocuong/plantuml-exporter/archive/v1.0.0.tar.gz | shasum -a 256

# 3. Setup Tap
git clone https://github.com/pnbaocuong/homebrew-tap.git
mkdir -p homebrew-tap/Formula
cp docs/plantuml-exporter.rb homebrew-tap/Formula/

# 4. Publish
cd homebrew-tap
git add . && git commit -m "Add plantuml-exporter v1.0.0"
git push origin main

# 5. Test
brew tap pnbaocuong/tap
brew install plantuml-exporter
```

---

## 🎉 Congratulations!

Sau khi hoàn thành, users có thể install tool bằng:
```bash
brew install pnbaocuong/tap/plantuml-exporter
```
