cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.300"

  if Hardware::CPU.arm?
    sha256 "29d8fcac7f3f79f5ed68332da194e0dcab3b08251c250641b22eb8ffd5d00936"
  else
    sha256 "f2ad724c9d1dc777b07f8b13d72f5928ee032f3a03ef11279329a09f6eda56d9"
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
