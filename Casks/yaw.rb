cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.33"

  if Hardware::CPU.arm?
    sha256 "9f9a6f567ae08712bc5a0f44fbbf54832093212079e09a4623154d9459734ec6"
  else
    sha256 "69ff3cdb57f63773d6892eec73c31eb9d9fb39a84b37257f04cb642a07f94766"
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
