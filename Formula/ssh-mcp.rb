class SshMcp < Formula
  desc "MCP server for SSH operations with built-in diagnostics"
  homepage "https://github.com/YawLabs/ssh-mcp"
  version "0.11.7"
  license "MIT"

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
    on_intel do
      url "https://github.com/YawLabs/ssh-mcp/releases/download/v0.11.7/ssh-mcp-linux-x64", using: :nounzip
      sha256 "21060ba4b854858f2fe993a18393060afcf428e0c71077a47848c3f968bbf8ac"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "ssh-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ssh-mcp --version")
  end
end
