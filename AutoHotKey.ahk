#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; キーリピートの早いキーボードだと警告が出るので設定
#HotkeyInterval 100

; 主要なキーをホットキーとして検知可能にしておく
; A_ThisHotkey で検知可能にするための記述
; 検知だけしてAutoHotKey側では何も処理しない
; *~a::
; *~b::
; *~c::
; *~d::
; *~e::
; *~f::
; *~g::
; *~h::
; *~i::
; *~j::
; *~k::
; *~l::
; *~m::
; *~n::
; *~o::
; *~p::
; *~q::
; *~r::
; *~s::
; *~t::
; *~u::
; *~v::
; *~w::
; *~x::
; *~y::
; *~z::
; *~1::
; *~2::
; *~3::
; *~4::
; *~5::
; *~6::
; *~7::
; *~8::
; *~9::
; *~0::
; *~F1::
; *~F2::
; *~F3::
; *~F4::
; *~F5::
; *~F6::
; *~F7::
; *~F8::
; *~F9::
; *~F10::
; *~F11::
; *~F12::
; *~`::
; *~~::
; *~!::
; *~@::
; *~#::
; *~$::
; *~%::
; *~^::
; *~&::
; *~*::
; *~(::
; *~)::
; *~-::
; *~_::
; *~=::
; *~+::
; *~[::
; *~{::
; *~]::
; *~}::
; *~\::
; *~|::
; *~;::
; *~'::
; *~"::
; *~,::
; *~<::
; *~.::
; *~>::
; *~/::
; *~?::
; *~Esc::
; *~Tab::
; *~Space::
; *~LAlt::
; *~RAlt::
; *~Left::
; *~Right::
; *~Up::
; *~Down::
; *~Enter::
; *~PrintScreen::
; *~Delete::
; *~Home::
; *~End::
; *~PgUp::
; *~PgDn::
;     Return

;カタカナ/ひらがなキーを半角/全角キーにする
F13::
    KeyWait, F13
Return


; 無変換を修飾キーとして扱うための準備
; 無変換を押し続けている限りリピートせず待機
Shift & vk1D::
$vk1D::
;     startTime := A_TickCount
;     KeyWait, vk1D
;     keyPressDuration := A_TickCount - startTime
;     ; 無変換を押している間に他のホットキーが発動した場合は入力しない
;     ; 無変換を長押ししていた場合も入力しない
;     ;If (A_ThisHotkey == "$vk1D" and keyPressDuration < 200) {
;     ;    Send,{vk1D}
;     ;}
Return

; ; 無変換 + E = スクリプト編集
; ~vk1D & 2::
;     if GetKeyState("Ctrl","P"){   
;         if GetKeyState("Shift","P"){
;             Run, "C:\Program Files\Microsoft VS Code\Code.exe" "AutoHotKey.ahk"
;         }
;     }
;     Return
; ReloadのR
; ~vk1D & R::
;     if GetKeyState("Ctrl","P"){   
;         if GetKeyState("Shift","P"){
;             Reload
;             Return
;         }
;     }
;     MouseClick,WheelUp,,,1,0,D,R
;     Return

;---------------------------------------------------------------------
;  ショートカット
;---------------------------------------------------------------------
~F13 & A::
~vk1D & A::
    Send,{Blind}{AppsKey}
    Return
~F13 & Q::
~vk1D & Q::
    Send,{Blind}{Esc}
    Return
~F13 & vkBB::
~vk1D & vkBB::
~F13 & H::
~vk1D & H::
    Send,{Blind}{Enter}
    Return
~F13 & @::
~vk1D & @::
    Send,{Blind}{Del}
    Return
~F13 & vkBA::
~vk1D & vkBA::
    Send,{Blind}{BS}
    Return
~F13 & F:: Send, {Alt Down}{Tab}{Alt Up}
    Return
~vk1D & F:: Send, {Alt Down}{Tab}{Alt Up}
    Return
~F13 & R:: Send, {Alt Down}{Ctrl Down}{Tab}{Ctrl Up}{Alt Up}
    Return
~vk1D & R:: Send, {Alt Down}{Ctrl Down}{Tab}{Ctrl Up}{Alt Up}
    Return


;Hと;でHomeとEndキー 
~F13 & Y::
~vk1D & Y::
    Send,{Blind}{Home}
    Return    ; 無変換 + H = Home
~F13 & P::
~vk1D & P::
    Send,{Blind}{End}  ; 無変換 + ; = End
    Return
;UとOでHomeとEndキー 
~F13 & U::
~vk1D & U::
    Send,{Blind}{Ctrl Down}{Left}{Ctrl Up}
    Return    ; 無変換 + U = Home
~F13 & O::
~vk1D & O::
    Send,{Blind}{Ctrl Down}{Right}{Ctrl Up}  ; 無変換 + O = End
    Return
;EとDでPgUp、PgDnキー
~F13 & E::
~vk1D & E::
    Send,{Blind}{PgUp}    ; 変換 + E = Page Up
    Return
~F13 & D::
~vk1D & D::
    Send,{Blind}{PgDn} ; 変換 + D = Page Down
    Return

;WとSでHomeとEndキー
~F13 & W::
~vk1D & W::
    Send,{Blind}{Home}    ; 変換 + W = Home
    Return
~F13 & S::
~vk1D & S::
    Send,{Blind}{End} ; 変換 + S = End
    Return

;---------------------------------------------------------------------
;   ソフト切り替え
;---------------------------------------------------------------------
~F13 & Z::
~vk1D & Z::
    Send,{Blind}{LWinUp}{1}{LWinDown}
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & X::
~vk1D & X::
    Send,{Blind}#2
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & C::
~vk1D & C::
    Send,{Blind}#3
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & V::
~vk1D & V::
    Send,{Blind}#4
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return

~F13 & B::
~vk1D & B::
    Send,{Blind}#5
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return

~F13 & N::
~vk1D & N::
    Send,{Blind}#6
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & M::
~vk1D & M::
    Send,{Blind}#7
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & ,::
~vk1D & ,::
    Send,{Blind}#8
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & .::
~vk1D & .::
    Send,{Blind}#9
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return
~F13 & /::
~vk1D & /::
    Send,{Blind}#0
    if GetKeyState("Ctrl", "P")||GetKeyState("Shift", "P"){
        Return
    }
    KeyWait,vk1D
    Return

;カーソル操作系

~F13 & I:: 
~vk1D & I:: 
    Send,{Blind}{Up}
    Return
~F13 & J::
~vk1D & J::
    Send,{Blind}{Left}
    Return
~F13 & K::
~vk1D & K::
    Send,{Blind}{Down}
    Return
~F13 & L::
~vk1D & L::
    Send,{Blind}{Right}
    Return


; マウス操作系
~vk1D & Space::MouseClick,left,,,,,D
~vk1D & Space Up::MouseClick,left,,,,,U
~vk1D & F13:: MouseClick,right,,,,,D
~vk1D & F13 Up:: MouseClick,right,,,,,U

~vk1D & T::
~F13 & T::
    MouseClick,WheelUp,,,1,0,D,R
    Return
~F13 & G::
~vk1D & G::
    MouseClick,WheelDown,,,1,0,D,R
    Return