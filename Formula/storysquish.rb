class Storysquish < Formula
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"
  url "https://github.com/story-squish/storysquish/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "228a56b7f9e61d95e8352ace63a395e1580ca49b68c8b5ad490b7f9d02a78817"
  license "MIT"

  bottle do
    root_url "https://github.com/meslab/homebrew-tap/releases/download/storysquish-0.3.0"
    sha256 cellar: :any, x86_64_linux: "9d2d3ecfc356c78881b1145b44eea626d317655da1892d29d02b872e63a8ae29"
  end

  depends_on "rust" => :build
  depends_on :linux

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    ENV.delete "DISPLAY"
    ENV.delete "WAYLAND_DISPLAY"
    assert_match "DISPLAY", shell_output("#{bin}/storysquish 2>&1", 1)
  end
end
