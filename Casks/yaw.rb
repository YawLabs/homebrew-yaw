cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.141"

  if Hardware::CPU.arm?
    sha256 "318cde65083c59d1361465e6fe2b747d3d15752811051455576dab3bf752d57b"
  else
    sha256 "7b769ff3e1b940ff8488b28b05f559d5b64d434173fca8f6a2b832f7c0f02708"
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
