class Oam < Formula
  desc "JavaScript/TypeScript runtime on Rust and V8, for TypeScript and MCP servers"
  homepage "https://oamjs.org"
  url "https://github.com/YawLabs/oam/releases/download/v0.17.0/oam-x86_64-unknown-linux-gnu", using: :nounzip
  version "0.17.0"
  sha256 "c697cf6553f6b42274933d6cfe74f7ccf319f4bc53fbe864e585eed92783078c"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/oam/releases/download/v0.17.0/oam-aarch64-apple-darwin", using: :nounzip
      sha256 "bc313ff7578ac662a7ac9f9686e9cb9c88c18062a0f18a3aa3ee11b62e840639"
    end
    on_intel do
      url "https://github.com/YawLabs/oam/releases/download/v0.17.0/oam-x86_64-apple-darwin", using: :nounzip
      sha256 "081be2859535bce63809c3e353eb040ecf86a53ac0ef638f53c14c05bdd2474f"
    end
  end

  # Linux is x86_64 only: no linux-arm64 asset has ever been released. The V8
  # startup snapshot forbids cross-compiling, so it needs a native ARM builder.
  #
  # That is why the top-level url is the Linux x86_64 build and on_macos
  # overrides it per arch, rather than nesting the Linux url in on_linux/on_intel.
  # `brew tap` validates the tap by loading every formula as every OS/arch pair,
  # arm64_linux included; a formula with no url for one of them fails with
  # "formula requires at least a URL" and the whole tap is refused, for macOS
  # users too (homebrew-yaw#2). depends_on arch then refuses a real ARM Linux
  # install up front: "The x86_64 architecture is required for this software."
  # (A url placed directly inside on_linux also loads, but `brew style` rejects
  # it: "on_linux cannot include url".)
  #
  # oam's scripts/bump-taps.sh pairs each url with the sha256 that follows it
  # and expects exactly three pairs, so keep one url per platform.
  on_linux do
    depends_on arch: :x86_64
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
