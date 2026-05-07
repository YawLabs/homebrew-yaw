cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.2"

  if Hardware::CPU.arm?
    sha256 "ff2326742c7fb1c44181216452078ac9a03769281235b053818a4e02e7cbcf95"
  else
    sha256 "2409c02b9931a93647f5df12681f27ee7b63673ad2c401c05a12594caf26d743"
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
