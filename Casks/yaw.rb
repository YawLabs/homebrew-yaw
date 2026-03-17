cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.105"

  if Hardware::CPU.arm?
    sha256 "1581ce86539faf43de82007997b94924a109015eb6923b95c07d4d5a93711067"
  else
    sha256 "1554bade00a2f12b87293f28f17a2aa7e1d4996d07ee1c1077bbda8b40285f7c"
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
