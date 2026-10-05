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
  version "2026.10.05.222658"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.10.05.222658/ship-darwin-arm64"
      sha256 "a91d66607c2b03f50827841d6022beb98857adbc6317e9359bb1de94a9025ad3"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.10.05.222658/ship-darwin-amd64"
      sha256 "27f22433729b8e476a16aeeb40aa2c7737d354b47e748f35fb2693a47275a3f8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.10.05.222658/ship-linux-arm64"
      sha256 "83d6b4acc273a2fcfd700e2f06b008b1ba2ad26181631a84ceb8b905116ab253"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.10.05.222658/ship-linux-amd64"
      sha256 "c03ce9678b8caf874cf09522dfd62ab0cd26fa22fb9914bcfd7b5db78a8ad0f5"
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
