class PostgresMcp < Formula
  desc "PostgreSQL MCP server - query, schema introspection, explain, and health checks for AI assistants"
  homepage "https://github.com/YawLabs/postgres-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/postgres-mcp/releases/download/v0.6.21/postgres-mcp-linux-x64", using: :nounzip
  version "0.6.21"
  sha256 "ac0b5ba686d5c3626eca5b73f69482287ff37f553519167aadd0c20db5210824"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/postgres-mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/postgres-mcp/releases/download/v0.6.21/postgres-mcp-darwin-arm64", using: :nounzip
      sha256 "b49338fb72b5820d91d46f4ad8faa0b465e55e5a4349bef7af4cd9e4d8c196d7"
    end
    on_intel do
      url "https://github.com/YawLabs/postgres-mcp/releases/download/v0.6.21/postgres-mcp-darwin-x64", using: :nounzip
      sha256 "621aa81a72c922a6ea47194312c69ce8f79d605e35cd5cbd4985b4dd91781b19"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "postgres-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postgres-mcp --version")
  end
end
