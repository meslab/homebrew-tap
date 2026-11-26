class Storysquish < Formula
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"
  url "https://github.com/story-squish/storysquish/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "228a56b7f9e61d95e8352ace63a395e1580ca49b68c8b5ad490b7f9d02a78817"
  license "MIT"

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
