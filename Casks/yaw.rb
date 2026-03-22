cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.123"

  if Hardware::CPU.arm?
    sha256 "e696023f5a261cd3bf8e3f9c8eef0920f3cdcf30fe6d7f1f14ae864806b218ff"
  else
    sha256 "34786aae42d5cf3427503a0346b72b9dee8d8e7dc0e9f4d3512c72a86387af02"
  end

  url "https://yaw.sh/downloads/yaw-darwin-#{arch}-#{version}.zip"
  name "yaw"
  desc "A modern terminal with built-in connection management and AI assistance"
  homepage "https://yaw.sh"

  app "yaw.app"

  zap trash: [
    "~/Library/Application Support/yaw",
    "~/Library/Preferences/com.yaw.app.plist",
  ]
end
