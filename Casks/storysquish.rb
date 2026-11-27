cask "storysquish" do
  version "0.4.1"
  sha256 "f30d1be1247104eb3d6e7da40c22a34d385efe06af2d0599bb01679e4d16d1d0"

  url "https://github.com/story-squish/storysquish/releases/download/v#{version}/StorySquish-v#{version}-macos-universal.pkg"
  name "StorySquish"
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  pkg "StorySquish-v#{version}-macos-universal.pkg"

  uninstall pkgutil: "io.github.storysquish"

  zap trash: [
    "~/.config/storysquish",
    "~/Library/Application Support/storysquish",
    "~/Library/Preferences/io.github.storysquish.plist",
  ]
end
