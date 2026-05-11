cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.13"

  if Hardware::CPU.arm?
    sha256 "4185049e4baa7af0611e6c63db40150557c464716a240d73e1a481be2f587228"
  else
    sha256 "cc321591d6e6fa35a68d585f25df7bd47d6790c993e91468739dbd9e2e3245d1"
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
