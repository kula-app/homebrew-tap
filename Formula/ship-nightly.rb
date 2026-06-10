class ShipNightly < Formula
  desc "CLI for Shipable app deployment workflows (nightly)"
  homepage "https://github.com/kula-app/ship"
  version "2026.06.10.113848"

  # Rolling build published from the latest commit on `main`. The `latest`
  # GitHub release is overwritten on every push, so the download URL never
  # changes; `version` is derived from the commit timestamp so that
  # `brew upgrade` always treats a newer build as an upgrade.
  on_macos do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-darwin-arm64"
      sha256 "74ac425d3b78bcdb64179752895950360103f723ca2ab1f1066a8556a24ea1b9"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-darwin-amd64"
      sha256 "dee73d38f04bb639f0c3b7d979d2e7b69e10fba06a7db059062e5905ebbb1c2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-linux-arm64"
      sha256 "60c76d530df6683d6751c1c2f3e6796ab7d2c2e16260bdcc50ca08f9d0cf7459"
    end
    on_intel do
      url "https://github.com/kula-app/ship/releases/download/latest/ship-linux-amd64"
      sha256 "c7c35d1a7843be6a241ffbec18c34494addfa09eb7dd6bc7a018a87f5f645396"
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
