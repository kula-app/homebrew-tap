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
  version "2026.08.16.143358"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.143358/ship-darwin-arm64"
      sha256 "e59953979025a9d9353f1349c68156e9ebcdc89259ddf713a59fd1ccd1f43bd7"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.143358/ship-darwin-amd64"
      sha256 "8f38e0cac4300933a2977962d9299b5fb0242d2a9c8a572e119a9f9f9f7df73d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.143358/ship-linux-arm64"
      sha256 "c5047d15567adb0891235768bc0b4658dac6b48d77925114409bc3965bbfb8e5"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.143358/ship-linux-amd64"
      sha256 "8557fd36978b655bee3e9cce57cf78ce6bd4d4a3124e9c6eca1744e8f9221bcf"
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
