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
  version "2026.06.24.211418"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.24.211418/ship-darwin-arm64"
      sha256 "d987a2e9d1f0869799f19451155c30a862cc8cf79e267c1ec9242ccd234d184d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.24.211418/ship-darwin-amd64"
      sha256 "6ab628f3cbbadfed2dbc3b81ac689e5b6057742fc770b4b2f5f741719ee60bf9"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.24.211418/ship-linux-arm64"
      sha256 "6a189c63ae165c6fda2821fa097367e76b132a2a5590dec5be6e8d7c9f2239a6"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.24.211418/ship-linux-amd64"
      sha256 "021fd1ce85c27a60edb6902c21be3e895c48651ef74a498f7ea6da266bf229da"
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
