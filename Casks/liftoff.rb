cask "liftoff" do
  version "1.4.2"
  sha256 "1c14c9ae33b52192c05fa558165689acc48dd71e1b186c4b2543427853e0a8ef"

  url "https://dl.ailoop.uk/liftoff/#{version}/Liftoff.zip"
  name "Liftoff"
  desc "Launchpad replacement with live window previews and Smart Organize"
  homepage "https://github.com/firstfu/Liftoff"

  livecheck do
    url "https://github.com/firstfu/Liftoff"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Liftoff.app"

  uninstall quit: "com.firstfu.Liftoff"

  zap trash: [
    "~/Library/Application Support/Liftoff",
    "~/Library/Caches/com.firstfu.Liftoff",
    "~/Library/Caches/com.firstfu.Liftoff/org.sparkle-project.Sparkle",
    "~/Library/HTTPStorages/com.firstfu.Liftoff",
    "~/Library/Preferences/com.firstfu.Liftoff.plist",
  ]

  caveats <<~EOS
    Liftoff is not notarized yet. The first time you open it, macOS blocks it:
    open System Settings > Privacy & Security, scroll down and click "Open Anyway".
    Window previews need Screen & System Audio Recording; Accessibility is optional.
    Updating from 1.2.0 asks you to allow them once more; from 1.2.1 on, updates keep them.
    From 1.4.0 on, Liftoff updates itself (Settings > General > About).
    If Liftoff is missing from the Screen & System Audio Recording list, click +
    below the list and choose /Applications/Liftoff.app.
  EOS
end
