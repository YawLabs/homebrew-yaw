cask "yaw" do
  arch arm: "arm64", intel: "x64"
  version "1.9.41"

  if Hardware::CPU.arm?
    sha256 "370583f041c9bfbd04a2376301d81f5c1fe2abb0f070ba6ec4945f654b02f2cc"
  else
    sha256 "2ce8e85cbdaf2f502228244970b5b1e70306a2e395bb1dbd166813bc873fc149"
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
