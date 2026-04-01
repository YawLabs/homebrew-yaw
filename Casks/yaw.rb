cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.129"

  if Hardware::CPU.arm?
    sha256 "d3b99132ac7a78b59ce5f5835cc8aaaad5fc20d629e96706ed3e93dfd70e1d58"
  else
    sha256 "8073497070d166fec9badcb3bbd059e7fccd3f0284ab9b6dcba33dbe33a5e749"
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
