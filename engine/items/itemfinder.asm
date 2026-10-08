HiddenItemNear:
	ld hl, HiddenItemCoords
	ld b, 0
.loop
	ld de, 3
	ld a, [wCurMap]
	call IsInRestOfArray
	ret nc ; return if current map has no hidden items
	push bc
	push hl
	ld hl, wObtainedHiddenItemsFlags
	ld c, b
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop hl
	pop bc
	inc b
	and a
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	jr nz, .loop ; if the item has already been obtained
; check if the item is within 4-5 tiles (depending on the direction of item)
	ld a, [wYCoord]
	call Sub5ClampTo0
	cp d
	jr z, .y_zflag
	jr nc, .loop
.y_zflag
	ld a, [wYCoord]
	add 4
	cp d
	jr c, .loop
	ld a, [wXCoord]
	call Sub5ClampTo0
	cp e
	jr z, .x_zflag
	jr nc, .loop
.x_zflag
	ld a, [wXCoord]
	add 5
	cp e
	jr c, .loop
	call GetItemFinderFacing
	scf
	ret

Sub5ClampTo0:
; subtract 5 but clamp to 0
	sub 4
	cp $f0
	ret c
	xor a
	ret

; d/e are the hidden item's y/x coordinates. Prefer the vertical axis on ties.
; A zero direction means the player is standing on the item.
GetItemFinderFacing:
	ld bc, 0
	ld a, [wYCoord]
	sub d
	jr nc, .yDistance
	cpl
	inc a
	inc b
.yDistance
	ld d, a
	ld a, [wXCoord]
	sub e
	jr nc, .xDistance
	cpl
	inc a
	inc c
.xDistance
	ld e, a
	or d
	jr z, .done
	ld a, d
	cp e
	jr nc, .vertical
	ld a, c
	and a
	ld a, PLAYER_DIR_LEFT
	jr z, .done
	ld a, PLAYER_DIR_RIGHT
	jr .done
.vertical
	ld a, b
	and a
	ld a, PLAYER_DIR_UP
	jr z, .done
	ld a, PLAYER_DIR_DOWN
.done
	ld [wItemFinderItemDirection], a
	ret
