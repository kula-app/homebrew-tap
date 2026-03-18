class Ship < Formula
  desc "CLI for Shipable app deployment workflows"
  homepage "https://github.com/kula-app/ship"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.3/ship-darwin-arm64"
      sha256 "2f5fddc79b2f744c3677ec4232e4990a891a28ef83a512359d1af8aef95bf258"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.3/ship-darwin-amd64"
      sha256 "a2eb8798ebe0e78eb9eac34a6d51faf4a9cda1e6d581b70db7f09acb07de2ea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/v0.0.3/ship-linux-arm64"
      sha256 "2d1ca26d0462cc2ab0465e6129dbed2aa16b097698ba4bf54916b11cfc010a75"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/v0.0.3/ship-linux-amd64"
      sha256 "b821073097f4f3b2ec460c9bb25acfcb997beb833e255c7b669ee629d24bd738"
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
