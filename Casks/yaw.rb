cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.43"

  if Hardware::CPU.arm?
    sha256 "a6cc5c05cd0ed6dae0fa72930ea07a7ecd9b4af71c6974e7912767ab95b1be8e"
  else
    sha256 "7c210c87ab514c802870266973d126380694e4e445f19748af00aee28d111aa2"
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
