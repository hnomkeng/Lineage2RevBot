Global $Initiate = 0

Local $tabX = 10
Local $tabY = 10
Local $contentPaneX = $tabX + 10
Local $contentPaneY = $tabY + 30

Local $gap = 10
Local $generalRightHeight = 240
Local $generalBottomHeight = 120
Local $logViewWidth = 260
Local $logViewHeight = 270
Local $frameWidth = $contentPaneX + $logViewWidth + $gap + $generalRightHeight + $tabX
Local $frameHeight = $contentPaneY + $logViewHeight + $gap + $generalBottomHeight + $tabY

Local $tabHeight = $frameHeight - $tabY - $tabY
Local $contentPaneWidth = $frameWidth - $contentPaneX * 2
Local $contentPaneHeight = $tabHeight - 30
Local $x
Local $y
Local $h = 20
Local $w = 150

; Main GUI Settings
$mainView = GUICreate($sBotTitle, $frameWidth, $frameHeight, -1, -1)

$idTab = GUICtrlCreateTab($tabX, $tabY, $frameWidth - $tabX * 2, $tabHeight)


;-----------------------------------------------------------
; Tab : General
;-----------------------------------------------------------
Local $generalRightX = $frameWidth - $tabX - $generalRightHeight
Local $generalBottomY = $frameHeight - $tabY - $generalBottomHeight

GUICtrlCreateTabItem("General")

$x = $generalRightX
$y = $contentPaneY + 5

; Scroll Quest
$w = 90
$checkScrollQuestEnabled = GUICtrlCreateCheckbox("Scroll Quest", $x, $y, $w, 25)
$btnScrollQuestGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)
$y += 30

GUICtrlCreateLabel("Scroll Pos", $x, $y)
$comboScrollPos = GUICtrlCreateCombo("", $x + 70, $y - 5, 100, $h)
For $i = 1 To 6
   GUICtrlSetData($comboScrollPos, "Item - " & $i)
Next
_GUICtrlComboBox_SetCurSel($comboScrollPos, 1)
$y += 30

; Weekly Quest
$w = 100
$checkWeeklyQuestEnabled = GUICtrlCreateCheckbox("Weekly Quest", $x, $y, $w, 25)
$btnWeeklyQuestGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)
$y += 30

; Main Quest
$w = 120
$checkMainQuestEnabled = GUICtrlCreateCheckbox("Main Quest", $x, $y, $w, 25)
$btnMainQuestGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)
$y += 30

; PVP
$w = 40
$checkPvpEnabled = GUICtrlCreateCheckbox("PVP", $x, $y, $w, 25)
$btnPvpGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)

; Daily Dungeon
$w = 100
$y += 30
$checkDailyDungeonEnabled = GUICtrlCreateCheckbox("Daily Dungeon", $x, $y, $w, 25)
$btnDailyDungeonGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)

$y += 30
GUICtrlCreateLabel("Difficulty", $x, $y)
$comboDailyDifficulty = GUICtrlCreateCombo("", $x + 70, $y - 5, 100, $h)
GUICtrlSetData($comboDailyDifficulty, "Easy")
GUICtrlSetData($comboDailyDifficulty, "Normal")
GUICtrlSetData($comboDailyDifficulty, "Hard")
GUICtrlSetData($comboDailyDifficulty, "Very Hard")
_GUICtrlComboBox_SetCurSel($comboDailyDifficulty, 2)

; Adena Dungeon
$w = 110
$y += 30
$checkAdenaEnabled = GUICtrlCreateCheckbox("Adena Dungeon", $x, $y, $w, 25)
$btnAdenaDungeonGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)

$y += 30
GUICtrlCreateLabel("Difficulty", $x, $y)
$comboAdenaDifficulty = GUICtrlCreateCombo("", $x + 70, $y - 5, 100, $h)
GUICtrlSetData($comboAdenaDifficulty, "Easy")
GUICtrlSetData($comboAdenaDifficulty, "Normal")
GUICtrlSetData($comboAdenaDifficulty, "Hard")
_GUICtrlComboBox_SetCurSel($comboAdenaDifficulty, 2)

; Exp Dungeon
$w = 100
$y += 30
$checkExpEnabled = GUICtrlCreateCheckbox("Exp Dungeon", $x, $y, $w, 25)
$btnExpDungeonGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)

$y += 30
GUICtrlCreateLabel("Difficulty", $x, $y)
$comboExpDifficulty = GUICtrlCreateCombo("", $x + 70, $y - 5, 100, $h)
GUICtrlSetData($comboExpDifficulty, "Easy")
GUICtrlSetData($comboExpDifficulty, "Normal")
GUICtrlSetData($comboExpDifficulty, "Hard")
_GUICtrlComboBox_SetCurSel($comboExpDifficulty, 2)

; Oman's Tower
$w = 120
$y += 30
$checkTowerDissipationEnabled = GUICtrlCreateCheckbox("Tower Dissipation", $x, $y, $w, 25)
$btnTowerGo = GUICtrlCreateButton("Go", $x + $w + 10, $y + 2, 40, 20)

; The Bot Status Screen
$txtLog = _GUICtrlRichEdit_Create($mainView, "", $contentPaneX, $contentPaneY, $logViewWidth, $logViewHeight, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, 8912))

; Start/Stop Button
$x = $contentPaneX
Local $btnWidth = 90
$btnStart = GUICtrlCreateButton("Start Bot", $x, $generalBottomY, $btnWidth, 50)
$btnStop = GUICtrlCreateButton("Stop Bot", $x, $generalBottomY, $btnWidth, 50)

$y = $frameHeight - 70
$guideKeyLabel = GUICtrlCreateLabel("Please press Ctrl + 1 in Nox." & @CRLF & "And then you must set W,A,D,S key " & @CRLF & "onto the joystick for the Dungeon Bot." & @CRLF & "*** Size Screen 800x600 Only", $x, $y)
GUICtrlSetColor($guideKeyLabel, 0xFF0000)
; TODO : add butto=n

;-----------------------------------------------------------
; Tab : Option
;-----------------------------------------------------------

GUICtrlCreateTabItem("Option")

; Battle Buff Items
$x = $contentPaneX
$y = $contentPaneY

; Nox Title
$Label_1 = GUICtrlCreateLabel("Nox Title", $x, $y + 5, 60, 20)
$x += 80
$inputNoxTitle = GUICtrlCreateInput("", $x, $y, 200, 20)

; Nox Title
$x = $contentPaneX
$y += 30
$Label_2 = GUICtrlCreateLabel("Thick Frame", $x, $y + 5, 100, 20)
$x += 80
$inputThickFraemSize = GUICtrlCreateInput("", $x, $y, 200, 20)

; PVP Red Dia Use
$x = $contentPaneX
$y += 30
$checkPvpUseRedDiaEnabled = GUICtrlCreateCheckbox("Use PVP Red Dia", $x, $y, $w, 25)

; Scroll Quest
$y += 30
$checkCastSkillQuestEnabled = GUICtrlCreateCheckbox("Cast Skill For Quest", $x, $y, 180, 25)

$x = $contentPaneX
$y += 50

GUICtrlCreateGroup("Utility", 20, $y, 410, 80)
$x = $contentPaneX + 10
$y += 20

; Pos Calc
$Label_1 = GUICtrlCreateLabel("PosCalc", $x, $y + 5, 50, 20)
$x += 60
$inputCalcPosX = GUICtrlCreateInput("", $x, $y, 30, 20)
$x += 30
GUICtrlCreateLabel($PosXYSplitter, $x, $y + 5, 10, 20)
$x += 10
$inputCalcPosY = GUICtrlCreateInput("", $x, $y, 30, 20)
$x += 40
$btnCalcPos = GUICtrlCreateButton("Calc", $x, $y, 40, 20)
$x += 50
$inputCalcResult = GUICtrlCreateInput("", $x, $y, 130, 20)


;==================================
; Control Initial setting
;==================================

GUICtrlSetOnEvent($btnStart, "btnStart")
GUICtrlSetOnEvent($btnStop, "btnStop")	; already handled in GUIControl
GUICtrlSetOnEvent($idTab, "tabChanged")
GUICtrlSetOnEvent($btnCalcPos, "btnCalcPos")

GUICtrlSetOnEvent($btnScrollQuestGo, "btnScrollQuestGo")
GUICtrlSetOnEvent($btnWeeklyQuestGo, "btnWeeklyQuestGo")
GUICtrlSetOnEvent($btnPvpGo, "btnPvpGo")
GUICtrlSetOnEvent($btnDailyDungeonGo, "btnDailyDungeonGo")
GUICtrlSetOnEvent($btnAdenaDungeonGo, "btnAdenaDungeonGo")
GUICtrlSetOnEvent($btnExpDungeonGo, "btnExpDungeonGo")
GUICtrlSetOnEvent($btnTowerGo, "btnTowerGo")
GUICtrlSetOnEvent($btnMainQuestGo, "btnMainQuestDo")

GUICtrlSetState($btnStart, $GUI_SHOW)
GUICtrlSetState($btnStop, $GUI_HIDE)

GUICtrlSetState($checkExpEnabled, $GUI_DISABLE)
GUICtrlSetState($btnExpDungeonGo, $GUI_DISABLE)
GUICtrlSetState($comboExpDifficulty, $GUI_DISABLE)

GUISetState(@SW_SHOW, $mainView)


;==================================
; Control Callback
;==================================

Func tabChanged()
   If _GUICtrlTab_GetCurSel($idTab) = 0 Then
	  ControlShow($mainView, "", $txtLog)
   Else
	  ControlHide($mainView, "", $txtLog)
   EndIf
EndFunc

Func InitBot()
   $RunState = True
   $PauseBot = False

   GUICtrlSetState($btnStart, $GUI_HIDE)
   GUICtrlSetState($btnStop, $GUI_SHOW)

   saveConfig()
   loadConfig()
   applyConfig()

   If findWindow() Then
	  WinActivate($HWnD)
	  IsNoxActivated()

	   _log("NoxTitleBarHeight : " & $NoxTitleBarHeight )
	   _log("ThickFrameSize : " & $ThickFrameSize )
	  SetLog("Nox : " & $WinRect[0] & "," & $WinRect[1] & " " & $WinRect[2] & "x" & $WinRect[3] & "(" & $setting_thick_frame_size & ")", $COLOR_ORANGE)
   Else
	  SetLog("Nox Not Found", $COLOR_RED)
	  btnStop()
   EndIf

   UpdateWindowRect()

   CloseAdvertisingScreen()

   Return True
EndFunc

Func btnStart()
   _log("START BUTTON CLICKED" )

   _GUICtrlEdit_SetText($txtLog, "")
   _WinAPI_EmptyWorkingSet(WinGetProcess($HWnD)) ; Reduce Nox Memory Usage

   If InitBot() = False Then
	  Return
   EndIf

   runBot()

EndFunc

Func btnStop()
   If $RunState = False Then
	  Return
   EndIf

   _log("STOP BUTTON CLICKED" )

   GUICtrlSetState($btnStart, $GUI_SHOW)
   GUICtrlSetState($btnStop, $GUI_HIDE)

   $Restart = False
   $RunState = False
   $PauseBot = True

   SetLog("Bot has stopped", $COLOR_ORANGE)
EndFunc

Func btnCalcPos()

   saveConfig()
   loadConfig()
   applyConfig()

   findWindow()

   $orgPosX = Int(GUICtrlRead($inputCalcPosX))
   $orgPosY = Int(GUICtrlRead($inputCalcPosY))

   $posX = $orgPosX - $ThickFrameSize
   $posY = $orgPosY -  $NoxTitleBarHeight

   $org = WinGetPos($HWnD)
   $r = $org
   If Not @error Then

	  $r[0] = $r[0] + $ThickFrameSize
	  $r[1] = $r[1] + $NoxTitleBarHeight
	  $r[2] = $r[2] + ($ThickFrameSize * 2)
	  $r[3] = $r[3] - $NoxTitleBarHeight - $ThickFrameSize

	  $x = Round($posX * 100.0 / $r[2], 1)
	  $y = Round($posY * 100.0 / $r[3], 1)

	  $result = $x & $PosXYSplitter & $y

	  ClipPut($result)

	  $color = GetPixelColor($orgPosX, $orgPosY);
	  $result = $result & " | " & "0x" & StringMid(Hex($color), 2)

	  _log( "WinSize [" & $org[2] & "," & $org[3] & "] => (" & $orgPosX & "," & $orgPosY & ") => " & $result & ", color = " & Hex($color))

	  GUICtrlSetData($inputCalcResult, $result)
   Else
	  GUICtrlSetData($inputCalcResult, "Nox Not Found")
   EndIf
EndFunc

Func btnScrollQuestGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoScrollQuest()
   btnStop()
EndFunc

Func btnWeeklyQuestGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoWeeklyQuest()
   btnStop()
EndFunc

Func btnPvpGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoPvPBattle()
   btnStop()
EndFunc

Func btnDailyDungeonGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoDailyDungeon()
   btnStop()
EndFunc

Func btnAdenaDungeonGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoAdenaDungeon()
   btnStop()
EndFunc

Func btnExpDungeonGo()
   If InitBot() = False Then
	  Return
   EndIf
   ; Not Support Yet
   btnStop()
EndFunc

Func btnTowerGo()
   If InitBot() = False Then
	  Return
   EndIf
   DoOmanTower()
   btnStop()
EndFunc

Func btnMainQuestDo()
   If InitBot() = False Then
	  Return
   EndIf
   DoMainQuest()
   btnStop()
EndFunc

; System callback
Func mainViewClose()

   saveConfig()
   _GDIPlus_Shutdown()
   _GUICtrlRichEdit_Destroy($txtLog)
   Exit
EndFunc
