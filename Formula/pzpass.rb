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

  bottle do
    root_url "https://github.com/meslab/homebrew-tap/releases/download/pzpass-1.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "274a6e235441577150b401880628fffe7b1dc4e4e35c1b203113a2e1cbf8d53c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c746ce416e88ce2d64b4f2759beb3f0c5a5d39aaad16312a9f4e8214380f43cd"
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
