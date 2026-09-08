# Homebrew formula template for `ship` (nightly channel).
# Moved here from kula-app/ship per the publisher design migration. Rendered by
# .github/workflows/_homebrew.yml when channel=nightly and PR'd to
# kula-app/homebrew-tap.
#
# Unlike the old rolling `latest` GitHub release, the registry serves each
# nightly at a version-pinned, immutable path; `version` is derived from the
# commit timestamp so `brew upgrade` always treats a newer build as an upgrade.
class ShipNightly < Formula
  desc "CLI for Shipable app deployment workflows (nightly)"
  homepage "https://github.com/kula-app/ship"
  version "2026.09.08.185837"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.08.185837/ship-darwin-arm64"
      sha256 "93c1b391c65ab23a9a08a4b44a884e5f5fc6910aaf8eab666770e195a00f9262"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.08.185837/ship-darwin-amd64"
      sha256 "47be4e49ae1c7d3f7888895fd4100c2c71d73856f6e2a6a1d913d4d53e0f4ac6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.08.185837/ship-linux-arm64"
      sha256 "4e1f8a21b48322a0312d736d181e1e2be0083b2c06171bafe5ca20b5598a4430"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.08.185837/ship-linux-amd64"
      sha256 "40866cf80080c4f29d6391f7cdc64d13e91e7a368d82424cb8cd6d0f8e6bce4b"
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
