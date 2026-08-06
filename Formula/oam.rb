class Oam < Formula
  desc "JavaScript and TypeScript runtime built on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.1/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "701494bc0cc883c3737cc5a035ab61e772ab0bf573ee9b3d1c08fcd49bde93b0"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.1/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "2f6fa5b91029839d4e807ee236275947df1effb40cf14bd7919ff9740c775d3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.1/oam-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "cdf9dcff51f23e2af4783ab99a0694c421e88505879f3a956d65a6ecd23c4529"
    end
    # No linux-arm64 block: that asset has never been released. The V8 startup
    # snapshot forbids cross-compiling, so it needs a native ARM builder.
    # Omitting it fails with "not available for this architecture" rather than
    # 404-ing on a URL that was never published.
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "oam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oam --version")
    # Proves it actually executes, not just that a file landed in bin.
    assert_equal "4", shell_output("#{bin}/oam -pe '2+2'").strip
  end
end
