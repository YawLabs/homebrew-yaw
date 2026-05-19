cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.17"

  if Hardware::CPU.arm?
    sha256 "454560739469153e6b0f66225ba6393247ce1d445c1a4035c8c3050fc5347bd3"
  else
    sha256 "4567999179df5f5c66d93ee61c3c7cd09829da97c96c8305d6468c02e3ab81ed"
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
