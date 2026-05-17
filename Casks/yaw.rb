cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.10"

  if Hardware::CPU.arm?
    sha256 "01e900f15800fd45785375dbc9f6036fa3c700724868f3b05d9ebb889eaede73"
  else
    sha256 "96a20882bfc87b1e9f314634beb2b414f6eebaed0f203f19db47351aadc4271a"
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
