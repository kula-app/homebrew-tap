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
  version "2026.08.13.195047"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.13.195047/ship-darwin-arm64"
      sha256 "681ff51d6923324ccf72dc116d27d566bab3762f7b3698492283970a65875876"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.13.195047/ship-darwin-amd64"
      sha256 "ee061e3d7107a77175c4205778e8c33ff51c6543210e5bde6886a9d5fa94c679"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.13.195047/ship-linux-arm64"
      sha256 "dc5b81401031bd4eb722da9d48e8044796a13d5274825e6f0ae41486b02d6096"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.13.195047/ship-linux-amd64"
      sha256 "4c556fb4e5e5e7bd90521a1eddf2cc4e6ad94079d4b46105b10cf79b4c1d585e"
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
