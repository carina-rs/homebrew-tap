# Homebrew formula template for Carina
# This template is used by the release workflow to generate the actual formula.
# Placeholders: 0.11.0, 3444ee2ee0056cd9e9c89643b0fb238d1246d8afc5a519b0e384e3a630b00af9, fa8fffc586ac91db10c492c4dca9b44cfe1b26b5bca8280f5b0ec3c0d44dff63, 77053371f6c9e0ec190e39fdf2a9f9a2a87b789cf748ebfd38dd768a4f25beb7, 6c324ba4717794b81a8e801d04568d883ea926dee199904432e9fb20112ae88d

class Carina < Formula
  desc "A functional infrastructure management tool"
  homepage "https://github.com/carina-rs/carina"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.11.0/carina-0.11.0-macos-aarch64.tar.gz"
      sha256 "3444ee2ee0056cd9e9c89643b0fb238d1246d8afc5a519b0e384e3a630b00af9"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.11.0/carina-0.11.0-macos-x86_64.tar.gz"
      sha256 "fa8fffc586ac91db10c492c4dca9b44cfe1b26b5bca8280f5b0ec3c0d44dff63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/carina-rs/carina/releases/download/v0.11.0/carina-0.11.0-linux-aarch64.tar.gz"
      sha256 "77053371f6c9e0ec190e39fdf2a9f9a2a87b789cf748ebfd38dd768a4f25beb7"
    else
      url "https://github.com/carina-rs/carina/releases/download/v0.11.0/carina-0.11.0-linux-x86_64.tar.gz"
      sha256 "6c324ba4717794b81a8e801d04568d883ea926dee199904432e9fb20112ae88d"
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
