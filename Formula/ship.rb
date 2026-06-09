class Ship < Formula
  desc "CLI for Shipable app deployment workflows"
  homepage "https://github.com/kula-app/ship"
  version "0.0.5"

  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.5/ship-darwin-arm64"
      sha256 "9535062465c330dda2d0087cf1e0118bc80345704759b30ef3e408af304010ce"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.5/ship-darwin-amd64"
      sha256 "15e23c75e9030d0f9edeaf6f178290b38129990e1cd951fb4674978625b2a4d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.5/ship-linux-arm64"
      sha256 "1ea9d9bc41d5c1cc93e1fb8acc57685d1c03978e832ff5fdce38d365666c6019"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.5/ship-linux-amd64"
      sha256 "fdd20c29afde4b05ed2f1a3db6a109dd598666f0e295e3689dd03f7fdb068fe7"
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
