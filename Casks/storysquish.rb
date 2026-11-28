cask "storysquish" do
  version "0.4.2"
  sha256 "b50567d12ce4e1232ec3ca60e00d11d8699417cf7160810064af9a38f35cc41e"

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
