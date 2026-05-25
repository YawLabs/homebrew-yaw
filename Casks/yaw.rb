cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.0"

  if Hardware::CPU.arm?
    sha256 "2b350116471b87fc0130cdb23595efc53daafafc65a176a046d78b72c820e689"
  else
    sha256 "e872ffba86f77a6eb87cbcb29e17da22d5340369396d414bc7af73dc88f7e781"
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
