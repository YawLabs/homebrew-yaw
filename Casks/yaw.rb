cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.45"

  if Hardware::CPU.arm?
    sha256 "440e63696a41ee94a5b71da652b53c16b12884356812c6065d720420eacd5949"
  else
    sha256 "d42732ea6c23ba45291e874a49fc5bc98b29e1db4479061dec7be975280462be"
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
