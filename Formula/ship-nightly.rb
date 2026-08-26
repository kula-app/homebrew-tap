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
  version "2026.08.26.124004"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.26.124004/ship-darwin-arm64"
      sha256 "d3f42a7a4a6e1f12e92a0617ad0e4fb79b3cd060139e1cf6f1377a55060a6905"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.26.124004/ship-darwin-amd64"
      sha256 "c7a022b18621777b7e8ded78b8166544eb99f6c17bb5180b5c02b2517e1c20b0"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.26.124004/ship-linux-arm64"
      sha256 "baa7ecc2b731e040edbeea38586e5cd7f64bda4085be3b5becedddab9cafa40a"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.26.124004/ship-linux-amd64"
      sha256 "1003eccc04f8f57695a83030afadb2576bc4da10ad2f0857d4a97f65f658b236"
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
