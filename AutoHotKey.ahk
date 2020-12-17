#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; キーリピートの早いキーボードだと警告が出るので設定
#HotkeyInterval 100

; 主要なキーをホットキーとして検知可能にしておく
; A_ThisHotkey で検知可能にするための記述
; 検知だけしてAutoHotKey側では何も処理しない
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~LAlt::
*~RAlt::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

;カタカナ/ひらがなキーを半角/全角キーにする
F13::
    KeyWait, F13
Return

; 変換を修飾キーとして扱うための準備
; 変換を押し続けている限りリピートせず待機
$vk1C::Send,{vkF3sc029}
    ; startTime := A_TickCount
    ; KeyWait, vk1C
    ; keyPressDuration := A_TickCount - startTime
    ; ; 変換を押している間に他のホットキーが発動した場合は入力しない
    ; ; 変換を長押ししていた場合も入力しな
    ; If (A_ThisHotkey == "$vk1C" and keyPressDuration < 200) {
    ;     Send,{vkF3sc029}
    ; }
Return


; 無変換を修飾キーとして扱うための準備
; 無変換を押し続けている限りリピートせず待機
Shift & vk1D::
$vk1D::
    startTime := A_TickCount
    KeyWait, vk1D
    keyPressDuration := A_TickCount - startTime
    ; 無変換を押している間に他のホットキーが発動した場合は入力しない
    ; 無変換を長押ししていた場合も入力しない
    ;If (A_ThisHotkey == "$vk1D" and keyPressDuration < 200) {
    ;    Send,{vk1D}
    ;}
Return

; 無変換 + E = スクリプト編集
~vk1D & 2::
    if GetKeyState("Ctrl","P"){   
        if GetKeyState("Shift","P"){
            Run, "C:\Program Files\Microsoft VS Code\Code.exe" "AutoHotKey.ahk"
        }
    }
    Return
; ReloadのR
~vk1D & R::
    if GetKeyState("Ctrl","P"){   
        if GetKeyState("Shift","P"){
            Reload
            Return
        }
    }
    MouseClick,WheelUp,,,1,0,D,R
    Return

;---------------------------------------------------------------------
;   第１弾 カーソル移動
;---------------------------------------------------------------------
;~vk1D & F13::Send,{vkF3sc029}
~F13 & H::
~vk1D & H::
    Send,{Blind}{AppsKey}
    Return
~F13 & Q::
~vk1D & Q::
    Send,{Blind}{Esc}
    Return
~F13 & @::
~vk1D & @::
    Send,{Blind}{Enter}
    Return
~F13 & vkBAsc028::
~vk1D & vkBAsc028::
    Send,{Blind}{Enter}
    Return
~F13 & [::
~vk1D & [::
    Send,{Blind}{Del}
    Return
~F13 & ]::
~vk1D & ]::
    Send,{Blind}{BS}
    Return

;~vk1D & J::Send,{Blind}{Left}    ; 無変換 + J = 左カーソルキー
;~vk1D & K::Send,{Blind}{Down}    ; 無変換 + K = 下カーソルキー
;~vk1D & I::Send,{Blind}{Up}      ; 無変換 + I = 上カーソルキー
;~vk1D & L::Send,{Blind}{Right}   ; 無変換 + L = 右カーソルキー

;UとOでHomeとEndキー 
~F13 & U::
~vk1D & U::
    Send,{Blind}{Home}
    Return    ; 無変換 + U = Hom
~F13 & O::
~vk1D & O::
    Send,{Blind}{End}  ; 無変換 + O = End
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
;   第１弾 ソフト切り替え
;---------------------------------------------------------------------
~F13 & Z::
~vk1D & Z::
    Send,{Blind}#1
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

;---------------------------------------------------------------------
;   第１弾 マウスカーソル
;---------------------------------------------------------------------
; 変換 + WASD = マウスカーソル上, 左, 下, 右
; そのままだと細かい操作には向くが大きな移動には遅すぎる
; カーソル操作中にCtrlキーを一瞬押すといい感じにブーストできる
; CtrlとShiftでの加速減速はWindowsのマウスキー機能を踏襲
; 精密操作がしたい時は 変換+Shift+WASD でカーソルをゆっくり動かせる

~F13 & I:: 
~vk1D & I:: 
    IfNotEqual, mouseFlg,1
    {
        Send,{Blind}{Up}
    }
    Return
~F13 & J::
~vk1D & J::
    IfNotEqual, mouseFlg,1
    {
        Send,{Blind}{Left}
    }
    Return
~F13 & K::
~vk1D & K::
    IfNotEqual, mouseFlg,1
    {
        Send,{Blind}{Down}
    }
    Return
~F13 & L::
~vk1D & L::
    IfNotEqual, mouseFlg,1
    {
        Send,{Blind}{Right}
    }
    Return

~F13 & F::
~vk1D & F::
    global mouseFlg
    mouseFlg:=true
    While (GetKeyState("vk1D", "P")||GetKeyState("F13", "P"))                 ; 変換キーが押され続けている間マウス移動の処理をループさせる
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("I", "P") ? -5 : 0     ; 変換キーと一緒にIJKLが押されている間はカーソル座標を変化させ続ける
        MoveX += GetKeyState("J", "P") ? -5 : 0
        MoveY += GetKeyState("K", "P") ? 5 : 0
        MoveX += GetKeyState("L", "P") ? 5 : 0
        MoveX *= GetKeyState("Ctrl", "P") ? 7 : 1   ; Ctrlキーが押されている間は座標を10倍にし続ける(スピードアップ)
        MoveY *= GetKeyState("Ctrl", "P") ? 7 : 1
        MoveX *= GetKeyState("Shift", "P") ? 0.5 : 1 ; Shiftキーが押されている間は座標を30%にする（スピードダウン）
        MoveY *= GetKeyState("Shift", "P") ? 0.5 : 1
        MouseMove, %MoveX%, %MoveY%, 1, R            ; マウスカーソルを移動する
        Sleep, 0                                     ; 負荷が高い場合は設定を変更 設定できる値は-1、0、10～m秒 詳細はSleep
    }
    mouseFlg=false
    Return

; 以下は筆者のキーボード配列向け
; 変換 + Del =  左クリック（押し続けるとドラッグ）
~vk1D & Space::MouseClick,left,,,,,D
~vk1D & Space Up::MouseClick,left,,,,,U
~vk1D & F13:: MouseClick,right,,,,,D
~vk1D & F13 Up:: MouseClick,right,,,,,U

~vk1D & T::
~F13 & T::
~F13 & R::
    MouseClick,WheelUp,,,1,0,D,R
    Return
~F13 & G::
~vk1D & G::
    MouseClick,WheelDown,,,1,0,D,R
    Return