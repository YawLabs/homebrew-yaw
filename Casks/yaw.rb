cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "0.9.91"

  if Hardware::CPU.arm?
    sha256 "861a8a6535ff33114ffd99eec463c5bd9fa33a602bef5b7087fbf0385c862023"
  else
    sha256 "d5df9e3a2cbfccf88dfddd0ea3491f0820782f6ace01805ccb463f8f58412c5e"
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
