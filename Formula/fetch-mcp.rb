class FetchMcp < Formula
  desc "Comprehensive HTTP fetch MCP server: SSRF protection, HTML-to-markdown, reader-mode, metadata / link / sitemap / RSS-Atom extraction, robots.txt verdicts"
  homepage "https://github.com/YawLabs/fetch-mcp"
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/fetch-mcp/releases/download/v0.3.6/fetch-mcp-darwin-arm64", using: :nounzip
      sha256 "2b83934107daf258153c39992fd01c6a52319dbae419bc4f8655c146d58c7b42"
    end
    on_intel do
      url "https://github.com/YawLabs/fetch-mcp/releases/download/v0.3.6/fetch-mcp-darwin-x64", using: :nounzip
      sha256 "2da68939755eef8542fb489f0f62a204769ec03167fb6d151dca02cc16feaf69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/fetch-mcp/releases/download/v0.3.6/fetch-mcp-linux-x64", using: :nounzip
      sha256 "6a8b0bf50f7ce97bd5500000722f36132fc44d50981184326de37212f3a690ec"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "fetch-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fetch-mcp --version")
  end
end
