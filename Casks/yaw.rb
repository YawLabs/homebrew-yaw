cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.36"

  if Hardware::CPU.arm?
    sha256 "10ea12c9f5f421d1d939f085fea7754ea06dfc16a66670b0ae60473001c8ec75"
  else
    sha256 "f2f96a1546a817de840c772808ade3e305d79c8e59772ae7dda0fbe75590c4f9"
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
