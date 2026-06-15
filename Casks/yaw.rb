cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.52"

  if Hardware::CPU.arm?
    sha256 "73c12c6a082ec48ab7011262202a29f960023c94be554568c26d895b91844689"
  else
    sha256 "fa208a0701e365e1948a10686f44b18e79aea2baea773e2aa620d6e4f94e5893"
  end

  url "https://downloads.yaw.sh/yaw-darwin-#{arch}-#{version}.zip"
  name "yaw"
  desc "A modern terminal with built-in connection management and AI assistance"
  homepage "https://yaw.sh"

  app "yaw.app"

  # yaw is ad-hoc signed, not notarized, so Homebrew's download-quarantine bit
  # trips Gatekeeper -- and `brew upgrade --cask yaw` re-applies the bit on EVERY
  # upgrade, not just first install (confirmed 1.9.42 -> 1.9.48). Strip it after
  # each install/upgrade so the app launches without a manual `xattr -cr`. Remove
  # this once the app is notarized (the real fix; see install/release notes).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/yaw.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/yaw",
    "~/Library/Preferences/com.yaw.app.plist",
  ]
end
