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
  version "2026.08.15.123431"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.15.123431/ship-darwin-arm64"
      sha256 "6f5ad767126af3d12189d914690bfc35cf83061eeda6e4644cfb5c01e70d17a9"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.15.123431/ship-darwin-amd64"
      sha256 "39e656f6ecbdda6f8372ced25b06193798825b0cfd6f0c1aa28488b1e844c289"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.15.123431/ship-linux-arm64"
      sha256 "7e7872e5487e4b619a2339d7d67897973e320ad2b9dc97aa250ce8f39420a3ea"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.15.123431/ship-linux-amd64"
      sha256 "2a2cd020da2ecf442445e29129b1c12c3ef42847fd905bba9b31a892972756c3"
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
