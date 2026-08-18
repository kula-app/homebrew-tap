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
  version "2026.08.18.123915"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.18.123915/ship-darwin-arm64"
      sha256 "e9084dbdd24fba1156a775a0aa0e83e6bcd38fd84afec14b1ce012761a70f2bb"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.18.123915/ship-darwin-amd64"
      sha256 "163a0ff2e9202920eda0374e73a0773683515b78e441ae85318c6ebf019000bc"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.18.123915/ship-linux-arm64"
      sha256 "9a1dca4b312bc96b6395128eff1e6c4ccf2506c4a528b071bc8c640c52e603cd"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.18.123915/ship-linux-amd64"
      sha256 "511cab7e90695b0b5953f6c4b1dc65efc1e06839712eef0b1e97ecb3ea1830eb"
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
