
; -----------------------------
; Settings Variable
; -----------------------------

Local $setting_common_group = "Default"

Global $setting_win_title = "Name Nox"
Global $setting_thick_frame_size = "4:3"

Global $setting_item_pos_questscroll = 2
Global $setting_pvp_use_red_dia = True
Global $setting_enabled_castskillquest = False

Global $setting_delay_rate = 1.0
Global $setting_difficulty_exp = 2
Global $setting_difficulty_daily = 2
Global $setting_difficulty_adena = 2

Global $setting_enabled_scrollquest = True
Global $setting_enabled_weeklyquest = True
Global $setting_enabled_pvp = False
Global $setting_enabled_adena_dungeon = False
Global $setting_enabled_daily_dungeon = False
Global $setting_enabled_exp_dungeon = False
Global $setting_enabled_tower_dissipation = False
Global $setting_enabled_mainquest = False

Func loadConfig()

   $setting_win_title = IniRead($config, $setting_common_group, "win_title", $setting_win_title)
   $setting_thick_frame_size = IniRead($config, $setting_common_group, "thick_frame_size", $setting_thick_frame_size)
   $setting_item_pos_questscroll = Int(IniRead($config, $setting_common_group, "item_pos_questscroll", "2"))
   $setting_difficulty_exp = Int(IniRead($config, $setting_common_group, "difficulty_exp", "2"))
   $setting_difficulty_daily = Int(IniRead($config, $setting_common_group, "difficulty_daily", "2"))
   $setting_difficulty_adena = Int(IniRead($config, $setting_common_group, "difficulty_adena", "2"))
   $setting_delay_rate =  Number(IniRead($config, $setting_common_group, "delay_rate", "1.0"))

   $setting_pvp_use_red_dia = IniRead($config, $setting_common_group, "enabled_pvp_use_red_dia", "False") == "True" ? True : False

   $setting_enabled_scrollquest = IniRead($config, $setting_common_group, "enabled_scrollquest", "False") == "True" ? True : False
   $setting_enabled_weeklyquest = IniRead($config, $setting_common_group, "enabled_weeklyquest", "False") == "True" ? True : False
   $setting_enabled_pvp = IniRead($config, $setting_common_group, "enabled_pvp", "False") == "True" ? True : False
   $setting_enabled_adena_dungeon = IniRead($config, $setting_common_group, "enabled_adena_dungeon", "False") == "True" ? True : False
   $setting_enabled_daily_dungeon = IniRead($config, $setting_common_group, "enabled_daily_dungeon", "False") == "True" ? True : False
   $setting_enabled_exp_dungeon = IniRead($config, $setting_common_group, "enabled_exp_dungeon", "False") == "True" ? True : False
   $setting_enabled_tower_dissipation = IniRead($config, $setting_common_group, "enabled_tower_dissipation", "False") == "True" ? True : False
   $setting_enabled_mainquest = IniRead($config, $setting_common_group, "enabled_mainquest", "False") == "True" ? True : False

   $setting_enabled_castskillquest = IniRead($config, $setting_common_group, "enabled_cast_skill_quest", "False") == "True" ? True : False

EndFunc	;==>loadConfig

Func applyConfig()

   GUICtrlSetData($inputNoxTitle, $setting_win_title)
   GUICtrlSetData($inputThickFraemSize, $setting_thick_frame_size)
   _GUICtrlComboBox_SetCurSel($comboScrollPos, Int($setting_item_pos_questscroll) - 1)
   _GUICtrlComboBox_SetCurSel($comboExpDifficulty, Int($setting_difficulty_exp))
   _GUICtrlComboBox_SetCurSel($comboAdenaDifficulty, Int($setting_difficulty_adena))
   _GUICtrlComboBox_SetCurSel($comboDailyDifficulty, Int($setting_difficulty_daily))

   GUICtrlSetState($checkPvpUseRedDiaEnabled, $setting_pvp_use_red_dia ? $GUI_CHECKED : $GUI_UNCHECKED)

   GUICtrlSetState($checkScrollQuestEnabled, $setting_enabled_scrollquest ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkWeeklyQuestEnabled, $setting_enabled_weeklyquest ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkPvpEnabled, $setting_enabled_pvp ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkAdenaEnabled, $setting_enabled_adena_dungeon ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkDailyDungeonEnabled, $setting_enabled_daily_dungeon ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkExpEnabled, $setting_enabled_exp_dungeon ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkTowerDissipationEnabled, $setting_enabled_tower_dissipation ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkMainQuestEnabled, $setting_enabled_mainquest ? $GUI_CHECKED : $GUI_UNCHECKED)
   GUICtrlSetState($checkCastSkillQuestEnabled, $setting_enabled_castskillquest ? $GUI_CHECKED : $GUI_UNCHECKED)

   Local $arr = StringSplit($setting_thick_frame_size, ":")
   $NoxTitleBarHeight = Number($arr[1])
   $ThickFrameSize = Number($arr[2])

EndFunc	;==>applyConfig

Func saveConfig()

   IniWrite($config, $setting_common_group, "win_title", GUICtrlRead($inputNoxTitle))
   IniWrite($config, $setting_common_group, "thick_frame_size", GUICtrlRead($inputThickFraemSize))
   IniWrite($config, $setting_common_group, "item_pos_questscroll", _GUICtrlComboBox_GetCurSel($comboScrollPos) + 1)
   IniWrite($config, $setting_common_group, "difficulty_exp", _GUICtrlComboBox_GetCurSel($comboExpDifficulty))
   IniWrite($config, $setting_common_group, "difficulty_adena", _GUICtrlComboBox_GetCurSel($comboAdenaDifficulty))
   IniWrite($config, $setting_common_group, "difficulty_daily", _GUICtrlComboBox_GetCurSel($comboDailyDifficulty))

   IniWrite($config, $setting_common_group, "delay_rate", $setting_delay_rate)

   IniWrite($config, $setting_common_group, "enabled_scrollquest", _IsChecked($checkScrollQuestEnabled))
   IniWrite($config, $setting_common_group, "enabled_weeklyquest", _IsChecked($checkWeeklyQuestEnabled))
   IniWrite($config, $setting_common_group, "enabled_pvp", _IsChecked($checkPvpEnabled))
   IniWrite($config, $setting_common_group, "enabled_adena_dungeon", _IsChecked($checkAdenaEnabled))
   IniWrite($config, $setting_common_group, "enabled_daily_dungeon", _IsChecked($checkDailyDungeonEnabled))
   IniWrite($config, $setting_common_group, "enabled_exp_dungeon", _IsChecked($checkExpEnabled))
   IniWrite($config, $setting_common_group, "enabled_tower_dissipation", _IsChecked($checkTowerDissipationEnabled))
   IniWrite($config, $setting_common_group, "enabled_mainquest", _IsChecked($checkMainQuestEnabled))

   IniWrite($config, $setting_common_group, "enabled_pvp_use_red_dia", _IsChecked($checkPvpUseRedDiaEnabled))
   IniWrite($config, $setting_common_group, "enabled_cast_skill_quest", _IsChecked($checkCastSkillQuestEnabled))

EndFunc	;==>saveConfig

Func _IsChecked($idControlID)
    Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

