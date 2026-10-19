cask "shrinker-pro" do
  arch arm: "arm64"

  version "1.6.0"
  sha256 "5e00f34b31c68d0ae9797b499353c2be7e7b40fb571d898b21b1d002a5a68df5"

  url "https://github.com/jeso87/ShrinkerPro/releases/download/v#{version}/ShrinkerPro-#{version}.dmg"
  name "Shrinker Pro"
  desc "Minify images and graphics"
  homepage "https://shrinkerpro.app/"

  # The appcast is the app's own Sparkle feed, which is generated from the
  # same build this cask points at, so the two can never disagree about what
  # the latest version is. The feed carries the build number too ("1.5.0,10");
  # the cask's version is the marketing version alone.
  livecheck do
    url "https://jeso87.github.io/ShrinkerPro/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Sparkle updates the app in place. Without this, Homebrew's recorded
  # version goes stale after the first in-app update, and `brew upgrade`
  # would try to replace an app that is already newer than it thinks.
  auto_updates true
  # Apple Silicon only, by construction rather than by preference: every
  # Mach-O in the bundle is arm64 and a build gate blocks the release if any
  # Intel slice appears. Declaring this stops Homebrew offering it on an
  # Intel Mac, where it cannot run at all. `:sonoma` means Sonoma or later.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shrinker Pro.app"

  # The CLI is a separate formula rather than a binary stanza here. It is
  # built and signed separately, and someone who wants only the command
  # should not have to install the app to get it.

  zap trash: [
    "~/Library/Caches/com.eightseven.shrinkerpro",
    "~/Library/HTTPStorages/com.eightseven.shrinkerpro",
    "~/Library/Preferences/com.eightseven.shrinkerpro.plist",
  ]
end
