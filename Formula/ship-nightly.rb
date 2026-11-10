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
  version "2026.11.10.172508"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172508/ship-darwin-arm64"
      sha256 "884dbaa274147f7aee5eb641d8020cfbff7e45b41172b0fa8c657fce3d1f9c36"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172508/ship-darwin-amd64"
      sha256 "6419be09237314418fe6357be2caba73f54337137daa0b2bd43830578d315123"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172508/ship-linux-arm64"
      sha256 "aef86b0a75512ecf8d79228c1258dc99a6c51f3f7ce0180e9c2cb4019294d6ef"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172508/ship-linux-amd64"
      sha256 "5ee359450aa8114eadc7b567068a10bf4db8206a66b4a66a055e39690ed8b390"
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
