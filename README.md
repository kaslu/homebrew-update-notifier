# macOS Homebrew + Cask Update Notifier

![](https://i.imgur.com/wZHdBTj.jpg)

A script to announce outdated [Homebrew](http://brew.sh/) formulas and cask
installations in the macOS Notification Center.

## Installation

```bash
brew install vjt/formulas/homebrew-update-notifier
brew services start homebrew-update-notifier
```

Homebrew's `service` subcommand schedules the notifier to run daily at 12:00PM
and at 10:00PM by adding a launchd job in your `~/Library/LaunchAgents`.

If you want to change this, consider not executing the `brew service` and
following [Manual Scheduling](#user-content-manual-scheduling) steps below.

### Prerequisites

- [Homebrew](http://brew.sh/), of course.
- [terminal-notifier](https://github.com/alloy/terminal-notifier) is for
  sending the results of the script to the Notification Center.

If not installing via homebrew, you should install the latter manually with
`brew install terminal-notifier`.

### Manual Scheduling

[Here](http://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs)
there is a overview on launchd and how it replaces UNIX' cron(8).

1. Copy the launch agent file into your `~/Library/LaunchAgents`:

   ```
   cp $(brew --prefix homebrew-update-notifier)/*.plist ~/Library/LaunchAgent/my.update-notifier.plist
   ```

   NOTE: If not installing via homebrew, please extract the `plist` file
   [from the formula](https://github.com/vjt/homebrew-formulas/blob/master/homebrew-update-notifier.rb)

2. Modify the starting times and and other settings to your taste, by editing
   the items in the `StartCalendarInterval` at the bottom of the file

3. Schedule the job with:

   ```
   launchctl load  ~/Library/LaunchAgents/my.update-notifier.plist
   ```

   You can deschedule it with:

   ```
   launchctl unload ~/Library/LaunchAgents/my.update-notifier.plist
   ```

## Credits

Based on Richard Woeber's work: [:octocat:](https://github.com/rwoeber/homebrew-update-notifier)

## Version

2.1.0

## Public Domain License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute
this software, either in source code form or as a compiled binary, for any
purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public at large and to
the detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.


**The software is provided "as is", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose and noninfringement.**

In no event shall the authors be liable for any claim, damages or other
liability, whether in an action of contract, tort or otherwise, arising from,
out of or in connection with the software or the use or other dealings in the
software.**

For more information, please refer to [http://unlicense.org/](http://unlicense.org/)
