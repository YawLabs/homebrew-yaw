class CaddyMcp < Formula
  desc "MCP server for managing Caddy web servers via the admin API"
  homepage "https://github.com/YawLabs/caddy-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/caddy-mcp/releases/download/v1.3.1/caddy-mcp-linux-x64", using: :nounzip
  version "1.3.1"
  sha256 "6ae98347eefeadfd5a71fa46b219bfd5550161a452d960b46e7f962c4d19996e"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/caddy-mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/caddy-mcp/releases/download/v1.3.1/caddy-mcp-darwin-arm64", using: :nounzip
      sha256 "3c86ae8963200fa3ca361b9b0be38213605a3d78dabbfedea7c7a5268a6f0422"
    end
    on_intel do
      url "https://github.com/YawLabs/caddy-mcp/releases/download/v1.3.1/caddy-mcp-darwin-x64", using: :nounzip
      sha256 "9a9696679bfceb60604f69e8d371ff900b025c02856a98a79eb4dace4b9fa53d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "caddy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/caddy-mcp --version")
  end
end
