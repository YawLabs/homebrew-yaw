cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.149"

  if Hardware::CPU.arm?
    sha256 "7cfaae3c02f6aab9376aa273f6ec597361166dd42ca883a13970a48b7da23cbf"
  else
    sha256 "9dd279a75a31c6d3156818ef485c1b734dfb04e8b16f4ad8b53b444d00ef6506"
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
