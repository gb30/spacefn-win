; Note: This implementation assumes an en-US QWERTY layout.
SendMode Input
#NoEnv
#SingleInstance force

options := {delay: 130, timeout: 250, doublePress: -1, swap_backtick_escape: false, mode: "ijkl"}
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

#If options.mode == "ijkl"
; a reset key is a must
*ScrollLock::dual.reset()

; cursor keys
*i::dual.comboKey({F24: "Up"})
*j::dual.comboKey({F24: "Left"})
*k::dual.comboKey({F24: "Down"})
*l::dual.comboKey({F24: "Right"})

*u::dual.comboKey({F24: "PgUp"})
*o::dual.comboKey({F24: "PgDn"})
*h::dual.comboKey({F24: "Home"})
*`;::dual.comboKey({F24: "End"})

*Tab::dual.comboKey({F24: "Escape"})
#If


#If true ; modifierss.

; cursor modifiers
*s::
*s UP::dual.combine(["LCtrl","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*d::
*d UP::dual.combine(["LShift","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*f::
*f UP::dual.combine(["LAlt","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*a::
*a UP::dual.combine(["LWin","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})

; left hand regular modifiers
*x::
*x UP::dual.combine(["LCtrl"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*c::
*c UP::dual.combine(["LShift"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*v::
*v UP::dual.combine(["LAlt"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*b::
*b UP::dual.combine(["LWin"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})

; right hand regular modifiers
*.::
*. UP::dual.combine(["RCtrl"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*,::
*, UP::dual.combine(["RShift"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*m::
*m UP::dual.combine(["RAlt"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})
*n::
*n UP::dual.combine(["RWin"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})


*Space::
*Space UP::dual.combine("F24", A_ThisHotkey,{delay: options.delay, timeout: options.timeout})

#If


