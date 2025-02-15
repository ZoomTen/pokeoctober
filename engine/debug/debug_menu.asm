DebugMenu::
	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	lb bc, SCREEN_HEIGHT - 2, 11
	hlcoord 0, 0
	call Textbox
	call SafeUpdateSprites
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	farcall LoadFonts_NoOAMUpdate
	call UpdateTimePals
	call .GetInput
	jr c, .Exit
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
.Exit:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ldh [hOAMUpdate], a
	call ExitMenu
	call CloseText
	call UpdateTimePals
	ret

.GetInput:
	xor a
	ldh [hBGMapMode], a
	ld hl, .MenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	jr nz, .b
	and a
	ret

.b
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 11, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db 0, 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .MenuItems
	dba .PlaceMenuStrings
	dba NULL

.PlaceMenuStrings:
	push de
	ld a, [wMenuSelection]
	ld hl, .Strings
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

.Strings:
	string "SOUND TEST"
	string "SUBGAME (SOON)"
	string "WARP!"
	string "COLOR"
	string "FILL DEX"
	string "TEACH MOVE"
	string "GIVE #"
	string "MAX ¥"
	string "WARP ANY"
	string "PC"
	string "FILL BAG"
	string "FILL TM/HM"
	string "PLAY CRY"
	string "TRAINERS"
	string "HELP"
	string "FIX EVENTS"
	string "FOLLOW"
	string "CREDITS"
	string "TOGGLE RUN"
	string "SHOW POS."
	string "GET CALLED"
	string "GET 1 ITEM"
	string "DO GC NOW"

.MenuItems
;	db 14
;	db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
	db 22
	db 14, 18, 0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 19, 20, 21, 22
	db -1

.Jumptable
	dw Debug_SoundTest
	dw Debug_SubgameMenu
	dw Debug_Warp
	dw Debug_ColorPicker
	dw Debug_FillDex
	dw Debug_TeachMove
	dw Debug_GivePoke
	dw Debug_MaxMoney
	dw Debug_WarpAny
	dw Debug_PC
	dw Debug_FillBag
	dw Debug_FillTMHM
	dw Debug_PlayCry
	dw Debug_Trainer
	dw Debug_Help
	dw Debug_FixEvents
	dw Debug_ToggleFollow
	dw Debug_Credits
	dw Debug_ToggleRun
	dw Debug_ShowPosition
	dw Debug_GetCalled
	dw Debug_GetOneItem
	dw Debug_GarbageCollectNow

Debug_GarbageCollectNow:
	ld hl, .FixEventsText
	call PrintText
	call .YesNo
	ret nz
; gc everything
	farcall ForceGarbageCollection
	ret

.YesNo
	call YesNoBox
	ld a, [wMenuCursorY]
	dec a
	and a
	ret

.FixEventsText
	text "Perform garbage"
	line "collection?"
	done


Debug_ShowPosition:
	ld a, [wPlayerStandingMapX]
	sub 4
	ld [wDebugPlayerXCalc], a
	ld a, [wPlayerStandingMapY]
	sub 4
	ld [wDebugPlayerYCalc], a
	ld hl, .Text
	jp PrintText
.Text:
	text "X: @"
	text_decimal wDebugPlayerXCalc, 1, 3
	text ", Y: @"
	text_decimal wDebugPlayerYCalc, 1, 3
	text ""
	prompt

Debug_Credits:
	ld a, BANK(.RunCredits)
	ld hl, .RunCredits
	jp CallScript
.RunCredits
	credits
	end

Debug_ToggleRun:
	ld hl, .ToggleRunText
	call PrintText
	call .OnOffBox
	jr nz, .disable
.enable
	ld a, 1
	jr .got_option
.disable
	xor a
.got_option
	ld [wDebugControlsToggle], a
	ret

.OnOffBox:
	lb bc, SCREEN_WIDTH - 6, 7
	push bc
	ld hl, .OnOffMenuHeader
	call CopyMenuHeader
	pop bc
	ld a, b
	cp SCREEN_WIDTH - 6
	jr nc, .on_off_box_ok
	ld a, SCREEN_WIDTH - 6
	ld b, a

.on_off_box_ok
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add 5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add 4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call InterpretTwoOptionMenu
	ld a, [wMenuCursorY]
	dec a
	and a
	ret

.OnOffMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 5, 15, 9
	dw .OnOffMenuData
	db 1 ; default option

.OnOffMenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2
	db "ON@"
	db "OFF@"

.ToggleRunText:
	text "Switch debug"
	line "controls<...>"
	done

Debug_ToggleFollow:
	ld a, [wPartyCount]
	and a
	jp z, .no_pokes

	ld hl, .ToggleFollowText
	call PrintText
	call .yesno

	jr nz, .disable
.enable
	ld b, 1 ; first pokemon in party
	callfar SetPartyNumberAsFollower
	ld hl, .FollowEnaText
	call PrintText
	ret

.disable
	callfar DisableFollower
	ld hl, .FollowDisaText
	call PrintText
	ret

.yesno
	call YesNoBox
	ld a, [wMenuCursorY]
	dec a
	and a
	ret

.no_pokes
	ld hl, .NoPokesText
	call PrintText
	ret

.NoPokesText:
	text "You need to have"
	line "at least one"
	cont "#MON first."
	prompt

.ToggleFollowText:
	text "Toggle following?"
	done

.FollowEnaText:
	text "Follower enabled."
	prompt

.FollowDisaText:
	text "Follower disabled."
	prompt


Debug_FixEvents:
	ld hl, .FixEventsText
	call PrintText
	call .YesNo
	ret nz
; reset events
	xor a
	ld hl, wEventFlags
	ld bc, wEventFlagsEnd - wEventFlags
	call ByteFill

	ld hl, wSceneIDs
	ld bc, wSceneIDsEnd - wSceneIDs
	call ByteFill

	ld a, BANK(.Init1)
	ld hl, .Init1
	call CallScript

	ld hl, .EventsFixedText
	call PrintText
	ret

.Init1
	scall .Init2
	end

.Init2
	jumpstd initializeevents

.YesNo
	call YesNoBox
	ld a, [wMenuCursorY]
	dec a
	and a
	ret

.FixEventsText
	text "Would you like to"
	line "reset all events?"
	done

.EventsFixedText
	text "All events and"
	line "scenes are"
	cont "initialized."
	done

	para "Warp back to HOME"
	line "to progress"
	cont "through events."
	prompt

Debug_Help:
; load header only once so we don't allocate
; too much memory and corrupt shit
	ld hl, .MenuHeader
	call LoadMenuHeader
.loop
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	hlcoord 0, 0
	call Textbox
	call ScrollingMenu
	and B_BUTTON
	ret nz
	ld a, [wMenuSelection]
	cp -1
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, .Dialogs
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .loop

.Dialogs:
	dw .MenuOpen
	dw .SoundTest
	dw .ColorMenu
	dw .TrainerMenu
	dw .CryMenu
.Dialogs_End:

DEBUG_NUM_HELP_ITEMS EQU (Debug_Help.Dialogs_End - Debug_Help.Dialogs) / 2

.MenuOpen:
	text "If you're reading"
	line "this, you've most"
	para "certainly got it"
	line "figured out."

	para "But for reference,"
	line "it's B plus START."

	para "When debug controls"
	line "are enabled, hold B"
	para "to run while in the"
	line "overworld."
	prompt

.CryMenu:
	text "L/R while holding"
	line "START: offset 100"
	para "L/R while holding"
	line "SELECT: offset 10"
	para "L/R only: offset 1"
	para "A while holding"
	line "SELECT: load cry"
	para "A: play cry"
	prompt

.SoundTest:
	text "1st line is MUSIC,"
	line "2nd line is SFX."
	prompt
.ColorMenu:
	text "Press START to"
	line "play a #MON's"
	cont "animation."

	para "Hold A, then press"
	line "START to edit the"
	cont "palette."

	para "Press B to exit."
	prompt
.TrainerMenu:
	text "1st line is class,"
	line "2nd line is which"
	cont "party to set."
	prompt

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1

.MenuData:
	db 0
	db 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .Items
	dba .DrawItem
	dba NULL

.Items:
	db DEBUG_NUM_HELP_ITEMS
x = 1
rept DEBUG_NUM_HELP_ITEMS
	db x
x = x + 1
endr
	db -1

.DrawItem:
	push de
	ld a, [wMenuSelection]
	dec a
	ld hl, .ItemNames
	ld bc, 13
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

.ItemNames:
	db "MENU@@@@@@@@@"
	db "SOUND TEST@@@"
	db "COLOR@@@@@@@@"
	db "TRAINERS@@@@@"
	db "PLAY CRY@@@@@"


Debug_GetCalled:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	hlcoord 0, 0
	lb bc, 3, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .play
	jr .loop

.left
	call .get_value
.left_loop
	push af
	ld a, e
	or d
	jr nz, .dec_music
	ld de, NUM_PHONE_CONTACTS - 1
	jr .left_cont
.dec_music
	dec de
.left_cont
	pop af
	dec a
	jr nz, .left_loop
	call .put_value
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc de

	push af
	ld a, d
	cp HIGH(NUM_PHONE_CONTACTS)
	jr c, .right_cont
	jr nz, .right_cont
	ld a, e
	cp LOW(NUM_PHONE_CONTACTS)
	jr c, .right_cont
	xor a
	ld d, a
	ld e, a
.right_cont
	pop af
	dec a
	jr nz, .right_loop
	call .put_value
	call .update_display
	jr .loop

.update_display
	hlcoord 1, 2
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld bc, 18
	ld a, " "
	call ByteFill
	ld hl, Debug_CalleeNames
	ld bc, 18
	ldh a, [hDebugMenuDataBuffer + 1]
	cp a, NUM_PHONE_CONTACTS
	jp nc, .loop
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 1, 3
	call PlaceString
	ret

.play
	call .get_value
	ld a, e
	or d
	ret z
	farcall LoadCallerScript
	ld a, BANK(Script_ReceivePhoneCall)
	ld hl, Script_ReceivePhoneCall
	jp CallScript

.get_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ldi a, [hl]
	ld e, [hl]
	ld d, a
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ld a, d
	ldi [hl], a
	ld [hl], e
	ret
	
INCLUDE "engine/debug/callee_names.asm"

Debug_GetOneItem:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	hlcoord 0, 0
	lb bc, 3, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ldh [hDebugMenuCursorPos], a
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .play
	jr .loop

.left
	call .get_value
	ld a, h
	or l
	jr nz, .dec_value
	ld hl, NUM_ITEMS
	jr .left_cont
.dec_value
	dec hl
.left_cont
	;dec b
	;jr nz, .leftloop
	call .put_value
	call .update_display
	jr .loop

.right
	call .get_value
	cphl16 NUM_ITEMS
	jr c, .inc_value
	ld hl, 1
	jr .right_cont
.inc_value
	inc hl
.right_cont
	;dec b
	;jr nz, .rightloop
	call .put_value
	call .update_display
	jr .loop

.update_display
	hlcoord 1, 2
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 3
	ld bc, 18
	ld a, " "
	call ByteFill
	;farcall ItemTableGarbageCollection
	
	ldh a, [hDebugMenuDataBuffer + 1]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 0]
	or h
	jr z, .no_item_name

	ld l, a
	call GetItemIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld de, wStringBuffer1
	hlcoord 1, 3
	call PlaceString
	ret

.no_item_name
	hlcoord 1, 3
	ld de, .BlankItemName
	jp PlaceString

.BlankItemName:
	string "------"

.play
	call .get_value
	ld a, l
	or h
	ret z
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	jp ReceiveItem

.get_value
	ld hl, hDebugMenuDataBuffer
	ldi a, [hl]
	ld h, [hl]
	ld l, a
	ret

.put_value
	ld c, LOW(hDebugMenuDataBuffer)
	ld a, l
	ld [c], a
	inc c
	ld a, h
	ld [c], a
	ret


Debug_SoundTest:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	jp z, .end
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .play
	and D_UP | D_DOWN
	jr nz, .change
	jr .loop

.change
	ldh a, [hDebugMenuCursorPos]
	inc a
	and 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .get_value
.left_loop
	push af
	ld a, e
	or d
	jr nz, .dec_music
	ld de, NUM_MUSIC_TRACKS - 1
	jr .left_cont
.dec_music
	dec de
.left_cont
	pop af
	dec a
	jr nz, .left_loop
	call .put_value
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc de

	push af
	ld a, d
	cp HIGH(NUM_MUSIC_TRACKS)
	jr c, .right_cont
	jr nz, .right_cont
	ld a, e
	cp LOW(NUM_MUSIC_TRACKS)
	jr c, .right_cont
	xor a
	ld d, a
	ld e, a
.right_cont
	pop af
	dec a
	jr nz, .right_loop
	call .put_value
	call .update_display
	jr .loop

.update_display
	hlcoord 1, 2
	ld a, " "
	ld [hl], a
	hlcoord 1, 5
	ld a, " "
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .update_music
	hlcoord 1, 5
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 5
	ld de, hDebugMenuDataBuffer + 2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

.update_music
	hlcoord 1, 2
	ld a, "▶"
	ldi [hl], a
	inc hl
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld bc, 18
	ld a, " "
	call ByteFill
	ld hl, Debug_MusicNames
	ld bc, 18
	ldh a, [hDebugMenuDataBuffer + 1]
	cp a, NUM_MUSIC_TRACKS
	jp nc, .loop
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 1, 3
	call PlaceString
	ret

.play
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .play_music
	call .get_value
	call PlaySFX
	;call WaitSFX
	jp .loop

.play_music
	ld de, 0
	call PlayMusic
	call DelayFrame
	call .get_value
	call PlayMusic
	jp .loop

.end
	ret

.get_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ldi a, [hl]
	ld e, [hl]
	ld d, a
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add a
	add l
	ld l, a
	ld a, d
	ldi [hl], a
	ld [hl], e
	ret

Debug_MusicNames::
	db "None@@@@@@@@@@@@@@"
INCLUDE "audio/music_names.asm"

Debug_SubgameMenu:
	ret ; TODO
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	dec a
	ld bc, 3
	ld hl, .Jumptable
	call AddNTimes
	ldi a, [hl]
	ld b, a
	ldi a, [hl]
	ld h, [hl]
	ld l, a
	ld a, b
	rst $08
	ret

.Jumptable:
	dba SlotMachine
	dba CardFlip
	dba UnownPuzzle

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 10, 0, SCREEN_WIDTH - 1, 9
	dw .MenuData
	db 1 ; default

.MenuData:
	db STATICMENU_CURSOR
	db 4 ; # items
	string "Slots"
	string "Card"
	string "Unown"

Debug_Warp:
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	hlcoord 0, 0
	call Textbox
	ld hl, .MenuHeader
	call LoadMenuHeader
	call ScrollingMenu
	and B_BUTTON
	ret nz
	ld a, [wMenuSelection]
	cp -1
	ret z
	dec a
	ld c, a
	ld b, 0
	ld hl, .SpawnTable
	add hl, bc
	ld a, [hl]
	cp -1
	ret z
	ld [wDefaultSpawnpoint], a
	farcall FlyFunction.DoFly
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.LocNames:
	db "HOME@@@@@@@@@"
	db "DEBUG@@@@@@@@"
	db "-- KANSAI --@"
	db "SILENT@@@@@@@"
	db "SHIZUKANAOKA@"
	db "CHERRYGROVE@@"
	db "VIOLET@@@@@@@"
	db "ZEN GARDEN@@@"
	db "ROUTE 32@@@@@"
	db "ALDER@@@@@@@@"
	db "AZALEA@@@@@@@"
	db "GOLDENROD@@@@"
	db "ECRUTEAK@@@@@"
	db "OLIVINE@@@@@@"
	db "MAHOGANY@@@@@"
	db "LAKE BIWAKO@@"
	db "BLACKTHORN@@@"
	db "MOUNT FUJI@@@"
	db " -- KANTO --@"
	db "PALLET@@@@@@@"
	db "VIRIDIAN@@@@@"
	db "PEWTER@@@@@@@"
	db "CERULEAN@@@@@"
	db "ROCK TUNNEL@@"
	db "VERMILION@@@@"
	db "LAVENDER@@@@@"
	db "SAFFRON@@@@@@"
	db "CELADON@@@@@@"
	db "FUCHSIA@@@@@@"
	db "CINNABAR@@@@@"
	db "INDIGO@@@@@@@"
	db "CITRINE@@@@@@"

.SpawnTable:
	db SPAWN_HOME
	db SPAWN_DEBUG
	db -1
	db SPAWN_SILENT
	db SPAWN_SILENT_HILLS
	db SPAWN_CHERRYGROVE
	db SPAWN_VIOLET
	db SPAWN_CHERRYGROVE_SHRINE ; ZEN GARDEN
	db SPAWN_ROUTE_32
	db SPAWN_ALDER
	db SPAWN_AZALEA
	db SPAWN_GOLDENROD
	db SPAWN_ECRUTEAK
	db SPAWN_OLIVINE
	db SPAWN_MAHOGANY
	db SPAWN_LAKE_OF_RAGE
	db SPAWN_BLACKTHORN
	db SPAWN_MT_SILVER
	db -1
	db SPAWN_PALLET
	db SPAWN_VIRIDIAN
	db SPAWN_PEWTER
	db SPAWN_CERULEAN
	db SPAWN_ROCK_TUNNEL
	db SPAWN_VERMILION
	db SPAWN_LAVENDER
	db SPAWN_SAFFRON
	db SPAWN_CELADON
	db SPAWN_FUCHSIA
	db SPAWN_CINNABAR
	db SPAWN_INDIGO
	db SPAWN_CITRINE
.SpawnTableEnd:

NUM_DEBUG_SPAWNS EQU Debug_Warp.SpawnTableEnd - Debug_Warp.SpawnTable

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2, SCREEN_HEIGHT - 2
	dw .MenuData
	db 1

.MenuData:
	db 0
	db 8, 0
	db SCROLLINGMENU_ITEMS_NORMAL
	dba .Items
	dba .DrawItem
	dba NULL

.Items:
	db NUM_DEBUG_SPAWNS
x = 1
rept NUM_DEBUG_SPAWNS
	db x
x = x + 1
endr
	db -1

.DrawItem:
	push de
	ld a, [wMenuSelection]
	dec a
	ld hl, .LocNames
	ld bc, 13
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

Debug_ColorPicker:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	farcall DebugColorPicker
	pop af
	ldh [hMapAnims], a
	call ReloadTilesetAndPalettes
	ret

INCLUDE "engine/debug/color_picker.asm"

Debug_FillDex:
; give pokedex
	ld de, ENGINE_POKEDEX
	ld b, SET_FLAG
	farcall EngineFlagAction
; set flags
	ld hl, 0
.loop
	inc hl
	ld a, h
	cp HIGH(NUM_POKEMON+1)
	jr nz, .setflag
	ld a, l
	cp LOW(NUM_POKEMON+1)
	ret z
.setflag
	push hl
	call GetPokemonIDFromIndex
	call SetSeenAndCaughtMon
	pop hl
	jr .loop

Debug_TeachMove:
	ld a, [wPartyCount]
	and a
	jp z, .no_pokes

	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp A_BUTTON
	jr z, .teach
	ld b, a
	ldh a, [hJoyDown]
	and $f
	or b
	cp D_LEFT
	jr z, .left1
	cp D_RIGHT
	jr z, .right1
	cp D_DOWN
	jr z, .left10
	cp D_UP
	jr z, .right10
	cp D_LEFT | SELECT
	jr z, .left100
	cp D_RIGHT | SELECT
	jr z, .right100
	jr .loop

.left1
	call .left
	call .update_display
	jr .loop

.right1
	call .right
	call .update_display
	jr .loop

.left100
	ld c, 100
	jr .left10loop

.right100
	ld c, 100
	jr .right10loop

.left10
	ld c, 10
.left10loop
	call .left
	dec c
	jr nz, .left10loop
	call .update_display
	jr .loop

.right10
	ld c, 10
.right10loop
	call .right
	dec c
	jr nz, .right10loop
	call .update_display
	jr .loop

.teach
	xor a
	ld [wCurPartyMon], a
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	call GetMoveIDFromIndex
	ld [wTempTMHM], a
	ld [wPutativeTMHMMove], a
	call GetMoveName
	ld de, wStringBuffer2
	ld hl, wStringBuffer1
	ld bc, 13
	call CopyBytes
	predef LearnMove
	ret

.left
	ldh a, [hDebugMenuDataBuffer + 1]
	and a
	jr nz, .go_left
	ldh a, [hDebugMenuDataBuffer]
	and a
	jr nz, .go_left2
	ld a, HIGH(NUM_ATTACKS)
	ldh [hDebugMenuDataBuffer], a
	ld a, LOW(NUM_ATTACKS)
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.go_left2
	dec a
	ldh [hDebugMenuDataBuffer], a
	xor a
.go_left
	dec a
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.right
	ldh a, [hDebugMenuDataBuffer + 1]
	cp LOW(NUM_ATTACKS)
	jr nz, .go_right
	ldh a, [hDebugMenuDataBuffer]
	cp HIGH(NUM_ATTACKS)
	jr nz, .go_right
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.go_right
	ldh a, [hDebugMenuDataBuffer + 1]
	inc a
	ldh [hDebugMenuDataBuffer + 1], a
	ret nz
	ldh a, [hDebugMenuDataBuffer]
	inc a
	ldh [hDebugMenuDataBuffer], a
	ret

.update_display
	hlcoord 3, 2
	ld a, " "
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ldi [hl], a
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	ld hl, hDebugMenuDataBuffer
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and a
	jr nz, .doname
	ld a, l
	and a
	ret z
.doname
	call GetMoveIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	hlcoord 1, 3
	ld de, wStringBuffer1
	call PlaceString
	ret

.no_pokes
	ld hl, .NoPokesText
	jp PrintText

.NoPokesText:
	text "No #MON in"
	line "party!"
	prompt

Debug_GivePoke:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	ldh [hDebugMenuDataBuffer + 3], a
	ldh [hDebugMenuDataBuffer + 4], a
	ldh [hDebugMenuDataBuffer + 5], a
	hlcoord 0, 0
	lb bc, 8, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 2
	ldh [hDebugMenuCursorPos], a
	call .update_display
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display

.loop
	call JoyTextDelay
	ldh a, [hJoyDown]
	and $e
	ld b, a
	ldh a, [hJoyLast]
	or b
	bit A_BUTTON_F, a
	jp nz, .givepoke
	bit B_BUTTON_F, a
	ret nz
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	ld b, 1
	bit START_F, a
	jr nz, .start
	bit SELECT_F, a
	jr z, .select
	ld b, 10
	jr .select
.start
	ld b, 100
.select
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	jr .loop

.up
	ldh a, [hDebugMenuCursorPos]
	and a
	jr nz, .do_up
	ld a, 3
.do_up
	dec a
	jr .curchange

.down
	ldh a, [hDebugMenuCursorPos]
	cp 2
	jr nz, .do_down
	ld a, -1
.do_down
	inc a
.curchange
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .getdat
.leftloop
; hl == 0?
	ld a, h
	or l
	jr nz, .dec_value
; check cursor
	ld a, [hDebugMenuCursorPos]
	and a
	jr z, .dec_pokemon
	cp 1
	jr z, .dec_items
; level
	ld hl, 100
	jr .left_cont
.dec_pokemon
	ld hl, NUM_POKEMON
	jr .left_cont
.dec_items
	ld hl, NUM_ITEMS
	jr .left_cont
.dec_value
	dec hl
.left_cont
	dec b
	jr nz, .leftloop
	call .putdat
	call .update_display
	jr .loop

.right
	call .getdat
.rightloop
; check cursor
	ld a, [hDebugMenuCursorPos]
	and a
	jr z, .inc_pokemon
	cp 1
	jr z, .inc_items
; level
	cphl16 100
	jr c, .inc_value
	ld hl, 1
	jr .right_cont
.inc_pokemon
	cphl16 NUM_POKEMON
	jr c, .inc_value
	ld hl, 1
	jr .right_cont
.inc_items
	cphl16 NUM_ITEMS
	jr c, .inc_value
	ld hl, 1
	jr .right_cont
.inc_value
	inc hl
.right_cont
	dec b
	jr nz, .rightloop
	call .putdat
	call .update_display
	jp .loop

.getdat
	ldh a, [hDebugMenuCursorPos]
	add a
	add LOW(hDebugMenuDataBuffer)
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	dec c
	ret

.putdat
	ld a, h
	ldh [c], a
	inc c
	ld a, l
	ldh [c], a
	ret

.givepoke
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	jp z, .loop
	cphl16 NUM_POKEMON + 1
	jp nc, .loop
	ldh a, [hDebugMenuDataBuffer + 5]
	and a
	jp z, .loop
	cp 101
	jp nc, .loop
	ld [wCurPartyLevel], a
	ldh a, [hDebugMenuDataBuffer + 3]
	push hl
		ld l, a
		ld h, 0
		call GetItemIDFromIndex
	pop hl
	ld [wCurItem], a
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld b, 0
	farcall GivePoke
	ret

.update_display
	ld a, " "
	hlcoord 1, 2
	ld [hl], a
	hlcoord 1, 5
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	jr z, .put_mon
	dec a
	jr z, .put_item

; fallthrough
.put_level
	hlcoord 1, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 8
	ld a, "L"
	ld [hli], a
	ld a, "v"
	ld [hli], a
	inc hl
	ld de, hDebugMenuDataBuffer + 5
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.put_mon
	hlcoord 1, 2
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 2
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	cphl16 0
	ret z
	cphl16 NUM_POKEMON + 1
	ret nc
	push hl
	hlcoord 1, 3
	ld a, " "
	ld bc, 18
	call ByteFill
	pop hl
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 1, 3
	call PlaceString
	ret

.put_item
	hlcoord 1, 5
	ld a, "▶"
	ld [hl], a
	hlcoord 3, 5
	ld de, hDebugMenuDataBuffer + 3
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 6
	ld bc, 18
	ld a, " "
	call ByteFill
; force GC before setting an item
	farcall ItemTableGarbageCollection

	ldh a, [hDebugMenuDataBuffer + 3]
	and a
	jr z, .no_item_name
; still limited to 255 items for now
 	ld l, a
	ld h, 0
	call GetItemIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld de, wStringBuffer1
	hlcoord 1, 6
	call PlaceString
	ret

.no_item_name
	hlcoord 1, 6
	ld de, .BlankItemName
	jp PlaceString

.BlankItemName:
	string "------"

Debug_MaxMoney:
	ld hl, wMoney
	ld a, HIGH(MAX_MONEY >> 8)
	ld [hli], a
	ld a, LOW(MAX_MONEY >> 8)
	ld [hli], a
	ld a, LOW(MAX_MONEY)
	ld [hl], a
	ld hl, wCoins
	ld a, HIGH(MAX_COINS)
	ld [hli], a
	ld a, LOW(MAX_COINS)
	ld [hl], a
	ret

Debug_WarpAny:
	ld a, 1
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuDataBuffer + 2], a
	hlcoord 0, 0
	lb bc, 3, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	ld a, 2
	ldh [hDebugMenuCursorPos], a
	call .update_display
	ld a, 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	xor a
	ldh [hDebugMenuCursorPos], a
	call .update_display

.loop
	call JoyTextDelay
	ldh a, [hJoyDown]
	and $e
	ld b, a
	ldh a, [hJoyLast]
	or b
	bit A_BUTTON_F, a
	jr nz, .warp
	bit B_BUTTON_F, a
	ret nz
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	ld b, 1
	bit START_F, a
	jr nz, .start
	bit SELECT_F, a
	jr z, .select
	ld b, 10
	jr .select
.start
	ld b, 100
.select
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right
	jr .loop

.up
	ldh a, [hDebugMenuCursorPos]
	and a
	jr nz, .do_up
	ld a, 3
.do_up
	dec a
	jr .curchange

.down
	ldh a, [hDebugMenuCursorPos]
	cp 2
	jr nz, .do_down
	ld a, -1
.do_down
	inc a
.curchange
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .getdat
.leftloop
	dec a
	dec b
	jr nz, .leftloop
	call .putdat
	call .update_display
	jr .loop

.right
	call .getdat
.rightloop
	inc a
	dec b
	jr nz, .rightloop
	call .putdat
	call .update_display
	jr .loop

.getdat
	ldh a, [hDebugMenuCursorPos]
	add LOW(hDebugMenuDataBuffer)
	ld c, a
	ldh a, [c]
	ret

.putdat
	ldh [c], a
	ret

.warp
	ld hl, hDebugMenuDataBuffer
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	ld a, BANK(dig_incave.UsedDigOrEscapeRopeScript)
	ld hl, dig_incave.UsedDigOrEscapeRopeScript + 1
	call FarQueueScript
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.update_display
	ld a, " "
	hlcoord 1, 1
	ld [hl], a
	hlcoord 1, 2
	ld [hl], a
	hlcoord 1, 3
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	ld c, a
	ld b, 0
	ld hl, hDebugMenuDataBuffer
	add hl, bc
	ld d, h
	ld e, l
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, "▶"
	ld [hli], a
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

Debug_PC:
	farcall PokemonCenterPC
	ret

Debug_FillBag:
	ld a, BANK(.GiveLotsOfItems)
	ld hl, .GiveLotsOfItems
	jp CallScript
.GiveLotsOfItems
	giveitem AQUA_HORN
	giveitem POTION, 5
	giveitem MAX_POTION, 8
	giveitem ITEM_101
	giveitem ITEM_100
	giveitem POTION
	giveitem MASTER_BALL
	giveitem ULTRA_BALL
	giveitem GREAT_BALL
	giveitem POKE_BALL
	giveitem SMOKE_BALL
	giveitem GS_BALL
	giveitem HEAVY_BALL
	giveitem LEVEL_BALL
	giveitem LURE_BALL
	giveitem FAST_BALL
	giveitem LIGHT_BALL
	giveitem FRIEND_BALL
	giveitem MOON_BALL
	giveitem LOVE_BALL
	giveitem PARK_BALL
	giveitem SAFARI_BALL
	giveitem DIRECT_BALL
	giveitem NIGHT_BALL
	giveitem RED_APRICORN
	giveitem BLU_APRICORN
	giveitem YLW_APRICORN
	giveitem GRN_APRICORN
	giveitem WHT_APRICORN
	giveitem BLK_APRICORN
	giveitem PNK_APRICORN
	giveitem HP_UP
	giveitem PROTEIN
	giveitem IRON
	giveitem CARBOS
	giveitem CALCIUM
	end

; ------ old 8-bit code --------
	ld hl, wNumItems
	ld bc, wItemsEnd - wNumItems
	xor a
	call ByteFill

IF 1
; reset scroll position every time
	ld a, 1
	ld [wItemsPocketCursor], a
	xor a
	ld [wItemsPocketScrollPosition], a

; fill bag, incrementing the item ID
	ld hl, wNumItems
	ld c, MAX_ITEMS
	ld [hl], c
	inc hl
	ld a, [wDebugItemPickerBuffer]
.loop
	inc a
	ld [hli], a
	ld [hl], 99
	ld [wDebugItemPickerBuffer], a
	inc hl
	dec c
	jr nz, .loop
	ld [hl], -1
	ret

ELSE
; just fills the bag no questions asked
	ld a, -1
	ld hl, wItems
	ld [hl], a
	ld hl, wKeyItems
	ld [hl], a
	ld hl, wBalls
	ld [hl], a

	ld a, 1
.loop
	push af
	ld [wCurItem], a
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld a, [wStringBuffer1]
	cp "?"
	jr z, .next
	farcall CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp KEY_ITEM
	jr z, .give_key_item

	ld a, 99
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem

	call nc, .full_break

	jr .next

.give_key_item
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem

	call nc, .full_break

.next
	pop af
	inc a
	cp -1
	jr nz, .loop
	ret

.full_break
; set breakpoint to check if full
	ret
ENDC

Debug_FillTMHM:
	ld e, NUM_TMS + NUM_HMS
	ld d, 0
.fill_loop
	push de
		call .give_tm
	pop de
	dec e
	jr z, .give_tm
	jr .fill_loop
.give_tm
	ld b, SET_FLAG
	ld hl, wTMsHMs
	jp FlagAction

Debug_PlayCry:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld hl, hDebugMenuDataBuffer
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hDebugMenuCursorPos], a
	ld a, LOW(hDebugMenuDataBuffer)
	ld [hl], a
	hlcoord 0, 0
	lb bc, 7, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_numbers
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	ret z
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jr z, .play
	cp D_UP
	jr z, .up
	cp D_DOWN
	jr z, .down
	jr .loop
	ret

.left
	ldh a, [hDebugMenuDataBuffer + 8]
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	call .updateleft
	ld a, l
	ldh [c], a
	dec c
	ld a, h
	ldh [c], a
	call .update_numbers
	jr .loop

.right
	ldh a, [hDebugMenuDataBuffer + 8]
	ld c, a
	ldh a, [c]
	ld h, a
	inc c
	ldh a, [c]
	ld l, a
	call .updateright
	ld a, l
	ldh [c], a
	dec c
	ld a, h
	ldh [c], a
	call .update_numbers
	jr .loop

.up
	ldh a, [hDebugMenuDataBuffer + 8]
	cp LOW(hDebugMenuDataBuffer)
	jr z, .underflow
	dec a
	dec a
	jr .set_cursor
.underflow
	ld a, LOW(hDebugMenuDataBuffer + 6)
	jr .set_cursor

.down
	ldh a, [hDebugMenuDataBuffer + 8]
	cp LOW(hDebugMenuDataBuffer + 6)
	jr z, .overrflow
	inc a
	inc a
	jr .set_cursor
.overrflow
	ld a, LOW(hDebugMenuDataBuffer)

.set_cursor
	ldh [hDebugMenuDataBuffer + 8], a
	call .update_numbers
	jr .loop

.play
	ld a, [hJoyDown]
	and SELECT
	jr nz, .copyvanilla
	ld hl, hDebugMenuDataBuffer + 2
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryLength + 1], a
	ld a, [hl]
	ld [wCryLength], a
	farcall _PlayCry
	jp .loop

.copyvanilla
	ld hl, hDebugMenuDataBuffer
	ld d, [hl]
	inc hl
	ld e, [hl]
	dec de
	ld a, d
	and a
	ld hl, PokemonCries
	ld a, BANK(PokemonCries)
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld de, hDebugMenuDataBuffer + 2
	ld bc, 6
	call FarCopyBytes
	ld c, LOW(hDebugMenuDataBuffer + 2)
REPT 3
	ldh a, [c]
	inc c
	ld d, a
	ldh a, [c]
	ld e, a
	ld a, d
	ldh [c], a
	dec c
	ld a, e
	ldh [c], a
	inc c
	inc c
ENDR
	call .update_numbers
	jp .loop

.update_numbers
	hlcoord 8, 1
	ld bc, 11
	ld a, " "
	call ByteFill
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH * 2
	ld [hl], a
	add hl, bc
	ld [hl], a
	add hl, bc
	ld [hl], a
	add hl, bc
	ld [hl], a
	ldh a, [hDebugMenuDataBuffer + 8]
	sub LOW(hDebugMenuDataBuffer)
	hlcoord 1, 1
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, "▶"
	ld [hl], a
	hlcoord 2, 3
	ld de, .basecry
	call PlaceString
	hlcoord 2, 5
	ld de, .pitch
	call PlaceString
	hlcoord 2, 7
	ld de, .length
	call PlaceString
	hlcoord 8, 3
	ld de, hDebugMenuDataBuffer + 2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 8, 5
	ld de, hDebugMenuDataBuffer + 4
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 8, 7
	ld de, hDebugMenuDataBuffer + 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 15, 3
	ld de, hDebugMenuDataBuffer + 2
	ld b, 2
	call PrintHexNum
	hlcoord 15, 5
	ld de, hDebugMenuDataBuffer + 4
	ld b, 2
	call PrintHexNum
	hlcoord 15, 7
	ld de, hDebugMenuDataBuffer + 6
	ld b, 2
	call PrintHexNum
	hlcoord 2, 1
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ldh a, [hDebugMenuDataBuffer]
	cp HIGH(NUM_POKEMON)
	jr c, .show_name
	ldh a, [hDebugMenuDataBuffer + 1]
	cp LOW(NUM_POKEMON) + 1
	ret nc
.show_name
	ldh a, [hDebugMenuDataBuffer]
	ld h, a
	ldh a, [hDebugMenuDataBuffer + 1]
	ld l, a
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 8, 1
	call PlaceString
	ret

.basecry
	string "BASE"
.pitch
	string "PITCH"
.length
	string "LENGTH"

.updateleft
	call .getupdateamt
.leftloop
	dec hl
	dec de
	ld a, d
	or e
	jr nz, .leftloop
	ret

.updateright
	call .getupdateamt
.rightloop
	inc hl
	dec de
	ld a, d
	or e
	jr nz, .rightloop
	ret

.getupdateamt
	ldh a, [hJoyDown]
	and START | SELECT
	and a
	jr z, .neither
	cp START
	jr z, .start
	cp SELECT
	jr z, .select
; both
	ld de, 1000
	ret
.select
	ld de, 10
	ret
.start
	ld de, 100
	ret
.neither
	ld de, 1
	ret

PrintHexNum:
	ld a, [de]
	inc de
	call .print_byte
	dec b
	jr nz, PrintHexNum
	ret

.print_byte
	push af
	swap a
	call .print_digit
	pop af
.print_digit
	and $f
	cp $a
	jr c, .ok
	add "A"
.ok
	add "0"
	ld [hli], a
	ret

Debug_Trainer:
	xor a
	ldh [hDebugMenuDataBuffer], a
	ldh [hDebugMenuDataBuffer + 1], a
	ldh [hDebugMenuCursorPos], a
	hlcoord 0, 0
	lb bc, 6, SCREEN_WIDTH - 2
	call Textbox
	call WaitBGMap2
	call .update_display
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	cp B_BUTTON
	jp z, .end
	cp D_LEFT
	jr z, .left
	cp D_RIGHT
	jr z, .right
	cp A_BUTTON
	jp z, .fight
	and D_UP | D_DOWN
	jr nz, .change
	jr .loop

.change
	ldh a, [hDebugMenuCursorPos]
	inc a
	and 1
	ldh [hDebugMenuCursorPos], a
	call .update_display
	jr .loop

.left
	call .get_value
.left_loop
	dec d
	dec a
	jr nz, .left_loop
	call .put_value
	ldh a, [hDebugMenuCursorPos]
	and a
	call z, .reset_trainer_num
	call .update_display
	jr .loop

.right
	call .get_value
.right_loop
	inc d
	dec a
	jr nz, .right_loop
	call .put_value
	ldh a, [hDebugMenuCursorPos]
	and a
	call z, .reset_trainer_num
	call .update_display
	jr .loop

.reset_trainer_num
	ld a, 1
	ldh [hDebugMenuDataBuffer + 1], a
	ret

.update_display
	hlcoord 1, 2
	ld a, " "
	ld [hl], a
	hlcoord 1, 5
	ld a, " "
	ld [hl], a
	ldh a, [hDebugMenuCursorPos]
	and a
	hlcoord 1, 2
	jr z, .got_cursor_pos
	hlcoord 1, 5
.got_cursor_pos
	ld a, "▶"
	ld [hl], a
	call .update_class
	hlcoord 3, 5
	ld a, " "
	ld bc, 15
	call ByteFill
	call .get_trainer_name
	jr c, .skip_trainer_name
	hlcoord 3, 5
	ld de, wStringBuffer1
	call PlaceString
.skip_trainer_name
	hlcoord 3, 6
	ld de, hDebugMenuDataBuffer + 1
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.update_class
	hlcoord 3, 2
	ld a, " "
	ld bc, 15
	call ByteFill
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	ldh a, [hDebugMenuDataBuffer]
	and a
	jr z, .skip_class_name
	cp NUM_TRAINER_CLASSES
	jr nc, .skip_class_name
	ld [wCurSpecies], a
	ld [wTrainerClass], a
	call GetName
	hlcoord 3, 2
	ld de, wStringBuffer1
	call PlaceString
.skip_class_name
	hlcoord 3, 3
	ld de, hDebugMenuDataBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.fight
	ldh a, [hDebugMenuDataBuffer]
	and a
	jp z, .loop
	cp NUM_TRAINER_CLASSES
	jp nc, .loop
	ld [wOtherTrainerClass], a
	ldh a, [hDebugMenuDataBuffer + 1]
	and a
	jp z, .loop
	ld [wOtherTrainerID], a
	ld a, $1
	ld [wBattleScriptFlags], a
	ld hl, wWinTextPointer
	ld a, LOW(DefaultWinText)
	ld [hli], a
	ld a, HIGH(DefaultWinText)
	ld [hli], a
	ld a, LOW(DefaultLossText)
	ld [hli], a
	ld a, HIGH(DefaultLossText)
	ld [hl], a
	call BufferScreen
	predef StartBattle
	ld a, MAPSETUP_RELOADMAP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	ld hl, wScriptFlags
	res SCRIPT_RUNNING, [hl]
	pop af
	ret

.end
	ret

.get_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add l
	ld l, a
	ld d, [hl]
	ldh a, [hJoyDown]
	and SELECT
	ld a, 1
	ret z
	ld a, 10
	ret

.put_value
	ldh a, [hDebugMenuCursorPos]
	ld hl, hDebugMenuDataBuffer
	add l
	ld l, a
	ld [hl], d
	ret

.cancel_trainer_name
	scf
	ret

.get_trainer_name
	ldh a, [hDebugMenuDataBuffer]
	and a
	jr z, .cancel_trainer_name
	cp NUM_TRAINER_CLASSES
	jr nc, .cancel_trainer_name
	dec a
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	ld a, BANK(TrainerGroups)
	add hl, bc
	call GetFarByte
	push af
	ld a, BANK(TrainerGroups)
	inc hl
	call GetFarHalfword
	pop af
	ld b, a
	ldh a, [hDebugMenuDataBuffer + 1]
	and a
	jr z, .cancel_trainer_name
	dec a
	and a
	jr z, .got_loc
	ld c, a
.trainer_name_loop
	ld a, b
	call GetFarByte
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
	dec c
	jr z, .got_loc
	jr .trainer_name_loop

.got_loc
	inc hl
	ld de, wStringBuffer1
	ld a, b
	ld bc, 18
	call FarCopyBytes
	ld a, "@"
	ld [wStringBuffer2 - 1], a
	ld hl, wStringBuffer1
	ld c, 18
	call Debug_SanitizeString
	and a
	ret

Debug_SanitizeString:
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp $80
	jr nc, .loop
	dec hl
	ld a, "@"
	ld [hl], a
	ret
