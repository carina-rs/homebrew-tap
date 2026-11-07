# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.12.0, 57f72ac3c37e9b08becd2d9e132da8a16c35d12f3142914a7b83880129db417b, 58f4211a5a00ec7744b2b60bbb3c03afd5851044c0c59dc8df8e5de9a406ae3e, 679d4bc7fa95ef9914d85f340ff01835aca30df52f5c81c30353fb9359f6ed51, 45db1bd1c224d57ff746112a9f63bf4ff0962a4ffcef6a073de1023cd1f2ae64

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.12.0/carina-0.12.0-macos-aarch64.tar.gz"
      sha256 "57f72ac3c37e9b08becd2d9e132da8a16c35d12f3142914a7b83880129db417b"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.12.0/carina-0.12.0-macos-x86_64.tar.gz"
      sha256 "58f4211a5a00ec7744b2b60bbb3c03afd5851044c0c59dc8df8e5de9a406ae3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.12.0/carina-0.12.0-linux-aarch64.tar.gz"
      sha256 "679d4bc7fa95ef9914d85f340ff01835aca30df52f5c81c30353fb9359f6ed51"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.12.0/carina-0.12.0-linux-x86_64.tar.gz"
      sha256 "45db1bd1c224d57ff746112a9f63bf4ff0962a4ffcef6a073de1023cd1f2ae64"
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
