# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.7.0, 805f7510126a2f514a6b794ac3dd30320fc3b5f800b69de44c1b281a48095cc1, 2abc7baa061c172119a3f9fb0cfadf13899cbc15999b31dd1aa692f4f45454c1, bd3fb1ceb59303d8b57cccfebc790c46f5079407ab834b843a1f512659343132, 1c6b7fa262010aa0dc9ed57732fe5ca6559f18762c7312ad279a59c10110520a

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.7.0/carina-0.7.0-macos-aarch64.tar.gz"
      sha256 "805f7510126a2f514a6b794ac3dd30320fc3b5f800b69de44c1b281a48095cc1"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.7.0/carina-0.7.0-macos-x86_64.tar.gz"
      sha256 "2abc7baa061c172119a3f9fb0cfadf13899cbc15999b31dd1aa692f4f45454c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.7.0/carina-0.7.0-linux-aarch64.tar.gz"
      sha256 "bd3fb1ceb59303d8b57cccfebc790c46f5079407ab834b843a1f512659343132"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.7.0/carina-0.7.0-linux-x86_64.tar.gz"
      sha256 "1c6b7fa262010aa0dc9ed57732fe5ca6559f18762c7312ad279a59c10110520a"
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
