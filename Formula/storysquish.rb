class Storysquish < Formula
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"
  url "https://github.com/story-squish/storysquish/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "f83b01e26c41dacef2a685b1b796e5ac97d4ac8215c8ac9e288bcdc068f58353"
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
