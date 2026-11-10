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
  version "2026.11.10.172210"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172210/ship-darwin-arm64"
      sha256 "0e51559c49fb2d6c6342aa7d353bf20823e2a0ec3a2ec0d3e9780fa24c5ea5c3"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172210/ship-darwin-amd64"
      sha256 "75014ddf5ca40899bac728ddf55aefb730aaa6002a3334e401d8c205e6c287e6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172210/ship-linux-arm64"
      sha256 "1f2ce4ba2a26c57e7b8057f4e0be03ed8f3479a7e81ecba073a9630d2a0889a5"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172210/ship-linux-amd64"
      sha256 "38d259ac02911e6db36a4e888cdae31e117c21c4ba9e1592e0aba1087409cacd"
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
