cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.83"

  if Hardware::CPU.arm?
    sha256 "75441e89e855a90c1e6f4a612754ca04af59ae698e0ca0852c5c2b11856aabdb"
  else
    sha256 "1f5c5b5518b851d58bc52e183b2bdfaede0caf9d5eededc68332e82866f2e754"
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
