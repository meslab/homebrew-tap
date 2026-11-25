cask "storysquish" do
  version "0.2.2"
  sha256 "63166525cff27aa881c1cd7fc53ee732753c93c19e52402be930849c53965d7f"

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
