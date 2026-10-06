; function to draw various text boxes
; INPUT:
; [wTextBoxID] = text box ID
; b, c = y, x cursor position (TWO_OPTION_MENU only)
DisplayTextBoxID::
	ld a, [wTextBoxID]
	cp MONEY_BOX
	jr nz, .standard
	ld a, [wBagUIActive]
	and a
	ret nz ; sale accounting must not overlay the Pack with the old money box
	ld a, [wShopUIActive]
	and a
	jr z, .standard
	farcall ShopDrawMoney
	ret
.standard
	homecall_sf DisplayTextBoxID_
	ret
