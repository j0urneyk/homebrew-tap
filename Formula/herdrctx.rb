class Herdrctx < Formula
  desc "Terminal UI for managing local Herdr sessions"
  homepage "https://github.com/j0urneyk/herdrctx"
  url "https://github.com/j0urneyk/herdrctx/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "c4b459d574f8f774dd4235e4f15ba50ce427889ab76d5b18e1702cda143a9e33"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrctx --version")
  end
end
