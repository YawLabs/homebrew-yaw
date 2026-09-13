class YawMcp < Formula
  desc "Yaw MCP -- MCP servers, managed. Free to run locally; Yaw Team adds cross-machine sync."
  homepage "https://yaw.sh/mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-linux-x64", using: :nounzip
  version "0.60.6"
  sha256 "403084d23c14b97475ca7ed897a09759bc0ae2453e6aa15aecb251e3b40e741d"
  license :cannot_represent

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-darwin-arm64", using: :nounzip
      sha256 "ee1c6bd9c7036eaeadf012b7c0e1576114bc49492d8a2f33bb1b9e3da65e2428"
    end
    on_intel do
      url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-darwin-x64", using: :nounzip
      sha256 "ac051e789600443f2ba913105b1b7cd6d8c887cd0b338bc990fed5201d57c7f6"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "yaw-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yaw-mcp --version")
  end
end
