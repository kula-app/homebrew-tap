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
  version "2026.08.16.142045"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.142045/ship-darwin-arm64"
      sha256 "09eba749a7763d71cfa23c7d6c0e85333aca5e0bdc2536b426d978c86760b4df"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.142045/ship-darwin-amd64"
      sha256 "f10e92353fa6b24e7a7df9456b060ff8ba452703c8d76bc3aa6473e67af59ce4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.08.16.142045/ship-linux-arm64"
      sha256 "a8b4f43a2ff321dcb5bd335b25e0b6eb402796e9759d71c5b26f5cb29bf020a6"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.08.16.142045/ship-linux-amd64"
      sha256 "a983a7f1cd7374c34fd237716a91916a13997461c1919fd61c203b8214ec7b60"
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
