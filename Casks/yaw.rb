cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.8.2"

  if Hardware::CPU.arm?
    sha256 "8064271b381c20c02a2676a3f190731454c42aa14717e397c3bc3edfd3c084d9"
  else
    sha256 "fc26f88479d130585f9ec6728606875c7b1886af4b8998bc57b15ac81a51a280"
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
