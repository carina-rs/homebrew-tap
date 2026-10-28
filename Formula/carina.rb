# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.7.1, 4d28bc50424ddd9a7c9c6ae405526e172ca0ef92b800709ede55d51616fdeb67, c6b42cabcd4bd075f66886b006b846100ae745139b3b3b575f1c64488229770f, 4fb4d585483dfc1cd4f7f62426e40c1dd1de2e3b5131c94e751b88ab1b072423, 249fea84926f76a0db49b169c2f52680df649c9b88d49c4fd8cce967fc0f0128

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.7.1/carina-0.7.1-macos-aarch64.tar.gz"
      sha256 "4d28bc50424ddd9a7c9c6ae405526e172ca0ef92b800709ede55d51616fdeb67"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.7.1/carina-0.7.1-macos-x86_64.tar.gz"
      sha256 "c6b42cabcd4bd075f66886b006b846100ae745139b3b3b575f1c64488229770f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.7.1/carina-0.7.1-linux-aarch64.tar.gz"
      sha256 "4fb4d585483dfc1cd4f7f62426e40c1dd1de2e3b5131c94e751b88ab1b072423"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.7.1/carina-0.7.1-linux-x86_64.tar.gz"
      sha256 "249fea84926f76a0db49b169c2f52680df649c9b88d49c4fd8cce967fc0f0128"
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
