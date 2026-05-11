cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.18"

  if Hardware::CPU.arm?
    sha256 "b7e5eb544258589fff41815f4cd576219549916c141dcb14d403e8bdf2ab1092"
  else
    sha256 "4e22d426fd22b9d5717ea22ff05ecb458a3f4cecb306f21f4c03b13d8a244297"
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
