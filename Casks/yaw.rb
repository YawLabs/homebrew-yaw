cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.12"

  if Hardware::CPU.arm?
    sha256 "81a564b28e2826d2a7688023b7542e4450ec6ed52348d16b99a48059367e50cc"
  else
    sha256 "ccb056b9193569ced75485d4ad56df2171112648a1f7bf3851ed6e46fb6149b7"
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
