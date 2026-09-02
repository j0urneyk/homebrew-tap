class Herdrctx < Formula
  desc "Terminal UI for managing local Herdr sessions"
  homepage "https://github.com/j0urneyk/herdrctx"
  url "https://github.com/j0urneyk/herdrctx/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "9ee198bbbff52250791b2d922ae31d57e8c82a8aab6e1cb66620caaa3e609d14"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrctx --version")
  end
end
