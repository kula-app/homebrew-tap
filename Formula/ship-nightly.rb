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
  version "2026.08.16.150606"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.150606/ship-darwin-arm64"
      sha256 "836856c5769e515b060f15c6f609bb515dddc52257ccb8769ade735c5a5c7f37"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.150606/ship-darwin-amd64"
      sha256 "fbd6d31800f5af9d209b2e013ae15aef82a374236dc4de7db764e872ce3fdf84"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.150606/ship-linux-arm64"
      sha256 "70984f02fc37abea46e6ef6378895a8cbb8e121b644ec7232637fc1f7c324818"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.150606/ship-linux-amd64"
      sha256 "e73861c8a225bfced8293bcc9cc263adb272ccb13f45e72b7c923c5a0f6ac4e3"
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
