cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.79"

  if Hardware::CPU.arm?
    sha256 "9d5c2b5355ca5b597ab9c9a925171551dc0d4787eaf8baa665495f2ad0a91069"
  else
    sha256 "872d9965749c5f794223ccedc0a53ebec5106637607a6ddf316efad8584ff67c"
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
