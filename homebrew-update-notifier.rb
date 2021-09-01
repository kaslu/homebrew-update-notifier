class HomebrewUpdateNotifier < Formula
  homepage "https://github.com/vjt/homebrew-update-notifier"
  url "https://github.com/vjt/homebrew-update-notifier/archive/2.1.0.tar.gz"
  version "2.1.0"
  sha256 "e7419225d31aed602e1b68b7588ec5591c44c2be337966ef8cc3373252aed270"

  depends_on "terminal-notifier"

  def install
    bin.install "homebrew-update-notifier"
  end

  def plist; <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>EnableGlobbing</key>
          <false/>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>/bin/bash</string>
            <string>#{HOMEBREW_PREFIX}/bin/homebrew-update-notifier</string>
          </array>
          <key>StandardErrorPath</key>
          <string>#{var}/log/homebrew-update-notifier.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/homebrew-update-notifier.log</string>
          <key>RunAtLoad</key>
          <true/>
          <key>StartCalendarInterval</key>
          <array>
              <dict>
                  <key>Hour</key>
                  <integer>12</integer>
                  <key>Minute</key>
                  <integer>0</integer>
              </dict>
              <dict>
                  <key>Hour</key>
                  <integer>22</integer>
                  <key>Minute</key>
                  <integer>0</integer>
              </dict>
          </array>
        </dict>
      </plist>
      EOS
  end
end
