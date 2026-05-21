cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.20"

  if Hardware::CPU.arm?
    sha256 "fb84b6c6b4ea3eaa529bc0df1fe8fb0b8ac2edc5e3cad3ff6a03459e3d74efe7"
  else
    sha256 "2020abb9e056e093cce2c0e09466dc7ebbefbd26446c6065955dc98722787d6f"
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
