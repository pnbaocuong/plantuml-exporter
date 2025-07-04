# ========================================
# Homebrew Formula for PlantUML Exporter
# Version: 1.0.0
# Author: Michael Pham
# ========================================

class PlantumlExporter < Formula
  desc "Professional command-line tool for exporting PlantUML diagrams to high-quality PNG images"
  homepage "https://github.com/pnbaocuong/plantuml-exporter"
  url "https://github.com/pnbaocuong/plantuml-exporter/archive/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_WHEN_RELEASED"
  license "MIT"
  head "https://github.com/pnbaocuong/plantuml-exporter.git", branch: "main"

  # Dependencies
  depends_on "openjdk@11"

  def install
    # Install main script
    bin.install "bin/plantuml-exporter"
    
    # Install supporting files
    libexec.install "scripts"
    
    # Create wrapper script that uses Homebrew's Java
    (bin/"plantuml-exporter").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{Formula["openjdk@11"].opt_prefix}"
      export PATH="$JAVA_HOME/bin:$PATH"
      exec "#{libexec}/bin/plantuml-exporter" "$@"
    EOS
    
    # Make executable
    chmod 0755, bin/"plantuml-exporter"
  end

  test do
    # Test that the command exists and can show help
    assert_match "PlantUML Exporter", shell_output("#{bin}/plantuml-exporter --help", 0)
    
    # Test Java dependency
    assert_predicate Formula["openjdk@11"].opt_bin/"java", :exist?
  end

  def caveats
    <<~EOS
      🎉 PlantUML Exporter has been installed successfully!

      📖 Quick Start:
        cd your-project-with-puml-files
        plantuml-exporter

      📋 Requirements:
        • Java 8+ (provided by openjdk@11 dependency)
        • Internet connection (for downloading PlantUML.jar if needed)

      🔧 Configuration:
        The tool uses VSCode PlantUML extension compatible settings:
        • Size Limit: 8192 pixels
        • Memory: 2GB JVM heap
        • Security: Unrestricted mode
        • Encoding: UTF-8

      📁 Output:
        All exported PNG images will be saved to ./images/ directory
        with an auto-generated index file.

      💡 Tips:
        • Place your .puml files in project root
        • Run from directory containing diagrams
        • Images will be exported to ./images/ subfolder

      🔗 More info: https://github.com/pnbaocuong/plantuml-exporter
    EOS
  end
end
