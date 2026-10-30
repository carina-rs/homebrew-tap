# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.8.0, e0a3737f5dcb1ece94a4642586c427ce2677896f571daf68a10b11df78e67522, 7f0f9c3613bd15cd23e5b9a43ae7fb6d71df91c56ea851424a886615de87c100, be9152ae0eb1d32114e669c519eecd93f7d7dfe3cd53c07efc4375063111310b, 39650aa20a34a916b97407cabc284ec7c3cdb3cf7b9d8c43066137d6a83206f7

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.8.0/carina-0.8.0-macos-aarch64.tar.gz"
      sha256 "e0a3737f5dcb1ece94a4642586c427ce2677896f571daf68a10b11df78e67522"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.8.0/carina-0.8.0-macos-x86_64.tar.gz"
      sha256 "7f0f9c3613bd15cd23e5b9a43ae7fb6d71df91c56ea851424a886615de87c100"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.8.0/carina-0.8.0-linux-aarch64.tar.gz"
      sha256 "be9152ae0eb1d32114e669c519eecd93f7d7dfe3cd53c07efc4375063111310b"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.8.0/carina-0.8.0-linux-x86_64.tar.gz"
      sha256 "39650aa20a34a916b97407cabc284ec7c3cdb3cf7b9d8c43066137d6a83206f7"
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
