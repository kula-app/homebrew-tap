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
  version "2026.07.20.153449"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153449/ship-darwin-arm64"
      sha256 "97d8f7ad35e04873ead59bb3bc61588411fba2d57ccf62dd84a97086001cd9d6"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153449/ship-darwin-amd64"
      sha256 "aa9eb120acaf46f4b50ed6601477fca59177cff20f65f2d018168a7d8fe5d734"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153449/ship-linux-arm64"
      sha256 "5a322d9992d301679da5a2909be304ad4195cf6525790820f5752cdfadd98688"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153449/ship-linux-amd64"
      sha256 "ef69686d58d6fb0b4b703588ad0343ee2bc101040bfbcfa31f5fe78a9cc3612e"
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
