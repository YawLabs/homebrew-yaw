cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.34"

  if Hardware::CPU.arm?
    sha256 "a7fe3ae3ceeee138957865b1e081e86dd4fe9f4c76d4cd468c3ec658f386d8f3"
  else
    sha256 "dacd758a9a64f5c00851b0d8ab952eb9cd560909205af7437722a765d0b7cf88"
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
