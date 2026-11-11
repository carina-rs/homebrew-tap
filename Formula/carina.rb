# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.15.0, 6b1f3732b25a274bc324294e19042bb4c28f0b9f65bee408f5ee2b53aa3f6b57, df2f3c924806e2c189297ad0eb74aa70bf034d850df53b0021e82e6534f7bf77, abbf5ef14ad22e6955d04cebadf6325cfac15986a25459334846f85e1666d2cc, 119a2976ba47514d820ff8a968b0ac6bd952811ef9c8fe924d67f5cd0d856d83

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.15.0/carina-0.15.0-macos-aarch64.tar.gz"
      sha256 "6b1f3732b25a274bc324294e19042bb4c28f0b9f65bee408f5ee2b53aa3f6b57"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.15.0/carina-0.15.0-macos-x86_64.tar.gz"
      sha256 "df2f3c924806e2c189297ad0eb74aa70bf034d850df53b0021e82e6534f7bf77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.15.0/carina-0.15.0-linux-aarch64.tar.gz"
      sha256 "abbf5ef14ad22e6955d04cebadf6325cfac15986a25459334846f85e1666d2cc"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.15.0/carina-0.15.0-linux-x86_64.tar.gz"
      sha256 "119a2976ba47514d820ff8a968b0ac6bd952811ef9c8fe924d67f5cd0d856d83"
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
