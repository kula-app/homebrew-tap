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
  version "2026.08.20.194824"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.20.194824/ship-darwin-arm64"
      sha256 "a239b3e1b19d1aeb7702923a02c727c13dc2e4a9c92cb0325aca72737eb84c6b"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.20.194824/ship-darwin-amd64"
      sha256 "5f0e8d30a3623c152c5b35654d7e2fc5602dbb5ba8e4d441919acad7dd521126"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.20.194824/ship-linux-arm64"
      sha256 "b7f6ce921e37d5d1352d8e4c648c6580e8211c15130e4d4f120f7b8189e5ea04"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.20.194824/ship-linux-amd64"
      sha256 "380835cfc541d6e4df2c97c2dfa469c5b276a82fe55e6ec7cf48ced4bb89060a"
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
