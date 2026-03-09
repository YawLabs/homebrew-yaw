cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.85"

  if Hardware::CPU.arm?
    sha256 "5aec627de5f7c3b7cbee3414cb7de25928c29014ae99e41ef3417e6cd11283ec"
  else
    sha256 "7de537109560be61ada1331fd099ea00d1e8ec9c95b2c0db0c7eac66f1c18afc"
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
