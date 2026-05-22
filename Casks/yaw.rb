cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.24"

  if Hardware::CPU.arm?
    sha256 "6fec9a2705fb810e2b89569e0ac6e8e3b6a7b3218dfa60423a855e4f1895d3ef"
  else
    sha256 "b0ff6ba1ff162c79adefda5061851553b948332e40de6329a8f1b79f066ab019"
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
