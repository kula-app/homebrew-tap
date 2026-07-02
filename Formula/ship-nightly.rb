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
  version "2026.07.02.231636"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.02.231636/ship-darwin-arm64"
      sha256 "8b8c18dd89f6c40dbfaed41a7f1c4403cd6177fd7b4591cf3f2677a84c9ab49d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.02.231636/ship-darwin-amd64"
      sha256 "6d6379eb9fc6b9e3c437e28c7f72c1d171b9e9efc71d95f514a28b37620f8e04"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.02.231636/ship-linux-arm64"
      sha256 "41d6425773ca12c4fbe6f01ede78bbf318923ccf0c535a38f61f63ec93d66a27"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.02.231636/ship-linux-amd64"
      sha256 "2b141bc617ad32d83fb9e760eef726fb8ef2a6bebab9d5161618b8f13012114c"
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
