cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.19"

  if Hardware::CPU.arm?
    sha256 "2614b466bf6e1471d148741a2a717ada7486f7cf29392e0ffe7193c5a73b3e8a"
  else
    sha256 "98d85591acf82332d98eae6e31482d1d343a5d963328bef825a60143490a5fa1"
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
