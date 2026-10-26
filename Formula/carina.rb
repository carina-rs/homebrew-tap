# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.6.0, b88853358ae12739e42f196626ca874e903d03b9cf2c22fe14fb5803fc3e7379, d25be769e47bb8c769b0c48004dcb1d6a1be2fd610af2280aa0db6fa7581a382, aef6f314a84864774b63d1511859c9847631a1f9f1cd00899235224b3cace9be, 8a8c1b35edab550c4c09d46ab2c4c523924de063c9eb358664f806e0b6159e9b

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.6.0/carina-0.6.0-macos-aarch64.tar.gz"
      sha256 "b88853358ae12739e42f196626ca874e903d03b9cf2c22fe14fb5803fc3e7379"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.6.0/carina-0.6.0-macos-x86_64.tar.gz"
      sha256 "d25be769e47bb8c769b0c48004dcb1d6a1be2fd610af2280aa0db6fa7581a382"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.6.0/carina-0.6.0-linux-aarch64.tar.gz"
      sha256 "aef6f314a84864774b63d1511859c9847631a1f9f1cd00899235224b3cace9be"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.6.0/carina-0.6.0-linux-x86_64.tar.gz"
      sha256 "8a8c1b35edab550c4c09d46ab2c4c523924de063c9eb358664f806e0b6159e9b"
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
