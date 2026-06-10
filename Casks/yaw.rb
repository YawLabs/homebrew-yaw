cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.46"

  if Hardware::CPU.arm?
    sha256 "d92ae77561c6a1d451f66a116f624ed3697522b63ccda10fe65829b64eb59b06"
  else
    sha256 "dec8a8386fb72a06ed4680d0f8752b73d999e2477aaa76e7182c20e5305157c6"
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
