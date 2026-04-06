cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.147"

  if Hardware::CPU.arm?
    sha256 "da15e7b0edcda7e8169b8325e35a2335900f2e2f7ee3c6e518ec8ff7ed64e0d4"
  else
    sha256 "05431a1f97ce01fd8f55e1e3ebb1b44954a869012922b9164fccf7a20ec08d83"
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
