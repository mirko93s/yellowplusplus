BagClearArea:
	jp ClearScreenArea

BagRestoreFrames:
; Prompts/host callers can overwrite edges. Restore only changed frame cells.
	ld de, BagFrameTilemap
	ld hl, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.cell
	ld a, [de]
	cp ' '
	jr z, .next
	cp [hl]
	jr z, .next
	ld a, [hl]
	cp BAG_UI_TILE_BASE + 14
	jr z, .next ; retain the existing thumb until its position is updated
	ld a, [de]
	ld [hl], a
	push bc
	push de
	push hl
	call BagUploadCell
	pop hl
	pop de
	pop bc
.next
	inc de
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .cell
	ret

BagRefreshContents:
; Header text/counts may change; frame tiles and palettes do not.
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 7, 1
	lb bc, 1, 5
	call BagClearArea
	call BagDrawHeader
	hlcoord 7, 1
	call BagCellAddress
	lb bc, 1, 5
	call BagUploadRectangle
	hlcoord 14, 1
	call BagCellAddress
	lb bc, 1, 5
	call BagUploadRectangle
; fall through
BagRefreshList:
	xor a
	ldh [hAutoBGTransferEnabled], a
	call BagDrawRows
	call BagDrawSelection
	hlcoord 1, 3
	call BagCellAddress
	lb bc, BAG_VISIBLE_ROWS, 18
	call BagUploadRectangle
	call BagUploadDescription
	call BagUpdateThumb
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

BagUpdateSelection:
; No item-name lookups, entry recount, frame redraw, palette upload or delay.
	xor a
	ldh [hAutoBGTransferEnabled], a
	call BagPositionPointers
	ld a, [hl] ; previous cursor row, before saving the new position
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, a
	ld a, [wBagSwapIndex]
	cp b
	ld a, ' '
	jr nz, .erase
	ld a, BAG_UI_TILE_BASE + 16
.erase
	push af
	call BagCursorPointer
	pop af
	ld [hl], a
	call BagUploadCell
	call BagDrawSelection
	call BagCursorPointer
	call BagUploadCell
	call BagUploadDescription
	call BagUpdateThumb
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

BagCursorPointer:
	ld hl, wMenuCursorLocation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BagUploadDescription:
	hlcoord 1, 15
	call BagCellAddress
	lb bc, 2, 18
	jp BagUploadRectangle

BagUpdateThumb:
	hlcoord 19, 3
	ld b, BAG_VISIBLE_ROWS
.find
	ld a, [hl]
	cp BAG_UI_TILE_BASE + 14
	jr z, .erase
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .find
	jr .draw
.erase
	ld [hl], BAG_UI_TILE_BASE + 8
	call BagUploadCell
.draw
	ld a, [wListCount]
	cp BAG_VISIBLE_ROWS + 1
	ret c
	call BagDrawScrollThumb
	jp BagUploadCell

BagUploadCell:
	call BagCellAddress
	lb bc, 1, 1
	jp BagUploadRectangle

MenuUIUploadCursor::
	call BagCursorPointer
	jp BagUploadCell

BagCellAddress:
MenuUICellAddress:
; HL = tilemap cell -> DE = matching hardware cell. Preserve HL.
	push hl
	ld de, wTileMap
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld b, 0
.row
	ld a, l
	sub SCREEN_WIDTH
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	jr c, .column
	inc b
	jr .row
.column
	ld de, SCREEN_WIDTH
	add hl, de
	ld c, l ; column
	ld a, b ; row
	push bc
	ld hl, 0
	ld bc, BG_MAP_WIDTH
	call AddNTimes
	pop bc
	ld b, 0
	add hl, bc
	ldh a, [hAutoBGTransferDest]
	ld e, a
	ldh a, [hAutoBGTransferDest + 1]
	ld d, a
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ret
