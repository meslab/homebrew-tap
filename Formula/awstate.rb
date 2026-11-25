class Awstate < Formula
  desc "Snapshot AWS RDS, ElastiCache, ASG, ECS, ALB and CloudFront state"
  homepage "https://github.com/meslab/awstate"
  url "https://github.com/meslab/awstate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5a6e551906e5506fbe4eaacc25991e9256fe3bd13a581c6ec3e52d46b97013e5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awstate --version")
    assert_match "Usage: awstate", shell_output("#{bin}/awstate bogus 2>&1", 2)
  end
end
