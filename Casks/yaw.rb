cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.40"

  if Hardware::CPU.arm?
    sha256 "ae6c7d4d68b208f4a283e4e4ff1b366a201bd783849b891a6ac6a3dafed798c6"
  else
    sha256 "5e61d3960d25ca35bebf946b5f3d39b7f9d5f97020de627de6faf0aabbdfde81"
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
