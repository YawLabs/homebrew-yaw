cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.12"

  if Hardware::CPU.arm?
    sha256 "0edd0eda2004c412ba16c0dbdecc64cd99e9aec78fbb7b4f274de478271249aa"
  else
    sha256 "4c1e0a6b221d974a914f18935e7fee9b4fd2217f983f0482154213774b02ac02"
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
