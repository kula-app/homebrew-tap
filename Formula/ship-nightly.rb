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
  version "2026.09.22.185223"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.22.185223/ship-darwin-arm64"
      sha256 "e38e174f86dd4bec036dcabbada417ee462f3dd3566f4de74838f24576a0fa71"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.22.185223/ship-darwin-amd64"
      sha256 "2be6cdd4ca65afbed0b75a7d6373f78a009e4b3521903d796b46b306cc6ec769"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.22.185223/ship-linux-arm64"
      sha256 "77fe1d81be3dd182e4fbfdf44bdf5e4a79b9e905d9e5229c65284ab24ebc5e15"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.22.185223/ship-linux-amd64"
      sha256 "c8ee4f620c39aa9b96006e2c32ff0185bf8b2b94416714eab2592d3b743e4b66"
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
