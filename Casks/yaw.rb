cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.47"

  if Hardware::CPU.arm?
    sha256 "c5716dd0d57a7a9865ecb5d9357ea9073eb2e0b1bc00b14fb07aaf97d2f6947f"
  else
    sha256 "3bdd4d5f9eab311aea4907d0d680808654dd66e45b67956b5a630b11c19815ce"
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
