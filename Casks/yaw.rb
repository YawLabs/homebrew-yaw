cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.94"

  if Hardware::CPU.arm?
    sha256 "c7e88f6cca1ae4558798bbf6985c8775c4d5ca3ba66a533857ac10df4e931409"
  else
    sha256 "d693893f870d15025e1465c2444db85ed2b06822e3162ff40d31fb16502fdda0"
  end

  url "https://yaw.sh/downloads/yaw-darwin-#{arch}-#{version}.zip"
  name "yaw"
  desc "A modern terminal with built-in connection management and AI assistance"
  homepage "https://yaw.sh"

  app "yaw.app"

  zap trash: [
    "~/Library/Application Support/yaw",
    "~/Library/Preferences/com.yaw.app.plist",
  ]
end
