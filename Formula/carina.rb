# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.12.1, cf206bd81613001c9370a7ec96e082613fbb68021e75708e010fabf628fafe3a, 34e0f52d686b04ccdc380683a97ca71e7b2ee560baf892be4c334646722efa25, f5076cc44c6d74637675af46fef439a6668f85712450c7c31982accc370eddb7, f5ffb638c36d035af197cc8f47326e9560042fdb2ec2f39c302a80f942ffc01a

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.12.1/carina-0.12.1-macos-aarch64.tar.gz"
      sha256 "cf206bd81613001c9370a7ec96e082613fbb68021e75708e010fabf628fafe3a"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.12.1/carina-0.12.1-macos-x86_64.tar.gz"
      sha256 "34e0f52d686b04ccdc380683a97ca71e7b2ee560baf892be4c334646722efa25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.12.1/carina-0.12.1-linux-aarch64.tar.gz"
      sha256 "f5076cc44c6d74637675af46fef439a6668f85712450c7c31982accc370eddb7"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.12.1/carina-0.12.1-linux-x86_64.tar.gz"
      sha256 "f5ffb638c36d035af197cc8f47326e9560042fdb2ec2f39c302a80f942ffc01a"
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
