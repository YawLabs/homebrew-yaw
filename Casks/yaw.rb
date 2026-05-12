cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.6.32"

  if Hardware::CPU.arm?
    sha256 "4ab7595446c6a9c1338307e6a695be1d9bbc493465a24731ce71417c55ac7648"
  else
    sha256 "65db58dbd221cc5c0c610ac567964ad626b8561e4622b48c6edc7b9d68fe5abc"
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
