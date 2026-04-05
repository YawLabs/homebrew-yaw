cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.145"

  if Hardware::CPU.arm?
    sha256 "278d96180c0bb5deda2f2ad60bf59d363184bdffa1fc9cabcf5e9fde5eb3ed3b"
  else
    sha256 "53ad1919c394c8e3d1ac6c7f262c86a5a125df2d85a5aaa07d925a66156b4fce"
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
