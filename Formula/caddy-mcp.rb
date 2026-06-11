class CaddyMcp < Formula
  desc "MCP server for managing Caddy web servers via the admin API"
  homepage "https://github.com/YawLabs/caddy-mcp"
  version "1.3.1"
  license "MIT"

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
    on_intel do
      url "https://github.com/YawLabs/caddy-mcp/releases/download/v1.3.1/caddy-mcp-linux-x64", using: :nounzip
      sha256 "6ae98347eefeadfd5a71fa46b219bfd5550161a452d960b46e7f962c4d19996e"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "caddy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/caddy-mcp --version")
  end
end
