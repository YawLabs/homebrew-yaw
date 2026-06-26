cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.66"

  if Hardware::CPU.arm?
    sha256 "2a08b1a89a4d04e6711b529c42e799a3e3ab8ae9592ad4af465c8ca80506e788"
  else
    sha256 "9385fda17d065df6bf1b4ef3da1e9150ac936ffad381991fcde185c8c4ae054b"
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
