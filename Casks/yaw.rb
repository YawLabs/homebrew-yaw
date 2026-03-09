cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.84"

  if Hardware::CPU.arm?
    sha256 "6eef3de9100ceb240be4201a8c2b102c84219c6835c60764df042704b928d564"
  else
    sha256 "02088ddf5751fb8e9cf03e2d4bf269329a05815dc74fcdbea80ba9706be18465"
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
