class YawMcp < Formula
  desc "Yaw MCP -- MCP servers, managed. Free to run locally; Yaw Team adds cross-machine sync."
  homepage "https://yaw.sh/mcp"
  version "0.60.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-darwin-arm64", using: :nounzip
      sha256 "ee1c6bd9c7036eaeadf012b7c0e1576114bc49492d8a2f33bb1b9e3da65e2428"
    end
    on_intel do
      url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-darwin-x64", using: :nounzip
      sha256 "ac051e789600443f2ba913105b1b7cd6d8c887cd0b338bc990fed5201d57c7f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/YawLabs/mcp/releases/download/v0.60.6/yaw-mcp-linux-x64", using: :nounzip
      sha256 "403084d23c14b97475ca7ed897a09759bc0ae2453e6aa15aecb251e3b40e741d"
    end
  end

  def install
    # Each per-arch release asset is a single bare binary; rename to the command.
    bin.install Dir["*"].first => "yaw-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yaw-mcp --version")
  end
end
