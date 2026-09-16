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
  version "2026.09.16.013812"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.16.013812/ship-darwin-arm64"
      sha256 "a974e4233a20b901ebba81dce0eda62dd7d0bae0df85d54526e332b2e959373b"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.16.013812/ship-darwin-amd64"
      sha256 "d28298d205295f8448a27445f0d21fc0e3455ce84444fe3ee564f2037d87963a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.09.16.013812/ship-linux-arm64"
      sha256 "cc95b041c8d51c29cd22e3b2e4def2ce847f99e5ed916a445ae680f548ffbd41"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.09.16.013812/ship-linux-amd64"
      sha256 "d0061dba501570200b2cf13ff70b67cb7bd844f90ecb0be1956bdeae35955e11"
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
