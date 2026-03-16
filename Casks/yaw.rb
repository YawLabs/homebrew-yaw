cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.102"

  if Hardware::CPU.arm?
    sha256 "4a6f2491581845a4bcbbd68f4836c70b76aef6be034c30654b0726c2c347ff70"
  else
    sha256 "76c8ad29344f29b28ea83c8382cf0cc1122e168d3b991041da7327814243d052"
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
