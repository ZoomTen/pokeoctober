; Syntactic sugar macros

lb: MACRO ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

ln: MACRO ; r, hi, lo
	ld \1, ((\2) & $f) << 4 | ((\3) & $f)
ENDM

ldpixel: MACRO
if _NARG >= 5
	lb \1, \2 * 8 + \4, \3 * 8 + \5
else
	lb \1, \2 * 8, \3 * 8
endc
ENDM

depixel EQUS "ldpixel de,"
bcpixel EQUS "ldpixel bc,"

; Design patterns

jumptable: MACRO
	ld a, [\2]
	ld e, a
	ld d, 0
	ld hl, \1
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
ENDM

maskbits: MACRO
; masks just enough bits to cover the first argument
; the second argument is an optional shift amount
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; and "maskbits 3, 2" becomes "and %00001100" (since "maskbits 3" becomes %00000011)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 26
; 	cp 26
; 	jr nc, .loop
x = 1
rept 8
if x + 1 < (\1)
x = x << 1 | 1
endc
endr
if _NARG == 2
	and x << (\2)
else
	and x
endc
ENDM

calc_sine_wave: MACRO
; input: a = a signed 6-bit value
; output: a = d * sin(a * pi/32)
	and %111111
	cp  %100000
	jr nc, .negative\@
	call .apply\@
	ld a, h
	ret
.negative\@
	and %011111
	call .apply\@
	ld a, h
	xor $ff
	inc a
	ret
.apply\@
	ld e, a
	ld a, d
	ld d, 0
if _NARG == 1
	ld hl, \1
else
	ld hl, .sinetable\@
endc
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.multiply\@ ; factor amplitude
	srl a
	jr nc, .even\@
	add hl, de
.even\@
	sla e
	rl d
	and a
	jr nz, .multiply\@
	ret
if _NARG == 0
.sinetable\@
	sine_table 32
endc
ENDM

smartcp: MACRO
IF \1 == 0
	and a
ELSE
	cp \1
ENDC
ENDM

cphl16: MACRO
; arg1: 16 bit register
; arg2: value to compare to
	ld a, h
	smartcp HIGH(\1)
	jr c, .done\@
	jr nz, .done\@
	ld a, l
	smartcp LOW(\1)
.done\@
ENDM
