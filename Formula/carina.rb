# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.1.0, 559a4e331ecde390e4577cb7c9c08d76c26dbaae87d2bdcd9f01bcbd413ddca3, d17d7c4bfbfd112b07c09b9819773332567c98a7afeb13cd5d6387c31d963c3e, cf6694ee5979a134dd1ddf67a3b0e92a03bd393e09dae8ae96928c7972bae53b, 48ded5f788791d0ad2e14fcf2eeb35edc3a7d75421184b18f1deba7c335e6198

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.1.0/carina-0.1.0-macos-aarch64.tar.gz"
      sha256 "559a4e331ecde390e4577cb7c9c08d76c26dbaae87d2bdcd9f01bcbd413ddca3"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.1.0/carina-0.1.0-macos-x86_64.tar.gz"
      sha256 "d17d7c4bfbfd112b07c09b9819773332567c98a7afeb13cd5d6387c31d963c3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.1.0/carina-0.1.0-linux-aarch64.tar.gz"
      sha256 "cf6694ee5979a134dd1ddf67a3b0e92a03bd393e09dae8ae96928c7972bae53b"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.1.0/carina-0.1.0-linux-x86_64.tar.gz"
      sha256 "48ded5f788791d0ad2e14fcf2eeb35edc3a7d75421184b18f1deba7c335e6198"
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
