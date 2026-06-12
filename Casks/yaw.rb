cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.49"

  if Hardware::CPU.arm?
    sha256 "791c84857ab06b711205e851e003971e0041b8eb0a43f9bf776ed8e92e6cd9ed"
  else
    sha256 "5e140976c3d4872d2575c79bebe6820e601c5ddc2806d3363526a54362efa50d"
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
