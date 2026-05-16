cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.0"

  if Hardware::CPU.arm?
    sha256 "1d40377320ccf3ff4ab8d2524044252c32cdcf644287ddcd7581e275948af721"
  else
    sha256 "387912520a5039f3bab7233d2585078b18133b0db93af9e3eb37efe3ad8023d4"
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
