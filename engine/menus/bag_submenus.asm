BagSkinBox:
; Pack-only border; shared TextBoxBorder remains unchanged.
	push hl
	push bc
	call TextBoxBorder
	pop bc
	pop hl
	push hl
	push bc
	ld a, BAG_UI_TILE_BASE
	ld [hli], a
	push bc
	ld a, BAG_UI_TILE_BASE + 4
.top
	ld [hli], a
	dec c
	jr nz, .top
	ld [hl], BAG_UI_TILE_BASE + 1
	pop bc
	ld a, SCREEN_WIDTH - 1
	sub c
	ld e, a
	ld d, 0
	add hl, de
.middle
	ld [hl], BAG_UI_TILE_BASE + 7
	push hl
	ld e, c
	inc e
	ld d, 0
	add hl, de
	ld [hl], BAG_UI_TILE_BASE + 8
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .middle
	ld [hl], BAG_UI_TILE_BASE + 2
	inc hl
	ld a, BAG_UI_TILE_BASE + 5
.bottom
	ld [hli], a
	dec c
	jr nz, .bottom
	ld [hl], BAG_UI_TILE_BASE + 3
	pop bc
	pop hl
	push bc
	push hl
	call BagCellAddress
	pop hl
	pop bc
	inc b
	inc b
	inc c
	inc c
	jp BagUploadRectangle

BagActionCursor:
	hlcoord 13, 10
	ld a, [wCurrentMenuItem]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], BAG_UI_TILE_BASE + 15
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	jp BagUploadCell

BagActionInput:
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	bit BIT_A_BUTTON, a
	jr nz, .choose
	and D_UP | D_DOWN
	jr z, BagActionInput
	ld a, [wMaxMenuItem]
	and a
	jr z, BagActionInput
	call BagCursorPointer
	ld [hl], ' '
	call BagUploadCell
	ld a, [wCurrentMenuItem]
	xor 1
	ld [wCurrentMenuItem], a
	call BagActionCursor
	jr BagActionInput
.choose
	ld a, [wCurrentMenuItem]
	and a
	ret
.cancel
	scf
	ret

BagUploadQuantityBox:
	hlcoord 13, 9
	lb bc, 3, 6
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .upload
	hlcoord 5, 9
	lb bc, 3, 14
.upload
	push bc
	call BagCellAddress
	pop bc
	jp BagUploadRectangle
