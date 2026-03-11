cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.95"

  if Hardware::CPU.arm?
    sha256 "0a2490ff97770cc83434864aa566bbfd6293e13580eeb6c9bc3cdaf5c2d7af44"
  else
    sha256 "587abccf99aee607d9c1378f541602559fe61de8b0e5e217c41cce8b13abbc21"
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
