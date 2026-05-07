cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.3"

  if Hardware::CPU.arm?
    sha256 "b5ec1de38f367a98c98b5a0fdb4df43819a997d3c719cb4ed48be7a5bced73e0"
  else
    sha256 "2ca6204d52f78cdb0986c89da225f1613c364f55a9a457b97ab5807f99689ac8"
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
