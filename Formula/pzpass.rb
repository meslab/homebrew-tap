class Pzpass < Formula
  desc "Password generator and encrypted password vault"
  homepage "https://github.com/pzpass/pzpass"
  url "https://github.com/pzpass/pzpass/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d94dfaf6b34722498d3135759bbc98dd5c01243a602ac12f8ff8a3ada67ca6b7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "zig" => :build

  def install
    system "zig", "build", *std_zig_args(release_mode: :small)
  end

  test do
    assert_equal 24, shell_output("#{bin}/pzp pass 24").chomp.length
  end
end
