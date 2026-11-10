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
  version "2026.11.10.172922"

  on_macos do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172922/ship-darwin-arm64"
      sha256 "38c8114df5785c5b6fc470ef6fcee867445c4eb32e4eb4531407e39488f86048"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172922/ship-darwin-amd64"
      sha256 "429449d37604ceb0b918b463c7ba831c479cd95167ce199b70811e7a3899cb7a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172922/ship-linux-arm64"
      sha256 "5703341bcee50708812a8ed5105e0875d03349586854b563bb5c8155052f01ea"
    end
    on_intel do
      url "https://packages.kula.app/ship/bin/v2026.11.10.172922/ship-linux-amd64"
      sha256 "0dfa20ca60d7052a7c643e91f931afd7575377852be0dcf70356e53df2fa5868"
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
