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
  version "2026.09.02.230415"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.02.230415/ship-darwin-arm64"
      sha256 "762ce399c28d4c087223ee8fc31b1fcc110cbf2320b03ec95b930f03c3a92652"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.02.230415/ship-darwin-amd64"
      sha256 "289a7b327877bc291db2553df5034a22ba37f744e6497d102acc0fdf96d5c98d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.02.230415/ship-linux-arm64"
      sha256 "8140e52fc2f363d5958639c8efee775c9882da0d4e11d0abe29b0ffbf1a10e22"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.02.230415/ship-linux-amd64"
      sha256 "2a620d4536b80b67fd98f7ad27d096c23f00c9612370f2a3b18ca4876a043e9e"
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
