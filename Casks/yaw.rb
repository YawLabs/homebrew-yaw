cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.82"

  if Hardware::CPU.arm?
    sha256 "10b9a63d4608e501040c50708d161c4cd65d16369ec7b2f38b9d3a97bc3b9a5e"
  else
    sha256 "34c584e809992140c608d6161ea0bad78619511fddb36ad769495cafd684e6cd"
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
