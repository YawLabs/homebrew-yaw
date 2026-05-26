cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.3"

  if Hardware::CPU.arm?
    sha256 "17e41cea8e4f9a6fed40a97f9ab501a18e3ccd5dcb1b551421da971ca8211503"
  else
    sha256 "5d5002ece32f4df2344bf6a4815d3b2d3fbc051d942fea9b54ecfaf78c5459f9"
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
