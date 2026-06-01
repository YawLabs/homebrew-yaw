cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.19"

  if Hardware::CPU.arm?
    sha256 "dedc4fd0c998d52a02194ccdf3c9c381e3e687db719e1a416076ff7adb821516"
  else
    sha256 "9fdf67ad72cc2aed4b789bfbaee460a001e221296f24f1cfa619818f80b8cebe"
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
