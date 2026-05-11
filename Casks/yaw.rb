cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.15"

  if Hardware::CPU.arm?
    sha256 "09c2cd9c9b52bad517f432d9eeb1c73f2e39275318c5f6168ae40a4c685c361e"
  else
    sha256 "4fe5f38429e4fce43d0fe61bdfa9fe4f8eda36aff75d3d1384231c1f4231bf99"
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
