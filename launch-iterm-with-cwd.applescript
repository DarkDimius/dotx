on run argv
  tell application "iTerm"
    make new terminal
    tell the current terminal
      activate current session
      launch session "Default Session"
      tell the last session
        write text "cd " & item 1 of argv & "; clear"
      end tell
    end tell
  end tell
end run