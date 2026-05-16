cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.6"

  if Hardware::CPU.arm?
    sha256 "2f5fde316c5e761d7b464703ea7e80d5291e33a43af3af83e69f4e35c3e961a7"
  else
    sha256 "60a7950a3912e7909487dc9711c0802ab5d9fd3ae75a0db19299e824c619874f"
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
