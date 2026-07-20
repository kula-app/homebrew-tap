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
  version "2026.07.20.153725"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153725/ship-darwin-arm64"
      sha256 "b2b07750efdca60f811de0109cd81b52e8c4ea6d5011fa8637099b04a4a8ee47"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153725/ship-darwin-amd64"
      sha256 "58847b36475d5cfd9b4756430a8d0c0e5538c4dc0ddcf9fb2f1b83a1afa40b53"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153725/ship-linux-arm64"
      sha256 "f29a3022ae5e77d64f6a0b48d6044a1dc9bfe332ecaa299bc5e268a8347865b7"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.07.20.153725/ship-linux-amd64"
      sha256 "521d4b15ffaa73bf1be77d90895fd2864c0033ca090e3caa190b13b44cf84e14"
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
