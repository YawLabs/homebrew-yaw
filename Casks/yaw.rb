cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.35"

  if Hardware::CPU.arm?
    sha256 "61470a8bdc857702f7c3324741ed80bb3be35ff5dda6e9cf331f2bfa3b027e43"
  else
    sha256 "c415cbdcc9752cee71379ab7f9ac91f21297c049e76c70be0d8ca548987aafc0"
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
