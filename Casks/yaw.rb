cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.8.1"

  if Hardware::CPU.arm?
    sha256 "015b461de7f79c47c61588bc04d1d56890b28f3822355c95bd0dd44c69add58b"
  else
    sha256 "b0171bf1cf56025788f50e2da2cf27db7b4727732fd2d6d892cdf9d2d9f8558f"
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
