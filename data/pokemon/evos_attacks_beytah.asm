SECTION "Evolutions and Attacks 3", ROMX

EvosAttacksPointers3::
	dw CoinpurEvosAttacks
	dw KatuEvosAttacks
	dw AdbarstorkEvosAttacks

CoinpurEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, MEOWTH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, BITE
	dbw 13, PAY_DAY
	dbw 19, FURY_SWIPES
	dbw 25, FAINT_ATTACK
	dbw 31, COIN_HURL
	dbw 37, SCREECH
	dbw 43, SLASH
	db 0 ; no more level-up moves
	
KatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, CONFUSION
	dbw 5, NIGHT_SHADE
	dbw 10, NIGHT_SHADE
	dbw 20, TELEPORT
	dbw 26, QUICK_ATTACK
	dbw 30, PSYBEAM
	dbw 35, PURSUIT
	dbw 40, FUTURE_SIGHT
	dbw 45, CONFUSE_RAY
	dbw 50, WING_ATTACK ; put Synchronoise in this slot for final
	dbw 53, DRILL_PECK
	dbw 61, PSYCHIC_M
	db 0 ; no more level-up moves
	
AdbarstorkEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 5, GROWL
	dbw 9, FURY_ATTACK
	dbw 12, WHIRLWIND
	dbw 19, TWISTER
	dbw 25, WING_ATTACK
	dbw 31, SCREECH
	dbw 39, MIRROR_MOVE
	dbw 45, DRILL_PECK
	dbw 52, FLY
	db 0 ; no more level-up moves
