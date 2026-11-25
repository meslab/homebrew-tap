class Pzpass < Formula
  desc "Password generator and encrypted password vault"
  homepage "https://github.com/pzpass/pzpass"
  url "https://github.com/pzpass/pzpass/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d94dfaf6b34722498d3135759bbc98dd5c01243a602ac12f8ff8a3ada67ca6b7"
  license "MIT"

  bottle do
    root_url "https://github.com/meslab/homebrew-tap/releases/download/pzpass-1.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2ceb128baf0b41d00f917ac034950244b3ed7da32066d1b1d4bf7d19a0d029a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e1beb7e8ed91ce88b1cb2eb4828a289b389ca54a39aa9a40f0bb569313a9391f"
  end

  depends_on "zig" => :build

  conflicts_with "pzpass-bin", because: "both install `pzp`"

  def install
    system "zig", "build", *std_zig_args
  end

  test do
    assert_equal 24, shell_output("#{bin}/pzp pass 24").chomp.length
    assert_match "Generate a secure password", shell_output("#{bin}/pzp bogus 2>&1", 2)
  end
end
