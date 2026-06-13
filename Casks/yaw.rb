cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.51"

  if Hardware::CPU.arm?
    sha256 "1a2812901acc1f277d8265188e3a0cc54252c4f0e942d1a5b5442ce912876c73"
  else
    sha256 "eb33d103facf166fc50d35974c8379ed7687783f1baca3deb5971dac4f99969f"
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
