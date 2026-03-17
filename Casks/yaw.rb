cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.104"

  if Hardware::CPU.arm?
    sha256 "3f56dffcb073485be79f75a3225b38303a31550be7cc4e378819e5d3e6d918ef"
  else
    sha256 "5bfb4c34f3dcf4e3dc636929ba34a977e83fa8c7a58e9538e1cfcf9524aef8a8"
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
