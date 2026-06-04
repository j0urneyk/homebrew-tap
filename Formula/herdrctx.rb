class Herdrctx < Formula
  desc "Terminal UI for managing local Herdr sessions"
  homepage "https://github.com/j0urneyk/herdrctx"
  url "https://github.com/j0urneyk/herdrctx/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "e6a630ba79e17581a93cc09ddfbd8245b57eab005f71c624f15de34e51a56c00"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrctx --version")
  end
end
