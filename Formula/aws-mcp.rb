class AwsMcp < Formula
  desc "AWS MCP server — call any AWS API from AI assistants, with first-class SSO re-login (no more 'browser won't open' dead ends)"
  homepage "https://github.com/YawLabs/aws-mcp"
  # Top-level url is the Linux x86_64 build; on_macos overrides it per arch.
  # Every OS/arch that `brew tap` validates, arm64_linux included, must resolve
  # to a url or the whole tap is refused. See Formula/oam.rb.
  url "https://github.com/YawLabs/aws-mcp/releases/download/v1.5.2/aws-mcp-linux-x64", using: :nounzip
  version "1.5.2"
  sha256 "5ca7fd222d60970fda0dd0e4760b9441904a0384545e8ae354aeddd6884e2bdd"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/aws-mcp` instead"

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
    depends_on arch: :x86_64
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "aws-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aws-mcp --version")
  end
end
