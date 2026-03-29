cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.125"

  if Hardware::CPU.arm?
    sha256 "ba8a85d4f4e2b22d262595015949b9ba01e8c0cfdf4914add780b8c7dece8a29"
  else
    sha256 "f5dbd501c328371feb8dfb11bf51da4fadea4b524bf33138fe9cb71b781b107c"
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
