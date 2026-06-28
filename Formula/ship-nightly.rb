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
  version "2026.06.28.131256"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.28.131256/ship-darwin-arm64"
      sha256 "e1cb8042a9d703fdc651204baffeff52fbb025ad62caf088017f4b203ac8656d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.28.131256/ship-darwin-amd64"
      sha256 "1d5eee7b0684bf8b21d1bacac0383dbce288c600fe9b64b1e39ef5a25d503e48"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.06.28.131256/ship-linux-arm64"
      sha256 "8676fa6c066d214df79e39859e5f0979c18669826d84effa5e65517a5b08957d"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.06.28.131256/ship-linux-amd64"
      sha256 "0e6b08a8a16f8af168d13fc8a609216d01ea3fe4c63adca2963ac1adb45688a7"
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
