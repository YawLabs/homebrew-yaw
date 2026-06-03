cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.24"

  if Hardware::CPU.arm?
    sha256 "f4805c9acee75ff573967ffa35d1fa5c28b75acece101881bea9dd6c86f02a5a"
  else
    sha256 "777d065db94a57dc449b2c7dc993ac9d08aa2f37c07be71550797a700b4847f3"
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
