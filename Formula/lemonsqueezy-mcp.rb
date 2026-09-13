class LemonsqueezyMcp < Formula
  desc "LemonSqueezy MCP server for managing your store from AI assistants"
  homepage "https://github.com/YawLabs/lemonsqueezy-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/lemonsqueezy-mcp/releases/download/v0.10.13/lemonsqueezy-mcp-linux-x64", using: :nounzip
  version "0.10.13"
  sha256 "f27c084df5f1a0630c5d4ae5b0395776144b39e83c30a9a9037fa86d1c0f1797"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/lemonsqueezy-mcp` instead"

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
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "lemonsqueezy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lemonsqueezy-mcp --version")
  end
end
