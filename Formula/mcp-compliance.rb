class McpCompliance < Formula
  desc "CLI tool and MCP server that tests MCP servers for spec compliance"
  homepage "https://github.com/YawLabs/mcp-compliance"
  version "0.16.2"
  license "MIT"

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
