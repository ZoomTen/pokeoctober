CherrygrovePagoda5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

; scripts here

CherrygrovePagoda5F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, CHERRYGROVE_PAGODA_4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
