GetPalettePacketSender::
	push af
	xor a
	ld [wGBCOverworldPalettes], a
	pop af
	ld de, SendSGBPackets
	cp SET_PAL_TOWN_MAP
	jr z, .npcSprites
	cp SET_PAL_OVERWORLD
	ret nz
.npcSprites
	ld de, SendOverworldSGBPackets
	ret

StoreGBCObj0BasePalPointer::
	ld a, [wGBCOverworldPalettes]
	and a
	jr z, .store
	push de
	ld de, PAL_NPC
	call GetGBCBasePalAddress
	call .store
	pop de
	ret
.store
	ld a, e
	ld [wGBCObj0BasePalPointer], a
	ld a, d
	ld [wGBCObj0BasePalPointer + 1], a
	ret

GetGBCObj0BasePalPointer::
	ld a, [wGBCObj0BasePalPointer]
	ld e, a
	ld a, [wGBCObj0BasePalPointer + 1]
	ld d, a
	ret

; Overworld and town map sprites share the NPC palette.
; Called by the palette command dispatcher with BANK(SendSGBPackets) loaded.
; Keep this wrapper in ROM0 because the palette bank is full.
SendOverworldSGBPackets::
	ld a, 1
	ld [wGBCOverworldPalettes], a
	call SendSGBPackets
	xor a
	ld [wGBCOverworldPalettes], a
	ret

; Initialize OBJ0 with its selected source before any frames can be displayed.
ConvertGBCObj0Palette::
	push de
	call GetGBCObj0BasePalPointer
	ld a, CONVERT_OBP0
	call DMGPalToGBCPal
	pop de
	ret

GetShopBasePaletteAddress::
; Resolve the city's raw/corrected/monochrome source without losing A to farcall.
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(GetGBCBasePalAddress)
	call BankswitchCommon
	ld a, [wShopCityPalette]
	ld e, a
	ld d, 0
	call GetGBCBasePalAddress
	pop bc
	ld a, b
	jp BankswitchCommon

UpdateGBCPal_BGP::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rBGP]
	ld b, a
	ld a, [wLastBGP]
	cp b
	jr z, .noChangeInBGP
	farcall _UpdateGBCPal_BGP
.noChangeInBGP
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

UpdateGBCPal_OBP0::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rOBP0]
	ld b, a
	ld a, [wLastOBP0]
	cp b
	jr z, .noChangeInOBP0
	ld b, BANK(_UpdateGBCPal_OBP)
	ld hl, _UpdateGBCPal_OBP
	ld c, CONVERT_OBP0
	call Bankswitch
.noChangeInOBP0
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

UpdateGBCPal_OBP1::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rOBP1]
	ld b, a
	ld a, [wLastOBP1]
	cp b
	jr z, .noChangeInOBP1
	ld b, BANK(_UpdateGBCPal_OBP)
	ld hl, _UpdateGBCPal_OBP
	ld c, CONVERT_OBP1
	call Bankswitch
.noChangeInOBP1
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

Func_3082::
	ldh a, [hLoadedROMBank]
	push af
	call FadeOutAudio
	ld a, BANK(Music_DoLowHealthAlarm)
	call BankswitchCommon
	call Music_DoLowHealthAlarm
	ld a, BANK(Audio1_UpdateMusic)
	call BankswitchCommon
	call Audio1_UpdateMusic
	pop af
	jp BankswitchCommon
