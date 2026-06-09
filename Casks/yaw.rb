cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.44"

  if Hardware::CPU.arm?
    sha256 "6fbd8c0cc677eebbfd1a1d133ca347e7f03b9e9cd014b0aa3e922b6e823a682c"
  else
    sha256 "c2e9f6fab6a29dda049c822fc1fa0945a0783c7cc49046e0cebe1605edc2a63f"
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
