cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.16"

  if Hardware::CPU.arm?
    sha256 "fa3e1baffeba20b0bbee8d5af6310cd16dc9040bccf805f72defa941537a7cf4"
  else
    sha256 "839857cf18ff854bab4a78779ae224898b9684f958b33459a34a78b3c33d03b3"
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
