cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.92"

  if Hardware::CPU.arm?
    sha256 "6e0bd770f68e08729d5980bc52620221ccb7c725fd29961ad63d882da11d8f51"
  else
    sha256 "eedc23263d8e0ade88be3192ae9d4a7974570f6a15b0ec5b970467da55265d0c"
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
