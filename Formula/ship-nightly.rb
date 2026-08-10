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
  version "2026.08.10.053814"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.10.053814/ship-darwin-arm64"
      sha256 "18becac5ef6e3e3c9c0c5ec2b25f6a5c792e5547dde7eafa8faf1a2b8283961d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.10.053814/ship-darwin-amd64"
      sha256 "aac208a75367b3b94566fd53aed6a3356533caf18d1a8206feb7c38950292a88"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.10.053814/ship-linux-arm64"
      sha256 "31431838c227a3720d7f01bc72a849d902b035db7d55a9909e97bb324843b6d0"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.10.053814/ship-linux-amd64"
      sha256 "67b265039ca394b91b021071c08311d161b8a8a271b066620aa53bfb23a49b76"
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
