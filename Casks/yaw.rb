cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.14"

  if Hardware::CPU.arm?
    sha256 "72ccf6a1c5bef97b1ec641dec0a26307ab0eee135757a9e8b3c57e5340c3300e"
  else
    sha256 "f753fb7c3cb37b112de9c935d3eb21aa4eef6921911d63edff5a6e96767485df"
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
