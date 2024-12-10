MagikarpSalesman::
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
	ld a, [wExtraFlags]
	bit 3, a
	jr z, .skip1
	; Since our current position is not in one of the regions defined 
	; in checkNuzlockeStatus, we manually check the status.
	ld hl, wNuzlockeRegions
	inc hl
	bit ROUTE_3_NUZ, [hl] 
	jp nz, .noPokemon
.skip1
	ld hl, .Text1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	; $000500
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	push hl
	ld hl, wExtraFlags
	set 1, [hl]
	pop hl
	lb bc, MAGIKARP, 15
	ld a, [wExtraFlags]
	bit 3, a
	jr z, .skip2
	; Hard set Route 3 when purchasing Pokemon.
	ld hl, wNuzlockeRegions
	inc hl
	set ROUTE_3_NUZ, [hl]   
.skip2
	call GivePokemon
	jr nc, .done
	; $000500
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_MAGIKARP
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.noPokemon
	ld hl, .noPokemonText
	jr .printText
.alreadyBoughtMagikarp
	ld hl, .Text2
.printText
	call PrintText
.done
	ret

.Text1
	text_far _MagikarpSalesmanText1
	text_end

.RefuseText
	text_far _MagikarpSalesmanNoText
	text_end

.NoMoneyText
	text_far _MagikarpSalesmanNoMoneyText
	text_end

.Text2
	text_far _MagikarpSalesmanText2
	text_end

.noPokemonText
	text_far _MagikarpSalesmanNoPokemon
	text_end