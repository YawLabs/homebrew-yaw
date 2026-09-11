class ElectronMcp < Formula
  desc "Electron.js MCP server — IPC scaffolding, security auditing, build tooling, and development intelligence for AI assistants"
  homepage "https://github.com/YawLabs/electron-mcp#readme"
  version "1.2.15"
  license "MIT"

  # Retired from this tap on 2026-09-11. Upstream releases stopped publishing
  # the per-arch binaries this formula downloads, so it can only ever install a
  # build frozen months behind npm -- and some of those assets now 404. npm is
  # the supported channel; the formula stays here, disabled, so brew can tell
  # anyone with an old keg where to go instead of silently going stale.
  disable! date: "2026-09-11", because: "is now distributed via npm: run `npx -y @yawlabs/electron-mcp` instead"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/electron-mcp/releases/download/v1.2.15/electron-mcp-darwin-arm64", using: :nounzip
      sha256 "badb50b38ffaaebe969f3032471ee5f761c32b95f4e27fabd91581804a228fb3"
    end
    on_intel do
      url "https://github.com/YawLabs/electron-mcp/releases/download/v1.2.15/electron-mcp-darwin-x64", using: :nounzip
      sha256 "f3452f43db12aef9a0581b1043ce4f1d1ea795043385caff9e33b013472ba624"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/electron-mcp/releases/download/v1.2.15/electron-mcp-linux-x64", using: :nounzip
      sha256 "5801bd514108bca92214b6fef62746be2bf0795a841348b9712d6f6e106ce39e"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "electron-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/electron-mcp --version")
  end
end
