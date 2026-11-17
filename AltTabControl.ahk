
#Requires AutoHotkey v2.0
#SingleInstance Force

count := 0
selecting := false

$!Tab:: {
    global count, selecting

    if (selecting) {
        Send "{Tab}"
        return
    }

    count++

    if (count >= 5) {
        count := 0
        selecting := true

        ToolTip "Select your window | Press TAB to move | Release ALT to open"

        Send "{Alt Down}{Tab}"
    }

    SetTimer ResetCounter, -2000
}

~*Alt Up:: {
    global selecting, count

    if (selecting) {
        selecting := false
        ToolTip
    }
}

; F7 - Emergency shutdown
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
