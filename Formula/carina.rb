# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.14.0, 7aad20c838b76c7bfc2a2e2c65649da8459cd4330055ca99ebd8f4037465033e, 237d4713fa0b970422847c0a5df9d1fdcb330b112443e67f481afc87fb0e94ae, 42a8c3637fb384da9163d3b797feea1d67423503cbe2df9cafc9adbc83415773, 9b1ffe72d12470ca77fc0e5356cab98a0db02ff9ec4617cbeecdebf25ab2ce16

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.14.0/carina-0.14.0-macos-aarch64.tar.gz"
      sha256 "7aad20c838b76c7bfc2a2e2c65649da8459cd4330055ca99ebd8f4037465033e"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.14.0/carina-0.14.0-macos-x86_64.tar.gz"
      sha256 "237d4713fa0b970422847c0a5df9d1fdcb330b112443e67f481afc87fb0e94ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.14.0/carina-0.14.0-linux-aarch64.tar.gz"
      sha256 "42a8c3637fb384da9163d3b797feea1d67423503cbe2df9cafc9adbc83415773"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.14.0/carina-0.14.0-linux-x86_64.tar.gz"
      sha256 "9b1ffe72d12470ca77fc0e5356cab98a0db02ff9ec4617cbeecdebf25ab2ce16"
    end
  end

  def install
    bin.install "carina"
    bin.install "carina-lsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/carina --version")
  end
end
