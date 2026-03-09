cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.83"

  if Hardware::CPU.arm?
    sha256 "698221107fb732a9aac24428735309ad72e43d10d28d764c58485600f72f5185"
  else
    sha256 "c7b339ab89fd19b98e29ecf5a7ea9c458933556b315ac7ca05ff828c6fb119f1"
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
