; a = CHEAT_* flag. Returns nz when enabled, preserving bc/de/hl.
; Link activities never apply cheat effects.
CheckCheat::
	push bc
	push hl
	ld hl, wCheatFlags
	jr CheckCheatFlags

CheckEnemyCheat::
	push bc
	push hl
	ld hl, wEnemyCheatFlags
CheckCheatFlags:
	ld c, a
	push hl
	ld a, [wLinkState]
	and a
	jr nz, .off
	ld a, [wStatusFlags4]
	bit 6, a
	jr nz, .off
	ld a, [wCheatDataMarker]
	cp CHEAT_DATA_MAGIC
	jr nz, .off
	ld a, [wCheatDataMarker + 1]
	cp CHEAT_DATA_VERSION
	jr nz, .off
	ld a, [wStatusFlags6]
	bit 1, a ; runtime debug mode, independent of the build
	jr nz, .runtimeDebug
	ld a, [wCheatFlags + 1]
	bit CHEAT_UNLOCKED - 8, a
	jr z, .off
	jr .flagsReady
.runtimeDebug
	ld a, c
	cp CHEAT_UNLOCKED
	jr nz, .flagsReady ; individual effects still use their saved settings
	pop hl
	ld a, 1
	and a
	jr .done
.flagsReady
	pop hl
	ld a, c
	cp 8
	jr c, .mask
	inc hl
	sub 8
.mask
	ld b, a
	ld a, 1
	inc b
.shift
	dec b
	jr z, .test
	add a
	jr .shift
.test
	and [hl]
	jr .done
.off
	pop hl
	xor a
.done
	pop hl
	pop bc
	ret

; Returns nz if the current move targets a status-protected mon on either side.
CheckPlayerStatusProtection::
	ld a, CHEAT_STATUS
	jp CheckTargetCheat

; Check the acting mon, or the target of the acting mon. Preserve bc/de/hl.
CheckBattleCheat::
	push af
	ldh a, [hWhoseTurn]
	and a
	jr CheckSideCheat
CheckTargetCheat::
	push af
	ldh a, [hWhoseTurn]
	xor 1
CheckSideCheat:
	jr nz, .enemy
	pop af
	jp CheckCheat
.enemy
	pop af
	jp CheckEnemyCheat

; Saved data is inside the existing Main Data save/checksum boundaries.
ValidateCheatData::
	farcall ValidateCheatData_
	ret

InitializeCheatData::
	farcall InitializeCheatData_
	ret

; Only the temporary flag can be switched off. A game's unlock is latched.
LatchCheatUnlock::
	ld a, [wNextGameCheats]
	and a
	ret z
	ld hl, wCheatFlags + 1
	set CHEAT_UNLOCKED - 8, [hl]
	ret

; Return the selected multiplier (1/2/3/4/8), EXP in a with entry 0,
; money in a with entry 1. Preserves bc/de/hl.
GetCheatMultiplier::
	push bc
	push hl
	ld b, a
	ld a, CHEAT_UNLOCKED
	call CheckCheat
	jr z, .normal
	ld a, [wCheatMultipliers]
	bit 0, b
	jr z, .exp
	rrca
	rrca
	rrca
.exp
	and 7
	cp 5
	jr nc, .normal
	ld c, a
	ld b, 0
	ld hl, .values
	add hl, bc
	ld a, [hl]
	jr .done
.normal
	ld a, 1
.done
	pop hl
	pop bc
	ret
.values
	db 1, 2, 3, 4, 8

; Directions retain normal navigation. Only the ninth B and final A
; are consumed, to avoid leaving the main menu or choosing an item.
CheckKonamiCode::
	ld a, [wSettingsMenuKind]
	cp 2 ; main menu input is active
	jr nz, .ordinary
	ldh a, [hJoyPressed]
	and a
	jr nz, .newPress
	ld a, [wKonamiProgress]
	cp 9
	jr nz, .ordinary
	ldh a, [hJoy5]
	and B_BUTTON
	jr z, .ordinary
	scf
	ret
.newPress
	push bc
	push de
	push hl
	ld b, a
	ld a, [wKonamiProgress]
	ld e, a
	ld d, 0
	ld hl, .sequence
	add hl, de
	ld a, b
	cp [hl]
	jr nz, .wrong
	ld hl, wKonamiProgress
	inc [hl]
	ld a, [hl]
	cp 9
	jr z, .consumed
	cp 10
	jr nz, .notConsumed
	xor a
	ld [hl], a
	ld a, [wNextGameCheats]
	xor 1
	ld [wNextGameCheats], a
	call DrawCheatsEnabled
.consumed
	pop hl
	pop de
	pop bc
	scf
	ret
.wrong
	xor a
	ld [wKonamiProgress], a
	ld a, b
	cp D_UP
	jr nz, .notConsumed
	ld a, 1
	ld [wKonamiProgress], a
	jr .notConsumed
.notConsumed
	pop hl
	pop de
	pop bc
.ordinary
	and a
	ret
.sequence
	db D_UP, D_UP, D_DOWN, D_DOWN, D_LEFT, D_RIGHT, D_LEFT, D_RIGHT, B_BUTTON, A_BUTTON

; Redrawn when returning from Options or the Continue information screen.
DrawCheatsEnabled::
	hlcoord 0, 11
	ld bc, SCREEN_WIDTH
	ld a, ' '
	call FillMemory
	ld a, [wNextGameCheats]
	and a
	ret z
	hlcoord 3, 11
	ld de, .enabled
	jp PlaceString
.enabled
	db "CHEATS ENABLED!@"
