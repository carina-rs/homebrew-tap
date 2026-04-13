# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.4.0, 31ff5bb50931f65f69f410c7d493016253461e2b8c60ab64ff85e149354ceff3, aa35e244b2bb6e688b7ae07001b2060a6a4164880cecb884c12b9c2ad02db2a2, 55ca69a321651628e4fb51ce35fa60f7938c997f6976699d9036a362b0bce72c, 43dc5ec66f2a521a48f94f11087af065f3cd44a6e372a935947d99186e0fd380

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.4.0/carina-0.4.0-macos-aarch64.tar.gz"
      sha256 "31ff5bb50931f65f69f410c7d493016253461e2b8c60ab64ff85e149354ceff3"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.4.0/carina-0.4.0-macos-x86_64.tar.gz"
      sha256 "aa35e244b2bb6e688b7ae07001b2060a6a4164880cecb884c12b9c2ad02db2a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.4.0/carina-0.4.0-linux-aarch64.tar.gz"
      sha256 "55ca69a321651628e4fb51ce35fa60f7938c997f6976699d9036a362b0bce72c"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.4.0/carina-0.4.0-linux-x86_64.tar.gz"
      sha256 "43dc5ec66f2a521a48f94f11087af065f3cd44a6e372a935947d99186e0fd380"
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
