
#Requires AutoHotkey v2.0
#SingleInstance Force

count := 0
selecting := false
altTabHeld := false

$!Tab:: {
    global count, selecting, altTabHeld

    ; Ignore key repeat while Alt+Tab is held
    if (altTabHeld)
        return

    altTabHeld := true

    if (selecting) {
        Send "{Tab}"
        return
    }

    count++

    if (count >= 5) {
        count := 0
        selecting := true

        ToolTip "Select window | Tap TAB to move | Release ALT to open"
        Send "{Alt Down}{Tab}"
    }

    SetTimer ResetCounter, -2000
}

$!Tab Up:: {
    global altTabHeld
    altTabHeld := false
}

~*Alt Up:: {
    global selecting, count, altTabHeld

    altTabHeld := false

    if (selecting) {
        selecting := false
        ToolTip
    }
}

F7:: {
    ToolTip
    Send "{Alt Up}"
    ExitApp
}

ResetCounter() {
    global count, selecting

    if (!selecting)
        count := 0
}
