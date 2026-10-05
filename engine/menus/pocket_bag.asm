; Pack is a dedicated 20x18-tile menu. Generic PC/mart lists remain unchanged.
DisplayPocketBag::
	ld a, [wBagUIActive]
	and a
	jr nz, .spritesSaved
	ld a, [wUpdateSpritesEnabled]
	ld [wBagUISavedSpriteState], a
.spritesSaved
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, [wStatusFlags5]
	push af
	set 6, a ; Pack text is always immediate, regardless of dialogue speed
	ld [wStatusFlags5], a
	ld a, [wBagUIActive]
	and a
	jr nz, .resume
	call GBPalWhiteOut
	call LoadTextBoxTilePatterns
	call ClearSprites
	ld a, 1
	ld [wBagUIActive], a
	call BagLoadUITiles
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld hl, ItemPrices
	ld a, l
	ld [wItemPrices], a
	ld a, h
	ld [wItemPrices + 1], a
	ld a, [wBagPocket]
	and NUM_BAG_POCKETS - 1
	ld [wBagPocket], a
	ld a, $ff
	ld [wBagSwapIndex], a
	ld a, 1
	ldh [hJoy7], a
.redraw
	call BagCountEntries
	call BagRestorePosition
	call BagDraw
	jr .wait
.resume
	call BagRestoreFrames
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, 1
	ldh [hJoy7], a
	ld a, $ff
	ld [wBagSwapIndex], a
.refresh
	call BagCountEntries
	call BagRestorePosition
	call BagRefreshContents
.wait
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jp nz, .cancel
	; Pocket navigation uses press edges; vertical movement retains key repeat.
	ldh a, [hJoyPressed]
	bit BIT_D_LEFT, a
	jr nz, .left
	bit BIT_D_RIGHT, a
	jr nz, .right
	ldh a, [hJoy5]
	bit BIT_D_UP, a
	jr nz, .up
	bit BIT_D_DOWN, a
	jr nz, .down
	bit BIT_SELECT, a
	jp nz, .swap
	bit BIT_A_BUTTON, a
	jp nz, .select
	jr .wait
.left
	ld a, [wBagPocket]
	dec a
	jr .switch
.right
	ld a, [wBagPocket]
	inc a
.switch
	and NUM_BAG_POCKETS - 1
	ld [wBagPocket], a
	ld a, $ff
	ld [wBagSwapIndex], a
	ld a, SFX_PRESS_AB
	call PlaySound
	call BagCountEntries
	call BagRestorePosition
	call BagRefreshContents
	farcall UpdateBagUIPalettes
	jp .wait
.up
	ld a, [wCurrentMenuItem]
	and a
	jr z, .scrollUp
	dec a
	ld [wCurrentMenuItem], a
	jr .moved
.scrollUp
	ld hl, wListScrollOffset
	ld a, [hl]
	and a
	jr z, .wait
	dec [hl]
	jr .scrolled
.down
	call BagSelectedOrdinal
	ld b, a
	ld a, [wListCount]
	and a
	jr z, .wait
	dec a
	cp b
	jr z, .wait
	jr c, .wait
	ld a, [wCurrentMenuItem]
	cp BAG_VISIBLE_ROWS - 1
	jr z, .scrollDown
	inc a
	ld [wCurrentMenuItem], a
	jr .moved
.scrollDown
	ld hl, wListScrollOffset
	inc [hl]
.scrolled
	call BagRefreshList
	call BagSavePosition
	jp .wait
.moved
	call BagUpdateSelection
	call BagSavePosition
	jp .wait
.select
	call BagSelectedOrdinal
	call BagResolveEntry
	cp $ff
	jp z, .wait
	ld [wBagSelectedItem], a
	ld a, [wWhichPokemon]
	ld [wBagSelectedIndex], a
	ld a, [wBagContext]
	cp BAG_CONTEXT_SELL
	jr c, .chosen
	ld a, [wBagPocket]
	cp KEY_POCKET
	jp nc, .wait ; ownership pockets cannot be sold/deposited
.chosen
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyToStringBuffer
	call GetItemPrice
	call BagSavePosition
	ld hl, wMenuCursorLocation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], BAG_UI_TILE_BASE + 16
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	xor a
	ldh [hJoy7], a
	ld a, $ff
	ld [wBagSwapIndex], a
	ld a, [wBagContext]
	cp BAG_CONTEXT_BATTLE
	call z, ClosePocketBagUI
	pop af
	ld [wStatusFlags5], a
	and a
	ret
.swap
	ld a, [wBagPocket]
	cp KEY_POCKET
	jp nc, .wait
	call BagSelectedOrdinal
	ld b, a
	ld a, [wListCount]
	cp b
	jp z, .wait
	ld a, [wBagSwapIndex]
	cp $ff
	jr nz, .finishSwap
	ld a, b
	ld [wBagSwapIndex], a
	jp .refresh
.finishSwap
	cp b
	jr z, .endSwap
	ld c, a
	push bc
	ld a, [wBagPocket]
	call GetPocketStackPointer
	call GetStackEntry
	pop bc
	push hl
	push bc
	ld c, b
	ld a, [wBagPocket]
	call GetPocketStackPointer
	call GetStackEntry
	ld d, h
	ld e, l
	pop bc
	pop hl ; HL = source, DE = destination
	ld a, [de]
	cp [hl]
	jr z, .merge
	ld a, [de]
	ld b, a
	ld a, [hl]
	ld [de], a
	ld [hl], b
	inc de
	inc hl
	ld a, [de]
	ld b, a
	ld a, [hl]
	ld [de], a
	ld [hl], b
	jr .endSwap
.merge
	inc hl
	inc de
	ld a, [de]
	add [hl]
	jr c, .overflow
	ld [de], a
; Remove the source stack using the shared pair-safe compactor.
	ld a, [hl]
	ld [wItemQuantity], a
	dec hl
	ld a, [hl]
	ld [wCurItem], a
	ld [wBagSelectedItem], a
	ld a, [wBagSwapIndex]
	ld [wBagSelectedIndex], a
	ld a, [wBagPocket]
	call GetPocketStackPointer
	call RemoveItemFromInventory_
	jr .endSwap
.overflow
	inc a ; wrapped sum + 1 = remainder after filling destination to 255
	ld [hl], a
	ld a, MAX_ITEM_STACK
	ld [de], a
.endSwap
	ld a, $ff
	ld [wBagSwapIndex], a
	jp .refresh
.cancel
	call BagSavePosition
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	xor a
	ldh [hJoy7], a
	ld a, $ff
	ld [wBagSwapIndex], a
	call ClosePocketBagUI
	pop af
	ld [wStatusFlags5], a
	scf
	ret

BagPocketCapacity:
	ld a, [wBagPocket]
	ld hl, .capacities
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ret
.capacities
	db BAG_ITEM_CAPACITY, BALL_ITEM_CAPACITY, NUM_BAG_KEY_ITEMS, NUM_TM_HM

BagPositionPointers:
	ld a, [wBagPocket]
	ld e, a
	ld d, 0
	ld hl, wBagPocketCursor
	add hl, de
	ret

BagRestorePosition:
	call BagPositionPointers
	ld a, [hl]
	ld [wCurrentMenuItem], a
	ld de, NUM_BAG_POCKETS
	add hl, de
	ld a, [hl]
	ld [wListScrollOffset], a
; Empty pockets have no selectable row; otherwise clamp to the last item.
	ld a, [wListCount]
	and a
	jr nz, .nonempty
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	jr BagSavePosition
.nonempty
	call BagSelectedOrdinal
	ld b, a
	ld a, [wListCount]
	dec a
	cp b
	jr nc, .row
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jr c, .cursor
	ld a, b
	ld [wListScrollOffset], a
.cursor
	ld a, [wListScrollOffset]
	ld c, a
	ld a, b
	sub c
	ld [wCurrentMenuItem], a
.row
	ld a, [wCurrentMenuItem]
	cp BAG_VISIBLE_ROWS
	jr c, BagSavePosition
	ld a, BAG_VISIBLE_ROWS - 1
	ld [wCurrentMenuItem], a
BagSavePosition:
	call BagPositionPointers
	ld a, [wCurrentMenuItem]
	ld [hl], a
	ld de, NUM_BAG_POCKETS
	add hl, de
	ld a, [wListScrollOffset]
	ld [hl], a
	ret

BagSelectedOrdinal:
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ret

BagOwnershipItem:
; C = logical key/machine index -> A = item ID. Preserve C.
	ld a, [wBagPocket]
	cp KEY_POCKET
	jr nz, .machine
	ld hl, KeyItemIDs
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret
.machine
	ld a, c
	cp NUM_TMS
	jr nc, .hm
	add TM01
	ret
.hm
	sub NUM_TMS
	add HM01
	ret

BagOwnershipLimit:
; Preserve C (unlike BagPocketCapacity).
	ld a, [wBagPocket]
	cp KEY_POCKET
	ld a, NUM_BAG_KEY_ITEMS
	ret z
	ld a, NUM_TM_HM
	ret

BagOwnershipBit:
; The display scan already has the logical index in C.
	ld hl, wOwnedKeyItems
	ld a, [wBagPocket]
	cp KEY_POCKET
	jr z, .bit
	ld hl, wOwnedTMHMs
.bit
	jp GetOwnershipBitByIndex

BagCountEntries:
	xor a
	ld [wListCount], a
	ld a, [wBagPocket]
	cp KEY_POCKET
	jr nc, .ownership
	call GetPocketStackPointer
	ld a, [hl]
	ld [wListCount], a
	ret
.ownership
	ld c, 0
.loop
	call BagOwnershipBit
	ld a, [hl]
	and b
	jr z, .next
	ld hl, wListCount
	inc [hl]
.next
	inc c
	call BagOwnershipLimit
	cp c
	jr nz, .loop
	ret

BagResolveEntry:
; A = visible ordinal. Returns A/wCurItem = ID, wWhichPokemon = logical
; index, wMaxItemQuantity = quantity. $ff = end of list.
	ld c, a
	ld a, [wListCount]
	cp c
	jr z, .cancel
	jr c, .cancel
	ld a, [wBagPocket]
	cp KEY_POCKET
	jr nc, .ownership
	ld a, c
	ld [wWhichPokemon], a
	ld a, [wBagPocket]
	call GetPocketStackPointer
	call GetStackEntry
	ld a, [hli]
	ld [wCurItem], a
	ld a, [hl]
	ld [wMaxItemQuantity], a
	ld a, [wCurItem]
	ret
.ownership
	ld a, c
	ld [wMaxItemQuantity], a ; countdown; no quantity exists in this pocket
	ld c, 0
.loop
	call BagOwnershipBit
	ld a, [hl]
	and b
	jr z, .next
	ld a, [wMaxItemQuantity]
	and a
	jr z, .found
	dec a
	ld [wMaxItemQuantity], a
.next
	inc c
	call BagOwnershipLimit
	cp c
	jr nz, .loop
.cancel
	ld a, $ff
	ld [wCurItem], a
	ret
.found
	ld a, c
	ld [wWhichPokemon], a
	call BagOwnershipItem
	ld [wCurItem], a
	ret

BagDraw:
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	ld hl, BagFrameTilemap
	ld de, wTileMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	call BagDrawHeader
	call BagDrawRows
	call BagDrawSelection
	call BagDrawScrollThumb
	call BagApplyAttributes
	farcall UpdateBagUIPalettes
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jp LoadGBPal

BagDrawHeader:
	hlcoord 1, 1
	ld de, BagPackText
	call PlaceString
	ld a, [wBagPocket]
	add a
	ld e, a
	ld d, 0
	ld hl, BagPocketLabels
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
; Center between the pocket-switch arrows (five text columns).
	push de
	ld b, 0
.length
	ld a, [de]
	cp '@'
	jr z, .center
	inc b
	inc de
	jr .length
.center
	ld a, 5
	sub b
	srl a
	ld e, a
	ld d, 0
	hlcoord 7, 1
	add hl, de
	pop de
	call PlaceString
	hlcoord 14, 1
	ld de, wListCount
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber
	ld [hl], '/'
	inc hl
	push hl
	call BagPocketCapacity
	ld [wTempByteValue], a
	pop hl
	ld de, wTempByteValue
	lb bc, 1, 2
	call PrintNumber
	ret

BagDrawRows:
	hlcoord 1, 3
	lb bc, BAG_VISIBLE_ROWS, 18
	call BagClearArea
	hlcoord 2, 3
	ld a, [wListScrollOffset]
	ld c, a
	ld b, BAG_VISIBLE_ROWS
.rows
	push bc
	push hl
	ld a, c
	call BagResolveEntry
	pop hl
	cp $ff
	jr z, .endRows
	ld [wNamedObjectIndex], a
	call GetItemName
	push hl
	call PlaceString
	pop hl
	ld a, [wBagPocket]
	cp TMHM_POCKET
	jr z, .machineName
	cp KEY_POCKET
	jr nc, .rowDone
	push hl
	ld de, 13
	add hl, de
	ld [hl], BAG_UI_TILE_BASE + 17
	inc hl
	ld de, wMaxItemQuantity
	lb bc, 1, 3
	call PrintNumber
	pop hl
	jr .rowDone
.machineName
	push hl
	ld a, [wCurItem]
	sub TM01
	jr nc, .tmIndex
	add NUM_TM_HM
.tmIndex
	inc a
	ld [wTempTMHM], a
	predef TMToMove
	call GetMoveName
	pop hl
	push hl
	ld bc, 5
	add hl, bc
	call PlaceString
	pop hl
.rowDone
	pop bc
	push hl
	ld a, [wBagSwapIndex]
	cp c
	jr nz, .noSwapArrow
	dec hl
	ld [hl], BAG_UI_TILE_BASE + 16
.noSwapArrow
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	inc c
	dec b
	jr nz, .rows
	ret
.endRows
	pop bc
	ret

BagDrawSelection:
	hlcoord 1, 15
	lb bc, 2, 18
	call BagClearArea
	ld a, [wListCount]
	and a
	ret z
	hlcoord 1, 3
	ld a, [wCurrentMenuItem]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], BAG_UI_TILE_BASE + 15
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	call BagSelectedOrdinal
	call BagResolveEntry
	cp $ff
	ret z
	farcall DrawBagDescription_
	ret

BagPackText:
	db "Pack@"
BagPocketLabels:
	dw .items, .balls, .key, .machines
.items
	db "Items@"
.balls
	db "Balls@"
.key
	db "Key@"
.machines
	db "TM/HM@"

BagFieldActions::
; This menu is called only from StartMenu_Item. Carry = cancelled.
	ld a, [wBagPocket]
	cp KEY_POCKET
	jr nc, .useOnly
	call BagIsProtected
	ld a, [wIsKeyItem]
	and a
	jr nz, .useOnly
	hlcoord 12, 9
	lb bc, 2, 5
	call BagSkinBox
	hlcoord 14, 10
	ld de, .useToss
	call PlaceString
	ld a, 1
	ld [wMaxMenuItem], a
	jr .input
.useOnly
	hlcoord 12, 9
	lb bc, 1, 5
	call BagSkinBox
	hlcoord 14, 10
	ld de, .use
	call PlaceString
	xor a
	ld [wMaxMenuItem], a
.input
	hlcoord 12, 9
	call BagCellAddress
	ld a, [wMaxMenuItem]
	add 3
	ld b, a
	ld c, 7
	call BagUploadRectangle
	xor a
	ld [wCurrentMenuItem], a
	call BagActionCursor
	jp BagActionInput
.useToss
	db "Use"
	down "Toss@"
.use
	db "Use@"

DisplayChooseQuantityMenu_::
	hlcoord 14, 9
	lb bc, 1, 4
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .box
	hlcoord 6, 9
	lb bc, 1, 12
.box
	ld a, [wBagUIActive]
	and a
	jr z, .standardBox
	dec hl
	call BagSkinBox
	jr .boxReady
.standardBox
	call TextBoxBorder
.boxReady
	hlcoord 15, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .initial
	hlcoord 7, 10
.initial
	ld de, InitialQuantityText
	ld a, [wBagUIActive]
	and a
	jr z, .initialText
	dec hl
	ld de, InitialBagQuantityText
.initialText
	call PlaceString
	ld a, 1
	ld [wItemQuantity], a
	jp .handleNewQuantity
.waitForKeyPressLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_A_BUTTON, a
	jp nz, .accepted
	bit BIT_B_BUTTON, a
	jp nz, .cancelled
	bit BIT_D_UP, a
	jr nz, .increment
	bit BIT_D_DOWN, a
	jr nz, .decrement
	bit BIT_D_RIGHT, a
	jr nz, .plusTen
	bit BIT_D_LEFT, a
	jr nz, .minusTen
	jr .waitForKeyPressLoop
.increment
	ld a, [wMaxItemQuantity]
	ld b, a
	ld hl, wItemQuantity
	ld a, [hl]
	cp b
	jr z, .one
	inc [hl]
	jr .handleNewQuantity
.one
	ld [hl], 1
	jr .handleNewQuantity
.decrement
	ld hl, wItemQuantity
	dec [hl]
	jr nz, .handleNewQuantity
	ld a, [wMaxItemQuantity]
	ld [hl], a
	jr .handleNewQuantity
.plusTen
	ld a, [wMaxItemQuantity]
	ld b, a
	ld a, [wItemQuantity]
	add 10
	jr c, .maximum
	cp b
	jr c, .store
.maximum
	ld a, b
.store
	ld [wItemQuantity], a
	jr .handleNewQuantity
.minusTen
	ld a, [wItemQuantity]
	sub 10
	jr c, .minimum
	jr nz, .store
.minimum
	ld a, 1
	jr .store

.handleNewQuantity
	hlcoord 16, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printQuantity
.printPrice
; Compute in four BCD bytes before applying the existing sale divisor.
; Clip transactions above the six-digit money range, never undercharge.
	call BagTransactionPrice
	ld a, [wQuantityMenuResult]
	and a
	jr z, .priceFits
	ld hl, wItemQuantity
	dec [hl]
	ld a, [hl]
	ld [wMaxItemQuantity], a
	jr .printPrice
.priceFits
	hlcoord 12, 10
	ld a, [wBagUIActive]
	and a
	jr z, .pricePositioned
	dec hl
.pricePositioned
	ld de, SpacesBetweenQuantityAndPriceText
	call PlaceString
	ld de, hMoney ; total price
	ld c, $a3
	call PrintBCDNumber
	hlcoord 8, 10
.printQuantity
	ld a, [wBagUIActive]
	and a
	jr z, .quantityPositioned
	dec hl
.quantityPositioned
	ld de, wItemQuantity ; current quantity
	lb bc, LEADING_ZEROES | 1, 3 ; 1 byte, 3 digits
	call PrintNumber
	ld a, [wBagUIActive]
	and a
	jp z, .waitForKeyPressLoop
	call BagUploadQuantityBox
	jp .waitForKeyPressLoop
.accepted
	xor a
	ld [wQuantityMenuResult], a
	ld [wMenuItemToSwap], a
	ret
.cancelled
	ld a, 1
	ld [wQuantityMenuResult], a
	ret
InitialBagQuantityText:
	db BAG_UI_TILE_BASE + 17, "001@"
InitialQuantityText::
	db "×001@"
SpacesBetweenQuantityAndPriceText::
	db "      @"

; Load the save, then reset transient Pack menu state.
LoadSAV::
	farcall LoadSAV_
	ld hl, wBagPocket
	ld bc, wQuantityMenuResult - wBagPocket + 1
	xor a
	call FillMemory
	ld a, $ff
	ld [wBagSwapIndex], a
	ld [wBagSelectedIndex], a
	ret

BagTransactionPrice::
; hItemPrice * quantity -> high BCD byte in wQuantityMenuResult, low
; three bytes in hMoney. Apply the hack's existing /4 sale rate afterwards.
; wQuantityMenuResult is scratch until Accept/Cancel stores its final result.
	xor a
	ld [wQuantityMenuResult], a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ldh [hMoney + 2], a
	ld a, [wItemQuantity]
	ld b, a
.sum
	ld hl, hItemPrice + 2
	ld de, hMoney + 2
	ld c, 3
	and a
.byte
	ld a, [de]
	adc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .byte
	ld a, [wQuantityMenuResult]
	adc 0
	daa
	ld [wQuantityMenuResult], a
	dec b
	jr nz, .sum
	ldh a, [hHalveItemPrices]
	and a
	ret z
	ld e, 2
.divide
	ld b, 0
	ld a, [wQuantityMenuResult]
	call .halfByte
	ld [wQuantityMenuResult], a
	ldh a, [hMoney]
	call .halfByte
	ldh [hMoney], a
	ldh a, [hMoney + 1]
	call .halfByte
	ldh [hMoney + 1], a
	ldh a, [hMoney + 2]
	call .halfByte
	ldh [hMoney + 2], a
	dec e
	jr nz, .divide
	ret
.halfByte
; B carries 0 or 10 into the next decimal digit.
	ld c, a
	swap a
	and $f
	add b
	ld b, 0
	srl a
	jr nc, .highEven
	ld b, 10
.highEven
	swap a
	ld d, a
	ld a, c
	and $f
	add b
	ld b, 0
	srl a
	jr nc, .lowEven
	ld b, 10
.lowEven
	or d
	ret
