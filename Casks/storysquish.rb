cask "storysquish" do
  version "0.4.0"
  sha256 "77a913166672efec616aa75d5f07daf79ea4a3d304af4f9be7e4c0bf98d8156e"

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
