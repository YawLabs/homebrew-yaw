cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.29"

  if Hardware::CPU.arm?
    sha256 "b66c1801cd7fa111b4fb5d431947382361081174f0b8f05031b90309852b7e20"
  else
    sha256 "3ef1c9d14f5a10a3f381dcbcc905188a65b971e9a443d4a77ff7aa2fffb8e5c3"
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
