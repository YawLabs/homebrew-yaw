cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.127"

  if Hardware::CPU.arm?
    sha256 "9b072a2fc577dcb36105e631f02a37b30f23cec3ecc78406d85c7d803139f35f"
  else
    sha256 "e7f9404a4489e9f5adeb68e043eb5cb4b5f9a6c9fb578227dbef94993e3257b2"
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
