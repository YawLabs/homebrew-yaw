class Oam < Formula
  desc "JavaScript/TypeScript runtime on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  version "0.15.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.2/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "4d9ec1528d30ed24f0c84544122aba7e6cae34a33fc7b294986f8aff5ea62c69"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.2/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "d0b4f94366d9ef60fef44be38ff14191e03bfbc268887e69efb1630b65db1da7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.2/oam-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "017f36b130e7af54330e23737a9b75fe53c4d489d357431afe68feaf7aae550d"
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
