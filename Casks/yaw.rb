cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.8"

  if Hardware::CPU.arm?
    sha256 "b8f3f3e021f32506a8d806e19f045adf5337c6d9e5afdadbe5587d2b3b278530"
  else
    sha256 "69e06f0a3f1cdfc086881c720af3575373e9cd52157ea69ddfff3a2599891d90"
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
