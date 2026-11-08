# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.13.1, 46615a0e50b16258fd599ee16643e46461f4eeb410ccf92c6111e5fe91dc3d99, 9ccbdfd9f823c15bd34886d9b931e3f0fdb20876f921bdb056c5ccaa9e26924a, 09bdc60e81bb34d0a3ffe2f576b653b4963de7a0c2703f79c22289cddd5dce64, 98746def8a45005813ff685b2b9fbbadf10c9a0336cce65d2a204059c69ed14e

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.13.1/carina-0.13.1-macos-aarch64.tar.gz"
      sha256 "46615a0e50b16258fd599ee16643e46461f4eeb410ccf92c6111e5fe91dc3d99"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.13.1/carina-0.13.1-macos-x86_64.tar.gz"
      sha256 "9ccbdfd9f823c15bd34886d9b931e3f0fdb20876f921bdb056c5ccaa9e26924a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.13.1/carina-0.13.1-linux-aarch64.tar.gz"
      sha256 "09bdc60e81bb34d0a3ffe2f576b653b4963de7a0c2703f79c22289cddd5dce64"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.13.1/carina-0.13.1-linux-x86_64.tar.gz"
      sha256 "98746def8a45005813ff685b2b9fbbadf10c9a0336cce65d2a204059c69ed14e"
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
