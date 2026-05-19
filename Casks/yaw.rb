cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.15"

  if Hardware::CPU.arm?
    sha256 "05ae142868ae27bc0b806af59151294baa9b2bc0525405dc1eb3ed6648bc7782"
  else
    sha256 "bf6060825ba114d0ee4b2e44c3eac8d4e9b42876dbc7031a0c6481d88d3aeaa4"
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
