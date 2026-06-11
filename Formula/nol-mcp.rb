class NolMcp < Formula
  desc "nol MCP server — query your team's knowledge base (search, cited Q&A, spaces, pages) from AI assistants"
  homepage "https://github.com/YawLabs/nol-mcp"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/nol-mcp/releases/download/v0.1.2/nol-mcp-darwin-arm64", using: :nounzip
      sha256 "1362509ecfab5f9b7217c754fc3f0f2328cf2a78c5c5edc329a33a93c12f0b2f"
    end
    on_intel do
      url "https://github.com/YawLabs/nol-mcp/releases/download/v0.1.2/nol-mcp-darwin-x64", using: :nounzip
      sha256 "6669a30e430527935c0fc3181481cb51fce4b004b84acae7ba5d8bbd0781a796"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/nol-mcp/releases/download/v0.1.2/nol-mcp-linux-x64", using: :nounzip
      sha256 "14929cea3d56efc97745bc29fb5bcca5db9a633ed9ae56d0b07f1fd8221c23c2"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "nol-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nol-mcp --version")
  end
end
