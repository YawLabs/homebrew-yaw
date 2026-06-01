cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.21"

  if Hardware::CPU.arm?
    sha256 "4836d3f50738ab672abe6838b02a5e68918e17512145b9d8d6944754b4a0d4f6"
  else
    sha256 "69099868bb27957d150cea659b1936d71f9e528caa59f804f09da0e84bd3165a"
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
