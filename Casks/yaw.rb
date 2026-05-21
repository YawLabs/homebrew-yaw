cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.22"

  if Hardware::CPU.arm?
    sha256 "3db01dea2d646687102289d6dbb549b5f9a27b1940531b617deeb3debb37c30f"
  else
    sha256 "4c16d69e04ed22592dc2f087a346622b97d6e1cadadf0a1f5d64b87d71429155"
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
