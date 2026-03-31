cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.126"

  if Hardware::CPU.arm?
    sha256 "fbf76bbd3696b93d6848cb775a5129569587dad1be4fd2f059e7c73b1ecfbab1"
  else
    sha256 "c9d5990c2e3f49415aad2489f180381e4d1f4f64b03b4db84e63c7824cc3361c"
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
