cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.15"

  if Hardware::CPU.arm?
    sha256 "02bf73275e6ea2575a03e9781131599610943a495df4e2853475450ce3ca76ac"
  else
    sha256 "b505706a1507935ed31dab896cf195dc47b2068d6b2fbd53923d13641875af15"
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
