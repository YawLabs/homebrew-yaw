cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.38"

  if Hardware::CPU.arm?
    sha256 "52095cc9ffa8c2d20fb3b5ad7c9e010e3bb7a5f62e89d42475ef1ac3e4641245"
  else
    sha256 "baa8df388b97741bd3123c39de8b6d8905b12e59c7ec2f68f35f897eec2934d1"
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
