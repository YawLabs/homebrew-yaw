cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.42"

  if Hardware::CPU.arm?
    sha256 "ed48ac922ea0a1b99a2ee8d5f8f2923437b79811c4e3de00fd1d00a0082f3e93"
  else
    sha256 "257f62d66e4095f6cf126a8005b468a9dc2886bad60c15534421c1fe8aaf8293"
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
