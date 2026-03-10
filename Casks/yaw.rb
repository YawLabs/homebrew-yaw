cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.93"

  if Hardware::CPU.arm?
    sha256 "80f2b284d3941ef8a7726a788e9ccceaa3c5bfac7e9d1c3cea706aeaca8de84c"
  else
    sha256 "f904194357c3f8f4166d56643e543f9909012a6647abf3876149ac76979fe509"
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
