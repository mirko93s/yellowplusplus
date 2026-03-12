; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wMovementFlags]
	and a
	ret nz
	callfar IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	xor a
	ld [wNextEncounterSpecies], a
	inc a
	and a
	ret
.notStandingOnDoorOrWarpTile
	callfar IsPlayerJustOutsideMap
	jr z, .CantEncounter
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .next
	dec a
	jp z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
; determine if wild pokemon can appear in the half-block we're standing in
; is the bottom left tile (8,9) of the half-block we're standing in a grass/water tile?
; note that by using the bottom left tile, this prevents the "left-shore" tiles from generating grass encounters
	hlcoord 8, 9
	ld c, [hl]
	ld a, [wGrassTile]
	cp c
	ld a, [wGrassRate]
	jr z, .CanEncounter
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ld a, [wWaterRate]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokemon
; so long as the map is "indoor" and has wild pokemon defined.
; ...as long as it's not Viridian Forest or Safari Zone.
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP ; is this an indoor map?
	jp c, .CantEncounter2
	ld a, [wCurMapTileset]
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [wGrassRate]
.CanEncounter
	ld b, a
	ld a, [wNextEncounterSpecies]
	and a
	jr nz, .WillEncounterIfNotRepelled
; compare encounter chance with a random number to determine if there will be an encounter
	ldh a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ldh a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
; determine which wild pokemon (grass or water) can appear in the half-block we're standing in
	ld c, [hl]
	ld hl, wGrassMons
	lda_coord 8, 9
	cp $14 ; is the bottom left tile (8,9) of the half-block we're standing in a water tile?
	jr nz, .gotWildEncounterType ; else, it's treated as a grass tile by default
	ld hl, wWaterMons
.gotWildEncounterType
    ld b, 0
    add hl, bc
    ld a, [hli]
; add a small random variation to the wild pokemon level using a triangular distribution.
; two random 0..7 values are summed to get D (0..14), center at 7 = no variation.
; allowed range is +-7 (base_level - 2), so low level pokemon have less variation and we dont go below level 2 which causes bugs in the experience formula.
; out of range values fall back to base level, keeping early routes more consistent, more likely to get base level.
; lower bound = 9 - base_level, upper bound = 5 + base_level (max +-7 at level 9+)
; 9 and 5 come from +-7 (base_level - 2), where 7 is the center of D (0..14)
    ld b, a          ; base level
    call Random
    and %00000111
    ld c, a
    call Random
    and %00000111
    add c            ; D = 0..14
    ld d, a
; check if value of D is in the allowed range for this pokemon level
    ld a, 9
    sub b
	jr c, .inRange ; skip bounds check if level is 9+ (always full range)
    cp d
    jr z, .inRange
    jr nc, .useBase
    ld a, b
    add 5
    cp d
    jr c, .useBase
; apply variation
.inRange
    ld a, d
    sub 7 ; shifts 0..14 to -7..+7, (technically it underflows to 249..7)
    add b
    jr .done
.useBase
    ld a, b
.done
    ld [wNextEncounterLevel], a
    ld a, [hl]
    ld [wNextEncounterSpecies], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounterNext
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wNextEncounterLevel]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounterNext
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, TEXT_REPEL_WORE_OFF
	ldh [hSpriteIndexOrTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	xor a
	ld [wNextEncounterSpecies], a
.willEncounterNext
	ld a, $1
	and a
	ret
.WillEncounterIfNotRepelled
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wNextEncounterLevel]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
.willEncounter
	ld a, [wNextEncounterLevel]
	ld [wCurEnemyLevel], a
	ld a, [wNextEncounterSpecies]
	ld [wCurPartySpecies], a
	ld [wEnemyMonSpecies2], a
	xor a
	ret

INCLUDE "data/wild/probabilities.asm"
