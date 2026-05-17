cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.13"

  if Hardware::CPU.arm?
    sha256 "49c7aacfcdb12c99196fcbab707a176f277e0837211858d153ddfde24faf7701"
  else
    sha256 "d1ea8f9f16093d8912d71fe7d2da57841a581b49be10bed17caf1c6fc6acdc84"
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
