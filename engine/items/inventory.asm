; Four-pocket inventory. The legacy wNumBagItems label is the bag token.
; Public add/remove routines preserve BC, DE, HL and wItemQuantity.

GetItemPocket::
; A = item ID. A = pocket or $ff. Preserve BC, DE, HL.
	push bc
	push hl
	ld c, a
	cp HM01
	jr c, .ordinary
	cp TM01 + NUM_TMS
	jr nc, .invalid
	ld a, TMHM_POCKET
	jr .done
.ordinary
	and a
	jr z, .invalid
	cp NUM_ITEMS + 1
	jr nc, .invalid
	ld b, 0
	ld hl, ItemPocketTable
	add hl, bc
	ld a, [hl]
	jr .done
.invalid
	ld a, $ff
.done
	pop hl
	pop bc
	ret

KeyItemIDs:
	db TOWN_MAP, BICYCLE, OLD_AMBER, DOME_FOSSIL, HELIX_FOSSIL
	db SECRET_KEY, BIKE_VOUCHER, CARD_KEY, S_S_TICKET, GOLD_TEETH
	db COIN_CASE, OAKS_PARCEL, ITEMFINDER, SILPH_SCOPE, POKE_FLUTE
	db LIFT_KEY, EXP_ALL, OLD_ROD, GOOD_ROD, SUPER_ROD
KeyItemIDsEnd:
	ASSERT KeyItemIDsEnd - KeyItemIDs == NUM_BAG_KEY_ITEMS

ItemPocketTable:
FOR item, 0, NUM_ITEMS + 1
	IF item >= MASTER_BALL && item <= POKE_BALL
		db BALLS_POCKET
	ELIF item == TOWN_MAP || item == BICYCLE || item == OLD_AMBER || item == DOME_FOSSIL || item == HELIX_FOSSIL || item == SECRET_KEY || item == BIKE_VOUCHER || item == CARD_KEY || item == S_S_TICKET || item == GOLD_TEETH || item == COIN_CASE || item == OAKS_PARCEL || item == ITEMFINDER || item == SILPH_SCOPE || item == POKE_FLUTE || item == LIFT_KEY || item == EXP_ALL || item == OLD_ROD || item == GOOD_ROD || item == SUPER_ROD
		db KEY_POCKET
	ELIF item == NO_ITEM || item == SURFBOARD || item == SAFARI_BALL || item == POKEDEX || (item >= BOULDERBADGE && item <= EARTHBADGE) || item == COIN
		db $ff
	ELSE
		db ITEMS_POCKET
	ENDC
ENDR

GetOwnershipBit::
; A = valid key/machine ID. HL = ownership byte, B = bit mask,
; C = logical bit index. Carry if valid. Clobbers DE.
	ld e, a
	call GetItemPocket
	cp KEY_POCKET
	jr z, .key
	cp TMHM_POCKET
	jr nz, .invalid
	ld a, e
	cp TM01
	jr c, .hm
	sub TM01
	jr .machine
.hm
	sub HM01
	add NUM_TMS
.machine
	ld c, a
	ld hl, wOwnedTMHMs
	jr GetOwnershipBitByIndex
.key
	ld hl, KeyItemIDs
	ld c, 0
.keyLoop
	ld a, [hli]
	cp e
	jr z, .foundKey
	inc c
	ld a, c
	cp NUM_BAG_KEY_ITEMS
	jr c, .keyLoop
.invalid
	and a
	ret
.foundKey
	ld hl, wOwnedKeyItems
GetOwnershipBitByIndex::
; HL = bitfield base, C = logical index. Preserve C; return HL/B, carry.
	ld a, c
	and 7
	ld b, 1
	jr z, .byte
.shift
	sla b
	dec a
	jr nz, .shift
.byte
	ld a, c
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	add hl, de
	scf
	ret

BagIsProtected::
; Preserve original Master Ball protection independently of its pocket.
	ld a, [wCurItem]
	cp MASTER_BALL
	jr z, .protected
	call GetItemPocket
	cp KEY_POCKET
	jr z, .protected
	cp TMHM_POCKET
	jr z, .protected
	cp $ff
	jr z, .protected
	xor a
	ld [wIsKeyItem], a
	ret
.protected
	ld a, 1
	ld [wIsKeyItem], a
	ret

GetPocketStackPointer::
; A = ITEMS_POCKET or BALLS_POCKET. HL = count, D = capacity.
	ld hl, wNumItems
	ld d, BAG_ITEM_CAPACITY
	cp BALLS_POCKET
	ret nz
	ld hl, wNumBalls
	ld d, BALL_ITEM_CAPACITY
	ret

AddItemToInventory_::
	push bc
	push de
	push hl
	ld a, [wItemQuantity]
	push af
	and a
	jp z, .failure
	ld a, [wCurItem]
	call GetItemPocket
	cp $ff
	jp z, .failure
	cp KEY_POCKET
	jr nc, .ownership
	call GetPocketStackPointer
; Preflight: any free slot can hold the entire request. Otherwise check
; space across matching stacks without mutating them.
	ld a, [hl]
	cp d
	jr c, .insert
	ld c, a
	ld a, [wItemQuantity]
	ld b, a
	push hl
	inc hl
.preflight
	ld a, [wCurItem]
	cp [hl]
	inc hl
	jr nz, .preflightNext
	ld a, [hl]
	cpl
	cp b
	jr nc, .preflightOK
	ld e, a
	ld a, b
	sub e
	ld b, a
.preflightNext
	inc hl
	dec c
	jr nz, .preflight
	pop hl
	jp .failure
.preflightOK
	pop hl
.insert
	push hl
	ld c, [hl]
	inc hl
	ld a, [wItemQuantity]
	ld b, a
	ld a, c
	and a
	jr z, .append
.fillLoop
	ld a, [wCurItem]
	cp [hl]
	inc hl
	jr nz, .fillNext
	ld a, [hl]
	cpl
	cp b
	jr nc, .fits
	ld e, a
	ld a, b
	sub e
	ld b, a
	ld [hl], MAX_ITEM_STACK
.fillNext
	inc hl
	dec c
	jr nz, .fillLoop
.append
	ld a, [wCurItem]
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hl], $ff
	pop hl
	inc [hl]
	jr .success
.fits
	ld a, [hl]
	add b
	ld [hl], a
	pop hl
	jr .success
.ownership
	ld a, [wCurItem]
	call GetOwnershipBit
	jr nc, .failure
	ld a, [hl]
	or b
	ld [hl], a
.success
	pop bc
	ld a, b
	ld [wItemQuantity], a
	pop hl
	pop de
	pop bc
	scf
	ret
.failure
	pop bc
	ld a, b
	ld [wItemQuantity], a
	pop hl
	pop de
	pop bc
	and a
	ret

RemoveItemFromInventory_::
	push bc
	push de
	push hl
	ld a, [wCurItem]
	call GetItemPocket
	cp KEY_POCKET
	jp z, .key
	cp TMHM_POCKET
	jp nc, .done ; machines are never removed
	call GetPocketStackPointer
; Use the stable selected stack only when its ID still matches.
	ld a, [wBagSelectedItem]
	ld b, a
	ld a, [wCurItem]
	cp b
	jr nz, .find
	ld a, [wBagSelectedIndex]
	cp [hl]
	jr nc, .find
	ld c, a
	push hl
	call GetStackEntry
	ld a, [wCurItem]
	cp [hl]
	pop hl
	jr z, .remove
.find
	push hl
	ld b, [hl]
	inc hl
	ld c, 0
.findLoop
	ld a, b
	and a
	jr z, .notFound
	ld a, [wCurItem]
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	inc c
	dec b
	jr .findLoop
.notFound
	pop hl
	jr .done
.found
	pop hl
.remove
	ld a, c
	cp [hl]
	jr nc, .done
	push hl
	call GetStackEntry
	inc hl
	ld a, [wItemQuantity]
	ld e, a
	and a
	jr z, .unchanged
	ld a, [hl]
	sub e
	jr c, .unchanged
	ld [hl], a
	ld [wMaxItemQuantity], a
	and a
	jr nz, .unchanged
	dec hl
	ld d, h
	ld e, l
	inc hl
	inc hl
; Copy pairs; $ff in a quantity must never terminate compaction.
.compact
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr z, .compacted
	ld a, [hli]
	ld [de], a
	inc de
	jr .compact
.compacted
	pop hl
	dec [hl]
	ld a, [hl]
	ld [wListCount], a
; The Bag owns separate per-pocket state and clamps it on the next redraw.
	jr .done
.unchanged
	pop hl
	jr .done
.key
	ld a, [wCurItem]
	call GetOwnershipBit
	jr nc, .done
	ld a, b
	cpl
	and [hl]
	ld [hl], a
.done
	pop hl
	pop de
	pop bc
	ret

GetStackEntry::
; HL = count byte, C = zero-based stack index. Preserve C.
	ld a, c
	add a
	inc a
	ld e, a
	ld d, 0
	add hl, de
	ret

BagQuantity_::
; wTempByteValue = ID -> first matching quantity or 0/1 ownership.
	push de
	push hl
	ld a, [wTempByteValue]
	ld e, a
	call GetItemPocket
	cp $ff
	jr z, .absent
	cp KEY_POCKET
	jr nc, .ownership
	call GetPocketStackPointer
	ld b, [hl]
	inc hl
.loop
	ld a, b
	and a
	jr z, .absent
	ld a, [hli]
	cp e
	jr z, .found
	inc hl
	dec b
	jr .loop
.found
	ld b, [hl]
	jr .done
.ownership
	ld a, e
	call GetOwnershipBit
	jr nc, .absent
	ld a, [hl]
	and b
	jr z, .absent
	ld b, 1
	jr .done
.absent
	ld b, 0
.done
	ld a, b
	ld [wTempByteValue], a
	pop hl
	pop de
	ret

RemoveBagItemByID_::
	ldh a, [hItemToRemoveID]
	ld [wCurItem], a
	ld [wBagSelectedItem], a
	ld a, $ff
	ld [wBagSelectedIndex], a
	ld a, 1
	ld [wItemQuantity], a
	ld hl, wNumItems
	jp RemoveItemFromInventory_

InitializePocketBag_::
	xor a
	ld [wNumItems], a
	ld [wNumBalls], a
	ld hl, wOwnedKeyItems
	ld bc, (NUM_BAG_KEY_ITEMS + 7) / 8 + (NUM_TM_HM + 7) / 8
	call FillMemory
	ld hl, wBagPocket
	ld bc, wShopBoxHeight - wBagPocket + 1
	xor a
	call FillMemory
	ld a, $ff
	ld [wItems], a
	ld [wBalls], a
	ld [wBagSwapIndex], a
	ld [wBagSelectedIndex], a
	ret
