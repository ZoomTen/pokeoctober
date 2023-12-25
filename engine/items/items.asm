_ReceiveItem::
	call DoesHLEqualNumItems
	jp nz, PutItemInPocket
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets:
; entries correspond to item types
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM

.Item:
	ld h, d
	ld l, e
	jp PutItemInPocket

.KeyItem:
	ld h, d
	ld l, e
	jp ReceiveKeyItem

.Ball:
	ld hl, wNumBalls
	jp PutItemInPocketLow

.TMHM:
	ret

_TossItem::
	call DoesHLEqualNumItems
	jr nz, .remove
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets:
; entries correspond to item types
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM

.Ball:
	ld hl, wNumBalls
	jp RemoveItemFromPocketLow

.TMHM:
	ret

.KeyItem:
	ld h, d
	ld l, e
	jp TossKeyItem

.Item:
	ld h, d
	ld l, e

.remove
	jp RemoveItemFromPocket

_CheckItem::
	call DoesHLEqualNumItems
	jr nz, .nope
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets:
; entries correspond to item types
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM

.Ball:
	ld hl, wNumBalls
	jp CheckTheItemLow

.TMHM:
	ret

.KeyItem:
	ld h, d
	ld l, e
	jp CheckKeyItems

.Item:
	ld h, d
	ld l, e

.nope
	jp CheckTheItem

DoesHLEqualNumItems:
	ld a, l
	cp LOW(wNumItems)
	ret nz
	ld a, h
	cp HIGH(wNumItems)
	ret

GetPocketCapacity:
	ld c, MAX_ITEMS
	ld a, e
	cp LOW(wNumItems)
	jr nz, .not_bag
	ld a, d
	cp HIGH(wNumItems)
	ret z

.not_bag
	ld c, MAX_PC_ITEMS
	ld a, e
	cp LOW(wNumPCItems)
	jr nz, .not_pc
	ld a, d
	cp HIGH(wNumPCItems)
	ret z

.not_pc
	ld c, MAX_BALLS
	ret

PutItemInPocket:
	ld d, h
	ld e, l
	inc hl
	push hl
		ld a, [wCurItem]
		call GetItemIndexFromID
		ld c, l
		ld b, h
	pop hl
	push de
	ld d, 0
	dec hl
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp b
	jr nz, .next_inc_one
	ld a, [hli]
	cp c
	jr nz, .loop
	ld a, MAX_ITEM_STACK
	sub [hl]
	add d
	ld d, a
	ld a, [wItemQuantityChangeBuffer]
	cp d
	jr z, .ok_pop
	jr c, .ok_pop
	jr .loop

.next_inc_one
	inc hl
	jr .loop

.terminator
	pop de
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret

.ok_pop
	pop de
.ok
	ld h, d
	ld l, e
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld c, l
		ld b, h
	pop hl
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp b
	jr nz, .next2_inc_one
	ld a, [hli]
	cp c
	jr nz, .loop2
	ld a, [wItemQuantityBuffer]
	add [hl]
	cp MAX_ITEM_STACK + 1
	jr nc, .newstack
	ld [hl], a
	jr .done

.next2_inc_one
	inc hl
	jr .loop2

.newstack
	ld [hl], MAX_ITEM_STACK
	sub MAX_ITEM_STACK
	ld [wItemQuantityBuffer], a
	jr .loop2

.terminator2
	dec hl
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld b, h
		ld c, l
	pop hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wItemQuantityBuffer]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret

PutItemInPocketLow:
	ld d, h
	ld e, l
	inc hl
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld c, l
	pop hl
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp c
	jr nz, .next
	ld a, 99
	sub [hl]
	add b
	ld b, a
	ld a, [wItemQuantityChangeBuffer]
	cp b
	jr z, .ok
	jr c, .ok

.next
	inc hl
	jr .loop

.terminator
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret

.ok
	ld h, d
	ld l, e
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld c, l
	pop hl
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp c
	jr nz, .loop2
	ld a, [wItemQuantityBuffer]
	add [hl]
	cp 100
	jr nc, .newstack
	ld [hl], a
	jr .done

.newstack
	ld [hl], 99
	sub 99
	ld [wItemQuantityBuffer], a
	jr .loop2

.terminator2
	dec hl
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld [hli], a
	ld a, [wItemQuantityBuffer]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret

RemoveItemFromPocketLow:
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [wCurItemQuantity]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	cp [hl]
	inc hl
	jr z, .skip
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .skip
	cp -1
	jr z, .nope
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	and a
	jr nz, .yup
	dec hl
	ld b, h
	ld c, l
	inc hl
	inc hl
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret

RemoveItemFromPocket:
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [wCurItemQuantity]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld b, h
		ld c, l
	pop hl
	ld a, b
	cp [hl]
	inc hl
	inc hl
	jr nz, .nope1
	dec hl
	ld a, c
	cp [hl]
	inc hl
	jr z, .skip

.nope1
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld b, h
		ld c, l
	pop hl
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	inc hl
	jr nz, .nope2
	dec hl
	ld a, [hli]
	cp c
	jr z, .skip

.nope2
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	and a
	jr nz, .yup
	dec hl
	dec hl
	ld b, h
	ld c, l
	inc hl
	inc hl
	inc hl
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret

CheckTheItemLow:
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld c, a
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	scf
	ret

.done
	and a
	ret

CheckTheItem:
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld b, h
		ld c, l
	pop hl
	inc hl
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr nz, .inc2
	ld a, [hli]
	cp c
	jr nz, .inc1
	scf
	ret

.inc2
	inc hl
.inc1
	inc hl
	jr .loop

.done
	and a
	ret

ReceiveKeyItem:
	ld hl, wNumKeyItems
	ld a, [hli]
	cp MAX_KEY_ITEMS
	jr nc, .nope
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld [hli], a
	ld [hl], -1
	ld hl, wNumKeyItems
	inc [hl]
	scf
	ret

.nope
	and a
	ret

TossKeyItem:
	ld a, [wCurItemQuantity]
	ld e, a
	ld d, 0
	ld hl, wNumKeyItems
	ld a, [hl]
	cp e
	jr nc, .ok
	call .Toss
	ret nc
	jr .ok2

.ok
	dec [hl]
	inc hl
	add hl, de

.ok2
	ld d, h
	ld e, l
	inc hl
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp -1
	jr nz, .loop
	scf
	ret

.Toss:
	ld hl, wNumKeyItems
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld c, a
.loop3
	inc hl
	ld a, [hl]
	cp c
	jr z, .ok3
	cp -1
	jr nz, .loop3
	xor a
	ret

.ok3
	ld a, [wNumKeyItems]
	dec a
	ld [wNumKeyItems], a
	scf
	ret

CheckKeyItems:
	ld a, [wCurItem]
	push hl
		call GetItemIndexFromID
		ld a, l
	pop hl
	ld c, a
	ld hl, wKeyItems
.loop
	ld a, [hli]
	cp c
	jr z, .done
	cp -1
	jr nz, .loop
	and a
	ret

.done
	scf
	ret

_CheckTossableItem::
; Return 1 in wItemAttributeParamBuffer and carry if wCurItem can't be removed from the bag.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit CANT_TOSS_F, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckSelectableItem:
; Return 1 in wItemAttributeParamBuffer and carry if wCurItem can't be selected.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit CANT_SELECT_F, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckItemPocket::
; Return the pocket for wCurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_POCKET
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret

CheckItemContext:
; Return the context for wCurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret

CheckItemMenu:
; Return the menu for wCurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	swap a
	and $f
	ld [wItemAttributeParamBuffer], a
	ret

GetItemAttr:
; Get attribute a of wCurItem.

	push hl
	push bc

	push af
		xor a
		ld [wItemAttributeParamBuffer], a

		ld a, [wCurItem]
		call GetItemIndexFromID

		ld b, h
		ld c, l

		ld a, BANK(ItemAttributes)
		ld hl, ItemAttributes
		call LoadIndirectPointer
	pop af

	ld b, 0
	ld c, a
	add hl, bc ; offset attribute

	ld a, BANK(ItemAttributes)
	call GetFarByte

	pop bc
	pop hl
	ret

ItemAttr_ReturnCarry:
	ld a, 1
	ld [wItemAttributeParamBuffer], a
	scf
	ret

GetItemPrice:
; Return the price of wCurItem in de.
	push hl
	push bc
	ld a, ITEMATTR_PRICE
	call GetItemAttr
	ld e, a
	ld a, ITEMATTR_PRICE_HI
	call GetItemAttr
	ld d, a
	pop bc
	pop hl
	ret

GetItemAsTMHMPrice:
	push hl
	push bc
	ld hl, TMHMPrices
	call .get_byte
	ld e, a
	ld hl, TMHMPrices + 1
	call .get_byte
	ld d, a
	pop bc
	pop hl
	ret

.get_byte
	ld a, [wCurItem]
	dec a
	ld c, a
	ld b, 0
	ld a, 2
	call AddNTimes
	ld a, BANK(TMHMPrices)
	call GetFarByte
	ret
