class Herdrctx < Formula
  desc "Terminal UI for managing local Herdr sessions"
  homepage "https://github.com/j0urneyk/herdrctx"
  url "https://github.com/j0urneyk/herdrctx/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "4f0cfd9f2d636da4b5f3f74efecaf57e5dfeb493ef63ff9ef865c61d5d591f23"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrctx --version")
  end
end
