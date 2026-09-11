class Oam < Formula
  desc "JavaScript/TypeScript runtime on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.0/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "05644475fa68eeb4a9cb26df84f0fdc22adda6ad53b7bb15d13de5061ab8a83b"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.0/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "574929b80301d01f0f64beea85dbd7b8871faf5723c5f2345cda221bcbdd8a19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.0/oam-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "29ecbfb62249c7d47ebcd0aa7dd5772f85d4fd7798ef79e80fa67f27b0fc5d3a"
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
