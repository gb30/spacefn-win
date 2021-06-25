; Note: This implementation assumes an en-US QWERTY layout.


SendMode Input
#NoEnv
#SingleInstance force


options := {delay: 50, timeout: 1000, doublePress: -1, swap_backtick_escape: false, mode: "ijkl"}
loop %0% {
	arg := %A_Index%
	argSplit := StrSplit(arg, "=")
	option := argSplit[1]
	value := argSplit[2]
	options[option] := value
}


#Include <dual/dual>
dual := new Dual


#Include <dual/defaults>


#If options.swap_backtick_escape
*`::dual.comboKey({F22: "Escape"})
#If


#If options.mode == "ijkl"
*i::dual.comboKey({F22: "Up"})
*j::dual.comboKey({F22: "Left"})
*k::dual.comboKey({F22: "Down"})
*l::dual.comboKey({F22: "Right"})

*u::dual.comboKey({F22: "PgUp"})
*o::dual.comboKey({F22: "PgDn"})
*a::dual.comboKey({F22: "Home"})
*`;::dual.comboKey({F22: "End"})

    
; *r::
; *r UP::dual.combine("LWin", A_ThisHotkey, {delay: 100})
; \::	
    ; dual.combo()
    ; if (GetKeyState("Space")) {
        ; MsgBox Hello, World!
    ; } else {
         ; SendInput \
    ; }
    ; return

; *\::dual.comboKey({F22: "#\"})
; *,::dual.SendInput("^#{left}")
; *.::dual.SendInput("^#{right}")
; *Tab::dual.SendInput("#{Tab}")

; *[::dual.SendInput("^{Delete}")
; *]::dual.SendInput("^{BackSpace}")


; *m::dual.comboKey({F22: "``"})
; *,::dual.comboKey({F22: "~"})
#If


#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.
*Space::
*Space UP::dual.combine("F22", A_ThisHotkey, {delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})

*BackSpace::dual.comboKey({F22: "Delete"})


*b::dual.comboKey({F22: "Space"})

*1::dual.comboKey({F22: "F1"})
*2::dual.comboKey({F22: "F2"})
*3::dual.comboKey({F22: "F3"})
*4::dual.comboKey({F22: "F4"})
*5::dual.comboKey({F22: "F5"})
*6::dual.comboKey({F22: "F6"})
*7::dual.comboKey({F22: "F7"})
*8::dual.comboKey({F22: "F8"})
*9::dual.comboKey({F22: "F9"})
*0::dual.comboKey({F22: "F10"})
*-::dual.comboKey({F22: "F11"})
*=::dual.comboKey({F22: "F12"})

; *RAlt::
; *RAlt UP::dual.combine(["RCtrl", "RShift"], ["'", "'", "Left"])

#If
