cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.87"

  if Hardware::CPU.arm?
    sha256 "9be2c0acfb257c2940a5136adb149b86e68543758f88550e2979945429e3324f"
  else
    sha256 "eae04a910408f2c2abc5f6ea2431ba46f8e5874f7edd5e7ec6df989dd7dce6c2"
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
