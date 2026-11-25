class Storysquish < Formula
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"
  url "https://github.com/story-squish/storysquish/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f71296b35894e3e5a68fbaa43ba5a5193b52a8651b8590c4c6208bc454740147"
  license "MIT"

  bottle do
    root_url "https://github.com/meslab/homebrew-tap/releases/download/storysquish-0.2.2"
    sha256 cellar: :any, x86_64_linux: "683faff184c4e33289807b133308a2a27cfdd0ef9b9491555fd182921a6731e1"
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
