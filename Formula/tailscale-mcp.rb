class TailscaleMcp < Formula
  desc "Tailscale MCP server for managing your tailnet from AI assistants"
  homepage "https://github.com/YawLabs/tailscale-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/tailscale-mcp/releases/download/v0.13.1/tailscale-mcp-linux-x64", using: :nounzip
  version "0.13.1"
  sha256 "e545ebd615c8e0a4f56a4d320f14b453e3911706fdbe9ce00f13347aff473cd9"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/tailscale-mcp` instead"

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
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "tailscale-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tailscale-mcp --version")
  end
end
