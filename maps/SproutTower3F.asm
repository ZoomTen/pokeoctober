SproutTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

; scripts here

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
