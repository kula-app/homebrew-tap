class Ship < Formula
  desc "CLI for Shipable app deployment workflows"
  homepage "https://github.com/kula-app/ship"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.2/ship-darwin-arm64"
      sha256 "e83909dec9fae8191345797cedc1d82e90e3b95e07b4b7e0d7395319dcf5da9e"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.2/ship-darwin-arm64"
      sha256 "e83909dec9fae8191345797cedc1d82e90e3b95e07b4b7e0d7395319dcf5da9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.2/ship-linux-arm64"
      sha256 "c86d3baf539591a987bbb2b7024d291fcf48dcf4be83671076c616df24a0c8db"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.2/ship-linux-amd64"
      sha256 "8ceafa5e613344f71ea7b34181ccdf4bf12d5c9394037eaf1f7753fe46da4955"
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
