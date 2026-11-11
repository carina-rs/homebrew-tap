# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.14.1, e2c21f8ff077454c7f99ab4f739ed3f4a13fee1889687a6e2eff5768d176f875, 8ab6654f8405bb19baf4ceaa6c8c674f63d83298fc1dba0e804a7a54945f63b3, 3f52fffd69a4b0d21d3221bf28f386d9c089affd9fa162481e937a0a3900f1c7, c9f523dc8233ec19ef5c4350c33e81dcd3aca4f79db7280b88162edab0759952

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.14.1/carina-0.14.1-macos-aarch64.tar.gz"
      sha256 "e2c21f8ff077454c7f99ab4f739ed3f4a13fee1889687a6e2eff5768d176f875"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.14.1/carina-0.14.1-macos-x86_64.tar.gz"
      sha256 "8ab6654f8405bb19baf4ceaa6c8c674f63d83298fc1dba0e804a7a54945f63b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.14.1/carina-0.14.1-linux-aarch64.tar.gz"
      sha256 "3f52fffd69a4b0d21d3221bf28f386d9c089affd9fa162481e937a0a3900f1c7"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.14.1/carina-0.14.1-linux-x86_64.tar.gz"
      sha256 "c9f523dc8233ec19ef5c4350c33e81dcd3aca4f79db7280b88162edab0759952"
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
