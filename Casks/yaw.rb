cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.90"

  if Hardware::CPU.arm?
    sha256 "ac975d0a1d2a14208f824c57a07476a321e1213a5fbb6473adb06db8c2eda01a"
  else
    sha256 "0deab008521fefc771c1fdcdffe86ce8aadef1cd7d36813d1a104c77bdd3ef40"
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
