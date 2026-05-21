cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.7.21"

  if Hardware::CPU.arm?
    sha256 "cb600396e8ef44dfd94fc9dad3a51eff5165186aa2dbbb01c67ab3c38d702d28"
  else
    sha256 "71c686919ec8eb096b188a85fe8c9a623f380272fc153ed1d86cecad4ffbc154"
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
