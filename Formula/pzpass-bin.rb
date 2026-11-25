class PzpassBin < Formula
  desc "Password generator and encrypted password vault"
  homepage "https://github.com/pzpass/pzpass"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pzpass/pzpass/releases/download/v1.0.0/pzp-v1.0.0-aarch64-macos.tar.gz"
      sha256 "15a5587816b4fabe01b2b691f2d50edf871d4197128c0ab2b67f1d4b89404156"
    end
    # Intel Macs are refused by `depends_on arch:`, but the formula must still define a URL to load there.
    on_intel do
      url "https://github.com/pzpass/pzpass/releases/download/v1.0.0/pzp-v1.0.0-aarch64-macos.tar.gz"
      sha256 "15a5587816b4fabe01b2b691f2d50edf871d4197128c0ab2b67f1d4b89404156"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pzpass/pzpass/releases/download/v1.0.0/pzp-v1.0.0-x86_64-linux.tar.gz"
      sha256 "e81e711470885374404de4b95199df9e1677a6ed5e8a6fa55c4891b72b5a8af9"
    end
    on_arm do
      url "https://github.com/pzpass/pzpass/releases/download/v1.0.0/pzp-v1.0.0-aarch64-linux.tar.gz"
      sha256 "280b6aba6cf2e1fb71462e64ce5d33a413e9f2f7f2059c1ce4997109335065b6"
    end
  end

  conflicts_with "pzpass", because: "both install `pzp`"

  def install
    bin.install "pzp"
  end

  test do
    assert_equal 24, shell_output("#{bin}/pzp pass 24").chomp.length
  end
end
