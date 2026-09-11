cask "yaw" do
  version "2.1.0"
  sha256 "9be9300a91d07243cc01fd33a2ac8524d7f8cfb293b6a8caed877e0f8e6a697a"

  url "https://downloads.yaw.sh/yaw-darwin-arm64-#{version}.zip"
  name "yaw"
  desc "Modern terminal with built-in connection management and AI assistance"
  homepage "https://yaw.sh"

  # Apple Silicon only. No mac-x64 artifact has been published since Intel was
  # deprecated: scripts/build-platforms-tailnet.sh pulls only darwin/arm64,
  # release.sh computes no Intel hash and its cask rewriter assumes a single
  # checksum line, and the app's own updater blocks Intel through
  # isDeprecatedMacX64() (src/auto-updater.ts) precisely because the download
  # would 404.
  #
  # This cask was the last artifact still claiming Intel support. It carried an
  # `arch arm: "arm64", intel: "x64"` stanza and a two-branch checksum block, so
  # on an Intel Mac it resolved the URL to yaw-darwin-x64-<version>.zip -- which
  # has never been built -- against a checksum frozen at an ancient release,
  # because the release rewriter only ever updates the first branch. The failure
  # surfaced as a download 404 at the moment a new user tried to install.
  # depends_on turns that into Homebrew's own clear unsupported-architecture
  # message instead.
  depends_on arch: :arm64

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
