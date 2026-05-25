cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.2"

  if Hardware::CPU.arm?
    sha256 "d1c13280f48be3ebf194fcad3064339fe1556fc4983f20a1a751e5a9eb47e667"
  else
    sha256 "d572e7dc3cf35fa87ace61ec86338405675e36c385714b91d609a02a162a5077"
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
