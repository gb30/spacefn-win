; Note: This implementation assumes an en-US QWERTY layout.


SendMode Input
#NoEnv
#SingleInstance force


options := {delay: 80, timeout: 1000, doublePress: -1, swap_backtick_escape: false, mode: "ijkl"}
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
*i::dual.comboKey({F24: "Up"})
*j::dual.comboKey({F24: "Left"})
*k::dual.comboKey({F24: "Down"})
*l::dual.comboKey({F24: "Right"})

*e::dual.comboKey({F24: "Up"})
*s::dual.comboKey({F24: "Left"})
*d::dual.comboKey({F24: "Down"})
*f::dual.comboKey({F24: "Right"})

*u::dual.comboKey({F24: "PgUp"})
*o::dual.comboKey({F24: "PgDn"})
*a::dual.comboKey({F24: "Home"})
*`;::dual.comboKey({F24: "End"})

*ScrollLock::dual.reset()
    
#If



#If true ; modifierss.

; left hand modifiers

*z::
*z UP::dual.combine(["LCtrl","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})

*/::
*/ UP::dual.combine(["RCtrl","F24"],A_ThisHotkey,{delay:options.delay,timeout:options.timeout})

*Space::
*Space UP::dual.combine("F24", A_ThisHotkey,{delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})


#If
