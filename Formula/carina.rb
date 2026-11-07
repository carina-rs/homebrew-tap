# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.13.0, d9a84075fbdee55c5c205b44c17556e4a621faa89a6ffa96144510e1e0599d0c, 77cb7449f365edf5d98bf3ebe562a00885c98a020caa656b4001b9e0ebba9ddb, 3a6c6f249fe2d2f50c1cdfc5edc0f00cf1a19716d125de653d4705f975533944, 165f7c29be5d68b296a3046972335506591c51a6b32a9042db45ba8ecaf8437e

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.13.0/carina-0.13.0-macos-aarch64.tar.gz"
      sha256 "d9a84075fbdee55c5c205b44c17556e4a621faa89a6ffa96144510e1e0599d0c"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.13.0/carina-0.13.0-macos-x86_64.tar.gz"
      sha256 "77cb7449f365edf5d98bf3ebe562a00885c98a020caa656b4001b9e0ebba9ddb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.13.0/carina-0.13.0-linux-aarch64.tar.gz"
      sha256 "3a6c6f249fe2d2f50c1cdfc5edc0f00cf1a19716d125de653d4705f975533944"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.13.0/carina-0.13.0-linux-x86_64.tar.gz"
      sha256 "165f7c29be5d68b296a3046972335506591c51a6b32a9042db45ba8ecaf8437e"
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
