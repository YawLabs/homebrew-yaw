cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.500"

  if Hardware::CPU.arm?
    sha256 "1289a0f6f21d83f6bdc14bfed074c4addb39d5343d5e8a230cecfa72f001465c"
  else
    sha256 "e8f3eebaebde9bd967d0bab5cd26488f254d46d686e088aab382f28572001264"
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
