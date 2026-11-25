cask "storysquish" do
  version "0.2.1"
  sha256 "37901c1dfee3a4e192ab3045e02bca8e8ba8adbf0a2c22053148ff7afc61d1e5"

  url "https://github.com/story-squish/storysquish/releases/download/v#{version}/StorySquish-v#{version}-macos-universal.pkg"
  name "StorySquish"
  desc "Scene board for planning and drafting novels"
  homepage "https://story-squish.github.io/storysquish/"

  depends_on :macos

  pkg "StorySquish-v#{version}-macos-universal.pkg"

  uninstall pkgutil: "io.github.storysquish"

  zap trash: [
    "~/Library/Application Support/storysquish",
    "~/Library/Preferences/io.github.storysquish.plist",
  ]
end
