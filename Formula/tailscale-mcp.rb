class TailscaleMcp < Formula
  desc "Tailscale MCP server for managing your tailnet from AI assistants"
  homepage "https://github.com/YawLabs/tailscale-mcp"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/tailscale-mcp/releases/download/v0.13.1/tailscale-mcp-darwin-arm64", using: :nounzip
      sha256 "1447b2c7c3756b2823601e6125c3e74c641b94f8e4e06e5d2ee2863c67c8bf16"
    end
    on_intel do
      url "https://github.com/YawLabs/tailscale-mcp/releases/download/v0.13.1/tailscale-mcp-darwin-x64", using: :nounzip
      sha256 "bcbfb9a7a48e3888eb1edcc71c91736dababba0822db0a53272607962c442880"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/tailscale-mcp/releases/download/v0.13.1/tailscale-mcp-linux-x64", using: :nounzip
      sha256 "e545ebd615c8e0a4f56a4d320f14b453e3911706fdbe9ce00f13347aff473cd9"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "tailscale-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tailscale-mcp --version")
  end
end
