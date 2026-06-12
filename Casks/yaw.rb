cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.48"

  if Hardware::CPU.arm?
    sha256 "c31a1b7e301e8da04559802fee1b9fd6ac5524665bdce2239060727472aa79e1"
  else
    sha256 "0d0cc973984d4fb1bf90974dbb8be3492440fe2defd2fd931964942b19bc992e"
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
