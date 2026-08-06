class Oam < Formula
  desc "JavaScript and TypeScript runtime built on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.0/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "8ee20597c9cd1d091d4a744e8a5c9c9aec0295a9b157966e69fa204cb10dbbf8"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.0/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "bdba3f864a02284f9741a19e6a7ac930b8589b24a8f3eceebf1c7950bd0736de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.8.0/oam-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "4bc940fe226538ba305ebf49f16823feac41f90d6ab716c00ff59f2474d02558"
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
