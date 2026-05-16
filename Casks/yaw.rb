cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.37"

  if Hardware::CPU.arm?
    sha256 "7ab1a4ebe005171ec0740b6366cbbdedd4580da97a868c9af23816debb6d9440"
  else
    sha256 "f97e132dccadfa750cd3af827c66742ae46d60dc4f6fcbaeabb6c9718017b3c9"
  end

  url "https://downloads.yaw.sh/yaw-darwin-#{arch}-#{version}.zip"
  name "yaw"
  desc "A modern terminal with built-in connection management and AI assistance"
  homepage "https://yaw.sh"

  app "yaw.app"

  zap trash: [
    "~/Library/Application Support/yaw",
    "~/Library/Preferences/com.yaw.app.plist",
  ]
end
