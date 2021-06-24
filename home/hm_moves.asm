; HM moves can't be forgotten

IsHM::
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret

IsHMMove::
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .HMMoves
	ld de, 2
	jp IsInHalfwordArray

.HMMoves:
	dw UPROOT
	dw WIND_RIDE
	dw WATER_SPORT
	dw STRONG_ARM
	dw BRIGHT_MOSS
	dw BOUNCE
	dw WHIRLPOOL
	dw -1 ; end
