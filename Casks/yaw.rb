cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.18"

  if Hardware::CPU.arm?
    sha256 "ea85a62a01c77840337f1a011838b7583754ea4ac9b686b31b2c5aaa39f5091c"
  else
    sha256 "9304d5847699c42e62b55749b1e0c714f7ccb34d1ff837301eaec7eddf306851"
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
