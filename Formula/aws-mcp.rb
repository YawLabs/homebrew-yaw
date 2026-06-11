class AwsMcp < Formula
  desc "AWS MCP server — call any AWS API from AI assistants, with first-class SSO re-login (no more 'browser won't open' dead ends)"
  homepage "https://github.com/YawLabs/aws-mcp"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.1/aws-mcp-darwin-arm64", using: :nounzip
      sha256 "c179896fbeb553efa01040af912280268f4c2abee2a224940453d398caf6291b"
    end
    on_intel do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.1/aws-mcp-darwin-x64", using: :nounzip
      sha256 "dcb009c19135de1c2db4bada07f60dae7b25ab543da510e8b6c139dec5237b2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.1/aws-mcp-linux-x64", using: :nounzip
      sha256 "100fa97b6b86ea8434ed54a89f697a46634b51f784d8f79070bf6dff133785a5"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "aws-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aws-mcp --version")
  end
end
