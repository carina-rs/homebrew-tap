# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.5.0, f719849c61be7216c35c9d71e8d8ac67f41e12109bca0e7a65cbdf73b0941cbf, 39070327962047509aa274849281b49d5afcc24ac9fd087b58cd8bed6fe94534, ce719c9cd2f6770fd104b1e4589ed79187cc6be820126c271f4432539de98d0d, a075431af68ab113f7ee91c43494cc45d781659af4e2cbe54025ad6afefeb78e

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.5.0/carina-0.5.0-macos-aarch64.tar.gz"
      sha256 "f719849c61be7216c35c9d71e8d8ac67f41e12109bca0e7a65cbdf73b0941cbf"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.5.0/carina-0.5.0-macos-x86_64.tar.gz"
      sha256 "39070327962047509aa274849281b49d5afcc24ac9fd087b58cd8bed6fe94534"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.5.0/carina-0.5.0-linux-aarch64.tar.gz"
      sha256 "ce719c9cd2f6770fd104b1e4589ed79187cc6be820126c271f4432539de98d0d"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.5.0/carina-0.5.0-linux-x86_64.tar.gz"
      sha256 "a075431af68ab113f7ee91c43494cc45d781659af4e2cbe54025ad6afefeb78e"
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
