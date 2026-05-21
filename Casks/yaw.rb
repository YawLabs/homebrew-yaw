cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.23"

  if Hardware::CPU.arm?
    sha256 "c60b50aec8bf1d53951bca1852b8bc990f4cff4458bd3f65e1142583a5fda6ec"
  else
    sha256 "e23db39d2ff1dd51dcaf82a22fbd89c1a2abc3e1c0cbfc1c7b1ccec9ce88c362"
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
