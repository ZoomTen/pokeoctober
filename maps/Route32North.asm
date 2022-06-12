	object_const_def ; object_event constants
	const ROUTE32NORTH_LASS

Route32North_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

TrainerLassTina:
	trainer LASS, TINA, EVENT_BEAT_LASS_TINA, .Seen, .Beat, 0, .PostScript

.Seen:
	text "H-Hey! Have you"
	line "seen my little"
	cont "brother?!"
	done

.Beat:
	text "Answer me!"
	done

.PostScript:
	checkevent EVENT_BEAT_FLEDGLING_TIMOTHY
	iftrue .LassTinaFetchesTim
	jumptextfaceplayer .PostBattleTxt

.LassTinaFetchesTim:
	faceplayer
	opentext
	writetext .FetchTimTxt
	waitbutton
	closetext
	applymovement ROUTE32NORTH_LASS, .LassGoesNorthMovement
	setevent EVENT_TALKED_TO_LASS_TINA
	disappear ROUTE32NORTH_LASS
	end

.PostBattleTxt:
	text "Normally I wouldn't"
	line "be so upset over"
	para "my brother going"
	line "missing, but I"
	para "heard there's some"
	line "criminals on the"
	cont "loose<...>"
	para "Please let me know"
	line "if you find him!"
	done

.FetchTimTxt:
	text "You've seen some-"
	line "one looking for"
	cont "his sister?"
	para "That must be my"
	line "brother!"
	para "<...>"
	para "What? He's in the"
	line "SPROUT TOWER?"
	para "Thanks, I'll go"
	line "get him now!"
	done

.LassGoesNorthMovement:
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	step_end

Route32North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 12, DREAD_WOODS, 1
	warp_event  2, 13, DREAD_WOODS, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassTina, EVENT_TALKED_TO_LASS_TINA

