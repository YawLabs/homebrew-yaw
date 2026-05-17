cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.8"

  if Hardware::CPU.arm?
    sha256 "cffa300422291fb4aa1e8a30cb463c2e914b9a7656cb1557de850c7220c0d415"
  else
    sha256 "2e51b6a8ec0054c1c08506959ae228e95622aec9affaae7173ee787aacfcace1"
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
