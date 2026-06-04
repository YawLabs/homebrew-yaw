cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.31"

  if Hardware::CPU.arm?
    sha256 "2575fb6901d346e7742a5ee7ee5af70ade114d2a469a37cacea4d1bb068e9e50"
  else
    sha256 "a42146457ee50528c73486612d456dffc70f1f595c021e112e2ff19478e74cf9"
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
