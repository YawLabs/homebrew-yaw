cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.120"

  if Hardware::CPU.arm?
    sha256 "57a02729f3854f46d4d1e052f4ea524902290e3e2373b6987ffb8e08977bb61f"
  else
    sha256 "02e3f25b62026aa7c3fc89970faccc853b62ece40f473c19628d15b830e64be1"
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
