cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.7"

  if Hardware::CPU.arm?
    sha256 "3967098704a5739c6611321ac71351fa157fad40778520c884e14613b592afa2"
  else
    sha256 "13137ae59f5c0bfb38bb093fcd8ec17e6d1f096b18cf7a48a1fc454ce795865c"
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
