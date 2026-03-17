cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.103"

  if Hardware::CPU.arm?
    sha256 "f562678e9a065d51b2fb9c356c24e8e1cd863902c2df44d78538bcb01521c3a7"
  else
    sha256 "482f3a214021285496d8b08dd7903b3e1d423b8aaca5fbd228fce38dbc7e1859"
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
