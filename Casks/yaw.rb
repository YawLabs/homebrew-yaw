cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.11"

  if Hardware::CPU.arm?
    sha256 "b95b385f616ff9a1b8792fc7e1d41f53f831f75da745dc599cce57e9405be54a"
  else
    sha256 "01935a3867f4e43abffa6ede630b96df4076b1de54ef77b6fc3633f7adb4c107"
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
