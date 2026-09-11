class McpCompliance < Formula
  desc "CLI tool and MCP server that tests MCP servers for spec compliance"
  homepage "https://github.com/YawLabs/mcp-compliance"
  version "0.16.2"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/mcp-compliance` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/mcp-compliance/releases/download/v0.16.2/mcp-compliance-darwin-arm64", using: :nounzip
      sha256 "1ef4cc8d7d2a5437f1dbe9c1be8f6a0c78d421ae11322bff15ce3b16cfd359a4"
    end
    on_intel do
      url "https://github.com/YawLabs/mcp-compliance/releases/download/v0.16.2/mcp-compliance-darwin-x64", using: :nounzip
      sha256 "4b5f7eb2c34087e71f8632d2ee19eb0167781e2d03b0f3a2bf36f560b4ff1108"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/mcp-compliance/releases/download/v0.16.2/mcp-compliance-linux-x64", using: :nounzip
      sha256 "4fbbf29f466893d53bd46f45fefb0a63016681154d960efdfdde113816c74097"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "mcp-compliance"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-compliance --version")
  end
end
