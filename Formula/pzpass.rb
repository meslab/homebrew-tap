class Pzpass < Formula
  desc "Password generator and encrypted password vault"
  homepage "https://github.com/pzpass/pzpass"
  url "https://github.com/pzpass/pzpass/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d94dfaf6b34722498d3135759bbc98dd5c01243a602ac12f8ff8a3ada67ca6b7"
  license "MIT"

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
