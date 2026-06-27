cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.67"

  if Hardware::CPU.arm?
    sha256 "acb413d123d202b733a5415bb3f05b2ccdd8f3fd057aef379610f3208cb61bdb"
  else
    sha256 "9cda97cbeb33c868d61bf811480ce8fa471c2331735f8f7dd9da7a610a221d81"
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
