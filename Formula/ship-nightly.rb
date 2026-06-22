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
  version "2026.06.22.091939"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.22.091939/ship-darwin-arm64"
      sha256 "0afe1197416285cd17650aecabad1856cfe002e9c6e7c9eb7c7594e7eca40bdc"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.22.091939/ship-darwin-amd64"
      sha256 "20bb8d62feebddfa0786e1179da7785a2d5b77c5a779a871703aaade15a86d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.22.091939/ship-linux-arm64"
      sha256 "33756312dc6d6deeba324716d2daf3b616d4608eeb0ea27388367cc091b8158d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.22.091939/ship-linux-amd64"
      sha256 "8ca80e6b450a0b6376b91278bb2829318444edb4168c77d2de20cc8c77357b9d"
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
