cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.300"

  if Hardware::CPU.arm?
    sha256 "c9df336b6e031f9a6b6b8e33df81cbb2a357a715fc9a4c596c8cf1dcacd5d2cd"
  else
    sha256 "6a6af0ead23b902b1218e9251364ca4e3ca7ca37e01c92fc85ebc44cf5a26257"
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
