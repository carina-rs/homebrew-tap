# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.2.0, 01f27ca4f897b00757bc349c011b86a5471bbe92871bd4008eca3b2e56c3f219, af9bb617d32b282eeaeeddbd858375722674cb5eaf945387fb92b74f6d22450b, 344b8f6a4a6282e53ccf838af3d6f8372fa2815d5a8a46f8e638bf35168c84ca, 39aebbc0522942d43a521b97c16abb0ec88f4ca9dbe01aa5b7339580a7f4b21f

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.2.0/carina-0.2.0-macos-aarch64.tar.gz"
      sha256 "01f27ca4f897b00757bc349c011b86a5471bbe92871bd4008eca3b2e56c3f219"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.2.0/carina-0.2.0-macos-x86_64.tar.gz"
      sha256 "af9bb617d32b282eeaeeddbd858375722674cb5eaf945387fb92b74f6d22450b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.2.0/carina-0.2.0-linux-aarch64.tar.gz"
      sha256 "344b8f6a4a6282e53ccf838af3d6f8372fa2815d5a8a46f8e638bf35168c84ca"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.2.0/carina-0.2.0-linux-x86_64.tar.gz"
      sha256 "39aebbc0522942d43a521b97c16abb0ec88f4ca9dbe01aa5b7339580a7f4b21f"
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
