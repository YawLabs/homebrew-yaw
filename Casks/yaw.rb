cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.121"

  if Hardware::CPU.arm?
    sha256 "633fe657d16006b1f85f4ebfa344fd90465a4a7f5665c92370593143ed7aca42"
  else
    sha256 "aa2122b842d9b0d24dfef9c272a22198f799c203c707054545cbd296056f02a3"
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
