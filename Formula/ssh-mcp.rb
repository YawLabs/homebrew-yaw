class SshMcp < Formula
  desc "MCP server for SSH operations with built-in diagnostics"
  homepage "https://github.com/YawLabs/ssh-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/ssh-mcp/releases/download/v0.11.7/ssh-mcp-linux-x64", using: :nounzip
  version "0.11.7"
  sha256 "21060ba4b854858f2fe993a18393060afcf428e0c71077a47848c3f968bbf8ac"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/ssh-mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/ssh-mcp/releases/download/v0.11.7/ssh-mcp-darwin-arm64", using: :nounzip
      sha256 "594f37d8babc966ca1130b2682dd87c077d3210f0fc754636b2bd70722e66c63"
    end
    on_intel do
      url "https://github.com/YawLabs/ssh-mcp/releases/download/v0.11.7/ssh-mcp-darwin-x64", using: :nounzip
      sha256 "a6aed91a0ec0a04a0dd7422069f7439fe61dd4d0fc99cd1451769a093ed9e8eb"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "ssh-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ssh-mcp --version")
  end
end
