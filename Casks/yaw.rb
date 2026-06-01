cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.20"

  if Hardware::CPU.arm?
    sha256 "515fe56237908d0cf69ac6442c72841a696c6db4b58c86eefc54c8e4c7741abc"
  else
    sha256 "f6f2fc9a444ba55aca6c886446e36a36b91cd1e26bd4a341c162cd63baff46da"
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
