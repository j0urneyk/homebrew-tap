class Herdrctx < Formula
  desc "Terminal UI for managing local Herdr sessions"
  homepage "https://github.com/j0urneyk/herdrctx"
  url "https://github.com/j0urneyk/herdrctx/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "4bd2b9558261a5212cb376d45345a706facfca67cf9f097c3c77dedad610de6b"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrctx --version")
  end
end
