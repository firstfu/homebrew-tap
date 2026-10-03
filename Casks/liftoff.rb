cask "liftoff" do
  version "1.2.1"
  sha256 "798591edba2e427365ac9d946b3a753de815d6be70c1f246133ca8c4e0d1b103"

  url "https://dl.ailoop.uk/liftoff/#{version}/Liftoff.zip"
  name "Liftoff"
  desc "Launchpad replacement with live window previews and Smart Organize"
  homepage "https://github.com/firstfu/Liftoff"

  livecheck do
    url "https://github.com/firstfu/Liftoff"
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Liftoff.app"

  uninstall quit: "com.firstfu.Liftoff"

  zap trash: [
    "~/Library/Application Support/Liftoff",
    "~/Library/Caches/com.firstfu.Liftoff",
    "~/Library/Preferences/com.firstfu.Liftoff.plist",
  ]

  caveats <<~EOS
    Liftoff is not notarized yet. The first time you open it, macOS blocks it:
    open System Settings > Privacy & Security, scroll down and click "Open Anyway".
    Window previews need Screen & System Audio Recording; Accessibility is optional.
    Updating from 1.2.0 asks you to allow them once more; from 1.2.1 on, updates keep them.
    If Liftoff is missing from the Screen & System Audio Recording list, click +
    below the list and choose /Applications/Liftoff.app.
  EOS
end
