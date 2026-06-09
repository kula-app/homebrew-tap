class Ship < Formula
  desc "CLI for Shipable app deployment workflows"
  homepage "https://github.com/kula-app/ship"
  version "0.0.4"

  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.4/ship-darwin-arm64"
      sha256 "61662e9421a4b2caefea3caf7681188454cbf7cb5b104cc8c091289ef2a37a3b"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.4/ship-darwin-amd64"
      sha256 "765f00d5cacc16134e70a1447453be057b573c45ca361eb9e37396a6d552fdba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.4/ship-linux-arm64"
      sha256 "22c3f1690c54dc0d3da945f82b2045d3b23125c559ce14bfe93ce20f3b24ad2c"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.4/ship-linux-amd64"
      sha256 "8d20b4358604a68f5c74648ec4d878cde120ac2b4d067e80e38a07116c99944e"
    end
  end

  def install
    binary = Dir["ship-*"].first
    bin.install binary => "ship"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ship --version")
  end
end
