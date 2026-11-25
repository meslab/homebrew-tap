class Pzpass < Formula
  desc "Password generator and encrypted password vault"
  homepage "https://github.com/pzpass/pzpass"
  url "https://github.com/pzpass/pzpass/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "254ad122fddf813bf0dc7433638172521299e95018596b7f6c8354b7279cadf5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "zig" => :build

  def install
    system "zig", "build", *std_zig_args
  end

  test do
    assert_equal 24, shell_output("#{bin}/pzp pass 24").chomp.length
    assert_match "Generate a secure password", shell_output("#{bin}/pzp bogus 2>&1", 2)
  end
end
