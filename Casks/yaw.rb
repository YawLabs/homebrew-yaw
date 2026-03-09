cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.80"

  if Hardware::CPU.arm?
    sha256 "c03e62064b9b404486db2c4025340781341af2fe63380c409c7526cb19d66c26"
  else
    sha256 "7c96d70d724c6b186f06f5a511292e42346a4dae1c4e04880f8b22b7ce543dce"
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
