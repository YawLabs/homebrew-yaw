cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.18"

  if Hardware::CPU.arm?
    sha256 "92a2398f790a27b6cc937ab9f97960fcfd66dcd82768c1c3e12f856cf4f6cb6d"
  else
    sha256 "97f1b382249c9c89ffe881894a411aa6333b71a9d361180b2c372d4d42035980"
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
