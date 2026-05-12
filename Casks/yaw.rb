cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.30"

  if Hardware::CPU.arm?
    sha256 "5534a81edab484f1bdd179d26eb60579fbc82d8efd5f266baa7230a08ed3b102"
  else
    sha256 "c998955cb9b81219405756828ea7588ef56de8ce9cd911f0ffe707df347b623e"
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
