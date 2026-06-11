class LemonsqueezyMcp < Formula
  desc "LemonSqueezy MCP server for managing your store from AI assistants"
  homepage "https://github.com/YawLabs/lemonsqueezy-mcp"
  version "0.10.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/lemonsqueezy-mcp/releases/download/v0.10.13/lemonsqueezy-mcp-darwin-arm64", using: :nounzip
      sha256 "687e4bddf23598e1504962aec1a71dcc40eb0f3fe6f37a155d2651dbe37fbfbe"
    end
    on_intel do
      url "https://github.com/YawLabs/lemonsqueezy-mcp/releases/download/v0.10.13/lemonsqueezy-mcp-darwin-x64", using: :nounzip
      sha256 "0423f11b338de468c4882bcda02b5dc42b9e7526102bf0276d0c1e1b1b95609c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/lemonsqueezy-mcp/releases/download/v0.10.13/lemonsqueezy-mcp-linux-x64", using: :nounzip
      sha256 "f27c084df5f1a0630c5d4ae5b0395776144b39e83c30a9a9037fa86d1c0f1797"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "lemonsqueezy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lemonsqueezy-mcp --version")
  end
end
