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
  version "2026.07.07.200132"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.07.200132/ship-darwin-arm64"
      sha256 "43a419801aa26467bbde2eeeb36e205514e815de2ba72660c0b8b54c721552cc"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.07.200132/ship-darwin-amd64"
      sha256 "9814729289e902574770f5dceaa3ff846097ff4da94382111eb3777b9e833533"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.07.200132/ship-linux-arm64"
      sha256 "c99b727aa2de0b8c832a2d1c13845c0a711feb63623a33b8d6eeaa4c8f8efab1"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.07.200132/ship-linux-amd64"
      sha256 "9cb823463f1da4201f0ce51740c827f240ddbbf18cd0baa84ff168b0b0c63b99"
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
