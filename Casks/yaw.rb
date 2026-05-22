cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.8.0"

  if Hardware::CPU.arm?
    sha256 "b5697801b9d4af13b88a41166269fa632021e5847847aec718029b63251b7885"
  else
    sha256 "8a17ec17f609c1e1277089f753183c2719ae0583427a33d92410de5caf94fbdf"
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
