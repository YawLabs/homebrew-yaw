class NpmjsMcp < Formula
  desc "npm registry MCP server — package intelligence, security audits, and dependency analysis for AI assistants"
  homepage "https://github.com/YawLabs/npmjs-mcp"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/npmjs-mcp/releases/download/v0.12.2/npmjs-mcp-darwin-arm64", using: :nounzip
      sha256 "0522f33a21a8ce0293976eb8d9912044a28f18706185d7dcf9c1b74d9e9a307a"
    end
    on_intel do
      url "https://github.com/YawLabs/npmjs-mcp/releases/download/v0.12.2/npmjs-mcp-darwin-x64", using: :nounzip
      sha256 "13d1ad5444e63f8260c31a92569bb3dadb909004a09b5f1d438e1301d9b23eb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/npmjs-mcp/releases/download/v0.12.2/npmjs-mcp-linux-x64", using: :nounzip
      sha256 "bf4334d7034e31e81cba44143f758b54166606d475801c0040cb4f6da19a7827"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "npmjs-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/npmjs-mcp --version")
  end
end
