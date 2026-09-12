class Oam < Formula
  desc "JavaScript/TypeScript runtime on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  version "0.15.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.1/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "969136e4d738d2f89e825535815a96b893094e368ed2554b1cf5dbc7db3603d5"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.1/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "1e78d660ebb8f8e1b6cdfc55362d43aff7ea982dde79fda64bb4e51e0f105fa9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.15.1/oam-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "189f35d8f940f4c0da78ea7a03f8f85be3b7cae127deec56377cf4eaf21c8aaf"
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
