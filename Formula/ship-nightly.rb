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
  version "2026.08.16.165448"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.165448/ship-darwin-arm64"
      sha256 "18534070b3b832973ca685c123df2e0f8bbfe6f0acdb5291cccbb94b9bce255f"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.165448/ship-darwin-amd64"
      sha256 "9ce273b3b7413a554832ea7c2030538580ae197111b4b8774d391ed80f03258e"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.165448/ship-linux-arm64"
      sha256 "e735528db7b8744e0acc649eb69bfdb78d6b94d37c30ae1a0e3ec19addcd1922"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.165448/ship-linux-amd64"
      sha256 "73a316b1477bc8488f1d5074c58c02471eca50ed84534b0bd41af0e97487a2c4"
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
