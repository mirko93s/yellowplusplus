ValidateCheatData_::
	ld a, [wCheatDataMarker]
	cp CHEAT_DATA_MAGIC
	jr nz, InitializeCheatData_
	ld a, [wCheatDataMarker + 1]
	cp 1
	jr nz, .version
	; Preserve existing cheat saves while defaulting the newly assigned bytes.
	xor a
	ld hl, wEnemyCheatFlags
	ld bc, wCheatWildSpecies + 1 - wEnemyCheatFlags
	call FillMemory
	ld a, [wCheatFlags + 1]
	and $0f
	ld [wCheatFlags + 1], a
	ld a, CHEAT_DATA_VERSION
	ld [wCheatDataMarker + 1], a
.version
	cp CHEAT_DATA_VERSION
	jr nz, InitializeCheatData_
	ld a, [wCheatMultipliers]
	and 7
	cp 5
	jr nc, InitializeCheatData_
	ld a, [wCheatMultipliers]
	rrca
	rrca
	rrca
	and 7
	cp 5
	jr nc, InitializeCheatData_
	ld a, [wSoundSettings]
	and 3
	ld [wSoundSettings], a
	ld a, [wCheatWildLevel]
	cp 1
	jr nz, .species
	xor a
	ld [wCheatWildLevel], a
.species
	ld a, [wCheatWildSpecies]
	cp NUM_POKEMON_INDEXES + 1
	ret c
	xor a
	ld [wCheatWildSpecies], a
	ret

InitializeCheatData_::
	xor a
	ld hl, wCheatFlags
	ld bc, wCheatWildSpecies + 1 - wCheatFlags
	call FillMemory
	ld a, CHEAT_DATA_MAGIC
	ld [wCheatDataMarker], a
	ld a, CHEAT_DATA_VERSION
	ld [wCheatDataMarker + 1], a
	ret

; Apply after encounter generation/randomization, before loading wild stats.
; Scripted/static encounters and trainer battles do not call this routine.
ApplyWildCheats::
	ld a, CHEAT_UNLOCKED
	call CheckCheat
	ret z
	ld a, [wCheatWildLevel]
	and a
	jr z, .species
	ld [wCurEnemyLevel], a
.species
	ld a, [wCheatWildSpecies]
	and a
	ret z
	ld [wCurPartySpecies], a
	ld [wEnemyMonSpecies2], a
	ld [wCurOpponent], a
	ret

; Walking encounters are queued one step before battle. Apply the chosen
; level before Repel compares it, so Repel checks the actual encounter level.
ApplyQueuedWildCheats::
	ld a, CHEAT_UNLOCKED
	call CheckCheat
	ret z
	ld a, [wCheatWildLevel]
	and a
	jr z, .species
	ld [wNextEncounterLevel], a
.species
	ld a, [wCheatWildSpecies]
	and a
	ret z
	ld [wNextEncounterSpecies], a
	ret

; c = recipient side (0 player, 1 enemy). Protection takes priority over OHKO.
ApplyCheatAttackDamage::
	ld a, c
	and a
	ld a, CHEAT_HP
	jr z, .playerHP
	call CheckEnemyCheat
	jr .protected
.playerHP
	call CheckCheat
.protected
	jr z, .checkOHKO
	xor a
	jr .store
.checkOHKO
	ldh a, [hWhoseTurn]
	cp c
	ret z ; never apply OHKO to self-confusion damage
	ld a, [wMoveMissed]
	and a
	ret nz
	ld a, CHEAT_OHKO
	call CheckBattleCheat
	ret z
	ld a, [wDamage]
	ld b, a
	ld a, [wDamage + 1]
	or b
	ret z ; immunity and failed moves still cause no damage
	ld a, $ff
.store
	ld [wDamage], a
	ld [wDamage + 1], a
	ret

ApplySuperEffectiveCheat::
	ld a, [wDamageMultipliers]
	and $80 ; retain STAB indicator
	or SUPER_EFFECTIVE
	ld [wDamageMultipliers], a
	ld hl, wDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff ; saturate doubled damage instead of overflowing
	ld [hli], a
	ld [hl], a
	ret
