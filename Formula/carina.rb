# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.10.0, 78ba89ca632ce1de2a07e1dabf3b6a73c248fab70a7ff712d899bc7044276b44, d39fc6a4fb69b31c41d2a9e3052c595e60ba1c611921d81d5bbba4cd5d10721e, 062915e7d981683977a5cb599c225157c9760a4cedd2efcabb0a75b025c19bb1, 0b3d894bc0352b8fe7bbe88757e4ecab5c1079c30b49aebefe81ce5cc03ad37c

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.10.0/carina-0.10.0-macos-aarch64.tar.gz"
      sha256 "78ba89ca632ce1de2a07e1dabf3b6a73c248fab70a7ff712d899bc7044276b44"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.10.0/carina-0.10.0-macos-x86_64.tar.gz"
      sha256 "d39fc6a4fb69b31c41d2a9e3052c595e60ba1c611921d81d5bbba4cd5d10721e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.10.0/carina-0.10.0-linux-aarch64.tar.gz"
      sha256 "062915e7d981683977a5cb599c225157c9760a4cedd2efcabb0a75b025c19bb1"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.10.0/carina-0.10.0-linux-x86_64.tar.gz"
      sha256 "0b3d894bc0352b8fe7bbe88757e4ecab5c1079c30b49aebefe81ce5cc03ad37c"
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
