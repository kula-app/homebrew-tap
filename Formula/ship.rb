class Ship < Formula
  desc "CLI for Shipable app deployment workflows"
  homepage "https://github.com/kula-app/ship"
  version "0.0.1"

  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.1/ship-darwin-arm64"
      sha256 "8c3315b65c989407880bee006c94e45c99e831289db4372632fa3cc25d83b446"
    end
    on_intel do
      odie "ship is not available for Intel macOS. Apple Silicon (ARM64) is required."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.1/ship-linux-arm64"
      sha256 "838a2ac973334903c7222ae209564197fffd187066fe51d3aed0e0861a42f1fe"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.1/ship-linux-amd64"
      sha256 "68d22bf42ee7f049ee1cb671357709ba6d950f6294e00cd9bb432d8abb3c3a5c"
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
