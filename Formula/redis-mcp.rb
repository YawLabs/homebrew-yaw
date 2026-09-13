class RedisMcp < Formula
  desc "Redis MCP server - SCAN-based key exploration, TTL/memory/keyspace introspection, slowlog + INFO health, and a DBA advisor for AI assistants"
  homepage "https://github.com/YawLabs/redis-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/redis-mcp/releases/download/v0.1.3/redis-mcp-linux-x64", using: :nounzip
  version "0.1.3"
  sha256 "42891cdca9e65836328b64e7e3dc45e6b17cdaa4584eeef6bea4042288f13ea6"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/redis-mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/redis-mcp/releases/download/v0.1.3/redis-mcp-darwin-arm64", using: :nounzip
      sha256 "7edfa3e01bcdc3d5ec79796a4afc24b00307f08430837c780fe7f4ce68a04352"
    end
    on_intel do
      url "https://github.com/YawLabs/redis-mcp/releases/download/v0.1.3/redis-mcp-darwin-x64", using: :nounzip
      sha256 "1b70b00f78e2c239245ece1a0d2dd72f797ade43f3d285e11b3850c8276b9bf8"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "redis-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/redis-mcp --version")
  end
end
