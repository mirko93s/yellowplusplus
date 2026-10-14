_CalcStats::
	ld c, $0
.statsLoop
	inc c
	call _CalcStat
	ldh a, [hMultiplicand+1]
	ld [de], a
	inc de
	ldh a, [hMultiplicand+2]
	ld [de], a
	inc de
	ld a, c
	cp NUM_STATS
	jr nz, .statsLoop
	ret

_CalcStat::
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	call IsStatRecordStarterPikachu
	ld hl, wMonHeader
	jr nc, .baseStatsReady
	ld hl, StarterPikachuBaseStats - 1
.baseStatsReady
	ld b, $0
	add hl, bc
	ld a, [hl]          ; read base value of stat
	ld e, a
	pop hl
	push hl
	sla c
	ld a, d
	and a
	jr z, .statExpDone  ; consider stat exp?
	add hl, bc          ; skip to corresponding stat exp value
.statExpLoop            ; calculates ceil(Sqrt(stat exp)) in b
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand+1], a
	inc b               ; increment current stat exp bonus
	ld a, b
	cp $ff
	jr z, .statExpDone
	ldh [hMultiplicand+2], a
	ldh [hMultiplier], a
	call Multiply
	ld a, [hld]
	ld d, a
	ldh a, [hProduct + 3]
	sub d
	ld a, [hli]
	ld d, a
	ldh a, [hProduct + 2]
	sbc d               ; test if (current stat exp bonus)^2 < stat exp
	jr c, .statExpLoop
.statExpDone
	srl c
	pop hl
	push bc
	ld bc, wPartyMon1DVs - (wPartyMon1HPExp - 1) ; also wEnemyMonDVs - wEnemyMonHP
	add hl, bc
	pop bc
	ld a, c
	cp $2
	jr z, .getAttackIV
	cp $3
	jr z, .getDefenseIV
	cp $4
	jr z, .getSpeedIV
	cp $5
	jr z, .getSpecialIV
.getHpIV
	push bc
	ld a, [hl]  ; Atk IV
	swap a
	and $1
	sla a
	sla a
	sla a
	ld b, a
	ld a, [hli] ; Def IV
	and $1
	sla a
	sla a
	add b
	ld b, a
	ld a, [hl] ; Spd IV
	swap a
	and $1
	sla a
	add b
	ld b, a
	ld a, [hl] ; Spc IV
	and $1
	add b      ; HP IV: LSB of the other 4 IVs
	pop bc
	jr .calcStatFromIV
.getAttackIV
	ld a, [hl]
	swap a
	and $f
	jr .calcStatFromIV
.getDefenseIV
	ld a, [hl]
	and $f
	jr .calcStatFromIV
.getSpeedIV
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .calcStatFromIV
.getSpecialIV
	inc hl
	ld a, [hl]
	and $f
.calcStatFromIV
	ld d, $0
	add e
	ld e, a
	jr nc, .noCarry
	inc d                     ; de = Base + IV
.noCarry
	sla e
	rl d                      ; de = (Base + IV) * 2
	srl b
	srl b                     ; b = ceil(Sqrt(stat exp)) / 4
	ld a, b
	add e
	jr nc, .noCarry2
	inc d                     ; de = (Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4
.noCarry2
	ldh [hMultiplicand+2], a
	ld a, d
	ldh [hMultiplicand+1], a
	xor a
	ldh [hMultiplicand], a
	ld a, [wCurEnemyLevel]
	ldh [hMultiplier], a
	call Multiply            ; ((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level
	ldh a, [hMultiplicand]
	ldh [hDividend], a
	ldh a, [hMultiplicand+1]
	ldh [hDividend+1], a
	ldh a, [hMultiplicand+2]
	ldh [hDividend+2], a
	ld a, $64
	ldh [hDivisor], a
	ld a, $3
	ld b, a
	call Divide             ; (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100
	ld a, c
	cp $1
	ld a, 5 ; + 5 for non-HP stat
	jr nz, .notHPStat
	ld a, [wCurEnemyLevel]
	ld b, a
	ldh a, [hMultiplicand+2]
	add b
	ldh [hMultiplicand+2], a
	jr nc, .noCarry3
	ldh a, [hMultiplicand+1]
	inc a
	ldh [hMultiplicand+1], a ; HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + Level
.noCarry3
	ld a, 10 ; +10 for HP stat
.notHPStat
	ld b, a
	ldh a, [hMultiplicand+2]
	add b
	ldh [hMultiplicand+2], a
	jr nc, .noCarry4
	ldh a, [hMultiplicand+1]
	inc a                    ; non-HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + 5
	ldh [hMultiplicand+1], a ; HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + Level + 10
.noCarry4
	ldh a, [hMultiplicand+1] ; check for overflow (>999)
	cp HIGH(MAX_STAT_VALUE) + 1
	jr nc, .overflow
	cp HIGH(MAX_STAT_VALUE)
	jr c, .noOverflow
	ldh a, [hMultiplicand+2]
	cp LOW(MAX_STAT_VALUE) + 1
	jr c, .noOverflow
.overflow
	ld a, HIGH(MAX_STAT_VALUE) ; overflow: cap at 999
	ldh [hMultiplicand+1], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hMultiplicand+2], a
.noOverflow
	pop bc
	pop de
	pop hl
	ret

StarterPikachuBaseStats:
	db 45, 80, 50, 120, 75, 60 ; HP, Attack, Defense, Speed, Sp. Atk, Sp. Def

; HL is the stat-exp base supplied to CalcStat. Only recognize real player
; records, never enemy records or the enemy-speed calculation's scratch data.
; Preserve the calculation's registers; carry means the starter was found.
IsStatRecordStarterPikachu:
	push bc
	push de
	push hl
	ld bc, -(MON_HP_EXP - 1)
	add hl, bc
	ld b, h
	ld c, l
	ld de, wPartyMonOT
	ld hl, wPartyMon1
	ld a, PARTY_LENGTH
.partyLoop
	push af
	ld a, h
	cp b
	jr nz, .nextPartyMon
	ld a, l
	cp c
	jr z, .partyFound
.nextPartyMon
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld a, NAME_LENGTH
	add e
	ld e, a
	jr nc, .nextOTReady
	inc d
.nextOTReady
	pop bc
	pop af
	dec a
	jr nz, .partyLoop
	ld a, b
	cp HIGH(wLoadedMon)
	jr nz, .notStarter
	ld a, c
	cp LOW(wLoadedMon)
	jr nz, .notStarter
	ld hl, wLoadedMon
	ld a, [wMonDataLocation]
	and a
	ld de, wPartyMonOT
	jr z, .indexedOT
	cp BOX_DATA
	ld de, wBoxMonOT
	jr z, .indexedOT
	cp DAYCARE_DATA
	jr nz, .notStarter
	ld de, wDayCareMonOT
	jr .checkRecord
.indexedOT
	push hl
	ld h, d
	ld l, e
	ld a, [wWhichPokemon]
	ld bc, NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	jr .checkRecord
.partyFound
	pop af
.checkRecord
	ld a, [hl]
	cp STARTER_PIKACHU
	jr nz, .notStarter
	ld bc, MON_CATCH_RATE
	add hl, bc
	ld a, [hl]
	cp LIGHT_BALL_GSC
	jr nz, .notStarter
	ld bc, MON_OTID - MON_CATCH_RATE
	add hl, bc
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .notStarter
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	jr nz, .notStarter
	ld hl, wPlayerName
	ld b, 5 ; same original-trainer name comparison as starter behavior
.nameLoop
	ld a, [de]
	cp [hl]
	jr nz, .notStarter
	inc de
	inc hl
	dec b
	jr nz, .nameLoop
	scf
	jr .done
.notStarter
	and a
.done
	pop hl
	pop de
	pop bc
	ret
