cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.107"

  if Hardware::CPU.arm?
    sha256 "4d82fa30ee39ae7e8c4294bbaff62af22edcaaa22b5dddb369698c04bcf79ae3"
  else
    sha256 "d86215fb8d5300f71b973b0e3ef425cfde2c118b31742b4fbf809ee9e578a2cb"
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
