# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.9.0, e378cb858bcc98315fde4a92c9d1465422d36e93b7a6dbb2f6bed8fdd54b7c0a, 87adacbf95fc9328528c17c3f31e3424bf9232d838ed3803b5d63e765d11f02f, f0bc4a5b0d26bffbb5986dd4947509006be50bab56421a0fdfd69fce78b01b57, 31d0f4535eb59a91dc9a518041addf0a7912e7b34081b4a5a24f41351f87d2da

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.9.0/carina-0.9.0-macos-aarch64.tar.gz"
      sha256 "e378cb858bcc98315fde4a92c9d1465422d36e93b7a6dbb2f6bed8fdd54b7c0a"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.9.0/carina-0.9.0-macos-x86_64.tar.gz"
      sha256 "87adacbf95fc9328528c17c3f31e3424bf9232d838ed3803b5d63e765d11f02f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.9.0/carina-0.9.0-linux-aarch64.tar.gz"
      sha256 "f0bc4a5b0d26bffbb5986dd4947509006be50bab56421a0fdfd69fce78b01b57"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.9.0/carina-0.9.0-linux-x86_64.tar.gz"
      sha256 "31d0f4535eb59a91dc9a518041addf0a7912e7b34081b4a5a24f41351f87d2da"
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
