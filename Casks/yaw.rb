cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.134"

  if Hardware::CPU.arm?
    sha256 "585fa356f478286f1ff0a90467fb1f6ada88f465814198a58bfd2ffa691add88"
  else
    sha256 "e049f1ee59b26b63d5524e8927c4a93c18438881a6f1f6bd404a6fa79132c950"
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
