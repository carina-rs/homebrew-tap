# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.3.0, 826b25bd53d48d418bdaa402fdbf854fa162cc69ad280fd87c32b73e6c73ee3b, a4a2e9f251417dec756e2cc9db4fdf33c346591a5a2e05bc1e8ddaa72e3e875d, 4e252a946f07bd996d0c73d6ba59cdf6cf09f7d6a5343e6e082e1fa93a1a3c19, 72d3d64e156613df628b06e3e4404cb9abca86ed75db25e0b7be797261573618

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.3.0/carina-0.3.0-macos-aarch64.tar.gz"
      sha256 "826b25bd53d48d418bdaa402fdbf854fa162cc69ad280fd87c32b73e6c73ee3b"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.3.0/carina-0.3.0-macos-x86_64.tar.gz"
      sha256 "a4a2e9f251417dec756e2cc9db4fdf33c346591a5a2e05bc1e8ddaa72e3e875d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.3.0/carina-0.3.0-linux-aarch64.tar.gz"
      sha256 "4e252a946f07bd996d0c73d6ba59cdf6cf09f7d6a5343e6e082e1fa93a1a3c19"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.3.0/carina-0.3.0-linux-x86_64.tar.gz"
      sha256 "72d3d64e156613df628b06e3e4404cb9abca86ed75db25e0b7be797261573618"
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
