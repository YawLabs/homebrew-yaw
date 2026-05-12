cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.19"

  if Hardware::CPU.arm?
    sha256 "96a4839992a00231532c2e95b6092328590ae7617db5aba99c203b1b45e94c80"
  else
    sha256 "ad8eb281e64408d005645966ef33038a0f7a499920ea7a89a184f34e5aadaeb8"
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
