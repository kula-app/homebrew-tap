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
  version "2026.07.17.115816"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.17.115816/ship-darwin-arm64"
      sha256 "cbe294d79fdec62a2c715b250c7c633fa8c8af6005ae232e94fa17ae19f3cdee"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.17.115816/ship-darwin-amd64"
      sha256 "667ee73feab1b88d8ba7a0bc1727abb48b71257ffc09099182fe5bfc09c7d725"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.17.115816/ship-linux-arm64"
      sha256 "e28280df570e63b3f65f140a824c85958f4b5d4eafb0157212aa972aa8449202"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.17.115816/ship-linux-amd64"
      sha256 "3bc1ba7b65a302c9a2a0e6da5bfbfe6c7079f598c4f6d5f8717ce388f3becea1"
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
