cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.38"

  if Hardware::CPU.arm?
    sha256 "1d82bd199405aa6e915075c8b1725781ff8c539107491a71aec201986f51b054"
  else
    sha256 "941f7335d8d6ab9fe316e31c22b4d2be23c477ab6a799574317df6a9462d1b20"
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
