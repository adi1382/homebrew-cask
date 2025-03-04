cask "spotify" do
  if Hardware::CPU.intel?
    version "1.1.66.580.gbd43cbc9,1.1.66.580.gbd43cbc9-18"
    sha256 :no_check

    url "https://download.scdn.co/Spotify.dmg",
        verified: "scdn.co/"
  else
    version "1.1.66.580.gbd43cbc9"
    sha256 :no_check

    url "https://download.scdn.co/SpotifyBetaARM64.dmg",
        verified: "scdn.co/"
  end

  name "Spotify"
  desc "Music streaming service"
  homepage "https://www.spotify.com/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  auto_updates true

  app "Spotify.app"

  uninstall launchctl: "com.spotify.webhelper"

  zap trash: [
    "~/Library/Application Support/Spotify",
    "~/Library/Caches/com.spotify.client",
    "~/Library/Caches/com.spotify.client.helper",
    "~/Library/Cookies/com.spotify.client.binarycookies",
    "~/Library/Logs/Spotify",
    "~/Library/Preferences/com.spotify.client.plist",
    "~/Library/Preferences/com.spotify.client.helper.plist",
    "~/Library/Saved Application State/com.spotify.client.savedState",
  ]
end
