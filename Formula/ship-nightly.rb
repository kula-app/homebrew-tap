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
  version "2026.10.06.124804"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.10.06.124804/ship-darwin-arm64"
      sha256 "2966c8fe4e3bb4b302041408265f5918482950e4e80ff0db47c72eeb8da7f7c5"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.10.06.124804/ship-darwin-amd64"
      sha256 "d09d121ae28f91bdf11b71546c31dc4a6cc1f4af3f1a2c839936bb82cade0465"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.10.06.124804/ship-linux-arm64"
      sha256 "40d719571ce0f62fda5f8d5a9a13e27981808551b5646be2111f7b6abdb58096"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.10.06.124804/ship-linux-amd64"
      sha256 "79b1ca8a48cef177dc180b2d2b9d6a03c23377c12026ca7da90aac830c98878c"
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
