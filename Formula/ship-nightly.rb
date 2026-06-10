class ShipNightly < Formula
  desc "CLI for Shipable app deployment workflows (nightly)"
  homepage "https://github.com/kula-app/ship"
  version "2026.06.10.115316"

  # Rolling build published from the latest commit on `main`. The `latest`
  # GitHub release is overwritten on every push, so the download URL never
  # changes; `version` is derived from the commit timestamp so that
  # `brew upgrade` always treats a newer build as an upgrade.
  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-darwin-arm64"
      sha256 "8442e2c3b7ea9ab96e0ed94a6c7bdb9ffa71d77e1dfc40310fc10efa8f00a28e"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-darwin-amd64"
      sha256 "06bcde4c01c137a6bf51df6ef6b61aa2c88652f1ca8287dc84a49f6ab6011900"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-linux-arm64"
      sha256 "f197af35249f45bf163f2e1045aceae959df4c9f2af945f35ba897ec3d3bff33"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-linux-amd64"
      sha256 "b96e9be0a435b5ca831a692552f9539957536cc7aabbdab52dc09174013d4d8d"
    end
  end

  # Installs the same `ship` binary as the stable formula, so the two channels
  # cannot be linked at the same time. Switch channels by uninstalling one and
  # installing the other.
  conflicts_with "ship", because: "both install a ship binary"

  def install
    binary = Dir["ship-*"].first
    bin.install binary => "ship"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ship --version")
  end
end
