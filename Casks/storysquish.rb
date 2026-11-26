cask "storysquish" do
  version "0.3.1"
  sha256 "542c8124f2ef092048c085d3becd87bb2edf07c7007857d9e85ebfd16c72ef0c"

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
    "~/Library/Application Support/storysquish",
    "~/Library/Preferences/io.github.storysquish.plist",
  ]
end
