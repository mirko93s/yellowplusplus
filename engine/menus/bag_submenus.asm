BagTextBoxBorder::
; Adapter for generic quantity/confirmation/message boxes while Bag is active.
	ld a, [wShopBoxHeight]
	ld b, a
	ld h, d
	ld l, e
; fall through
BagSkinBox:
	push hl
	push bc
	call StandardTextBoxBorder
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
	call MenuUIFixBoxCorners
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

MenuUIFixBoxCorners:
; HL = box origin, B/C = interior height/width. Preserve HL/BC.
; Outer frame posts continue through attached corners, except at screen bottom.
	push hl
	push bc
	call MenuUICellAddress
	pop bc
	ld a, e
	and BG_MAP_WIDTH - 1
	ld [wMenuUIBoxColumn], a
	push hl
	and a
	ld a, 0 ; free top-left
	jr nz, .topLeft
	ld a, 4 ; left frame junction
.topLeft
	call .tile
	ld [hl], a
	ld e, c
	inc e
	ld d, 0
	add hl, de
	ld a, [wMenuUIBoxColumn]
	add c
	inc a
	cp SCREEN_WIDTH - 1
	ld a, 1 ; free top-right
	jr nz, .topRight
	ld a, 5 ; right frame junction
.topRight
	call .tile
	ld [hl], a
	pop hl
	push bc
	ld a, b
	inc a
	ld bc, SCREEN_WIDTH
	call AddNTimes
	pop bc
	ld a, [wMenuUIBoxColumn]
	and a
	ld a, 2 ; terminating bottom-left
	jr nz, .bottomLeft
	call .aboveBottom
	ld a, 2
	jr nc, .bottomLeft
	ld a, 4
.bottomLeft
	call .tile
	ld [hl], a
	ld e, c
	inc e
	ld d, 0
	add hl, de
	ld a, [wMenuUIBoxColumn]
	add c
	inc a
	cp SCREEN_WIDTH - 1
	ld a, 3 ; terminating bottom-right
	jr nz, .bottomRight
	call .aboveBottom
	ld a, 3
	jr nc, .bottomRight
	ld a, 5
.bottomRight
	call .tile
	ld [hl], a
	pop hl
	ret
.aboveBottom
	ld a, h
	cp HIGH(wTileMap + (SCREEN_HEIGHT - 1) * SCREEN_WIDTH)
	ret nz
	ld a, l
	cp LOW(wTileMap + (SCREEN_HEIGHT - 1) * SCREEN_WIDTH)
	ret
.tile
	push hl
	push de
	ld e, a
	ld d, 0
	ld a, [wShopUIActive]
	and a
	ld hl, .bagTiles
	jr z, .lookup
	ld hl, .shopTiles
.lookup
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
.bagTiles
	db $62, $63, $64, $65, $6b, $6c
.shopTiles
	db $6e, $6f, $6b, $6c, $68, $69

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
	hlcoord 6, 9
	lb bc, 3, 14
.upload
	push bc
	call BagCellAddress
	pop bc
	jp BagUploadRectangle
