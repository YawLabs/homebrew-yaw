class PostgresMcp < Formula
  desc "PostgreSQL MCP server - query, schema introspection, explain, and health checks for AI assistants"
  homepage "https://github.com/YawLabs/postgres-mcp"
  version "0.6.21"
  license "MIT"

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
    on_intel do
      url "https://github.com/YawLabs/postgres-mcp/releases/download/v0.6.21/postgres-mcp-linux-x64", using: :nounzip
      sha256 "ac0b5ba686d5c3626eca5b73f69482287ff37f553519167aadd0c20db5210824"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "postgres-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postgres-mcp --version")
  end
end
