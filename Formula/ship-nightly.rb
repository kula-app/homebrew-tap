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
  version "2026.08.16.151126"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.151126/ship-darwin-arm64"
      sha256 "52e087c17aa3603863cf24f537a1c15e379f814ba043501784b9037e8154ed19"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.151126/ship-darwin-amd64"
      sha256 "0eb7fde1f140071c15694384afe3fdf6397b0bd5eb6be8e6fec0e881dd76821d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.151126/ship-linux-arm64"
      sha256 "c653d20ff3172e844c04c50f7313865452cd7997e60d2d33f7e07f82a057d4c1"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.151126/ship-linux-amd64"
      sha256 "aeb31ed805ffb4689db0369fcf2bee7add4f4d7151086d4931cce2a9ff0d5653"
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
