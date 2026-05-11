cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.17"

  if Hardware::CPU.arm?
    sha256 "7b1b3426dd7ab1d46e56618ada7e46bc73e3408080eafe3cc9e477d51f8453a4"
  else
    sha256 "2b717992af57d249ee080525f4a99d089e78d7f25658927b0630fdfe9758fb3a"
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
