ZenGardenGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ZenGardenGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ZEN_GARDEN, 1
	warp_event  5,  0, ZEN_GARDEN, 1
	warp_event  4,  7, VIOLET_CITY, 7
	warp_event  5,  7, VIOLET_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
