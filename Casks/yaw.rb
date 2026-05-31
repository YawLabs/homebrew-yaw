cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.16"

  if Hardware::CPU.arm?
    sha256 "6d442f6f143481e2db20e671db08f7c17e9adb19c126d3fcabd2a8101c0992ba"
  else
    sha256 "93b0588a84c296acd0502c97f0588ca6c6be38ed4b568a620a86ac4a31b7dd4e"
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
