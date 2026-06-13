cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.50"

  if Hardware::CPU.arm?
    sha256 "27fac167164d57844f6084b21d04c071aabbc3150c60bc62a5b1458c722b1887"
  else
    sha256 "e368c20a2046dce994381b79808aac9a775f0cb4e0047f2479cb027947d12a16"
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
