cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.81"

  if Hardware::CPU.arm?
    sha256 "8e09c11da37f9c484eaa0bd9e6087a084b55f26a7da962bc2f661ba073b6a93c"
  else
    sha256 "202654ebbd0b2e376b6995e2b40e8be3eaa65767901fb519d4fadfbb87c5ce36"
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
