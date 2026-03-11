cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.98"

  if Hardware::CPU.arm?
    sha256 "0368413e517a5d38fcb452745579a1e6700c2f3ab1485307b97b07cd9822d863"
  else
    sha256 "ec9a3001d27b7dadcdf9b46a4c49ac8ec48c100ad6933684fdfdf7bf6354c92a"
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
