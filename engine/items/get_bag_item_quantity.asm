GetQuantityOfItemInBag:
; B = item ID -> B = quantity, or 0/1 ownership. Preserve the caller's wCurItem.
	call GetPredefRegisters
	ld a, [wTempByteValue]
	push af
	ld a, b
	ld [wTempByteValue], a
	farcall BagQuantity_
	ld a, [wTempByteValue]
	ld b, a
	pop af
	ld [wTempByteValue], a
	ret
