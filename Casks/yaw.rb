cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.16"

  if Hardware::CPU.arm?
    sha256 "c23bda590881f91c0fdc1f47e05aca41d402e407935cb87677d39855baee21e8"
  else
    sha256 "ac663c901c93b994ceddcf43633d15e6a22c01af7a1bae53ad1a4d41d30465b1"
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
