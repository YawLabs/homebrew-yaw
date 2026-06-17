class AwsMcp < Formula
  desc "AWS MCP server — call any AWS API from AI assistants, with first-class SSO re-login (no more 'browser won't open' dead ends)"
  homepage "https://github.com/YawLabs/aws-mcp"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.2/aws-mcp-darwin-arm64", using: :nounzip
      sha256 "41ca7de09ddcdacb7d206bbe6b768c70869ae9ae8b70cd1320da73b8a4ef0b83"
    end
    on_intel do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.2/aws-mcp-darwin-x64", using: :nounzip
      sha256 "58eb0fc0b69ed1349f3aa65af4b5be3906e7178e5e110874daaaa26573cf6678"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.2/aws-mcp-linux-x64", using: :nounzip
      sha256 "5ca7fd222d60970fda0dd0e4760b9441904a0384545e8ae354aeddd6884e2bdd"
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
