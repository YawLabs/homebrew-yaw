cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.4"

  if Hardware::CPU.arm?
    sha256 "31d364c92dc487c3dd0da48a5c550b0eab4faa1ab828ec51778fdc1e0035e5fc"
  else
    sha256 "c7de652404019a4d135c0fdadac7f3c30aab0e06102ccb55e367659cbf27a6f1"
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
