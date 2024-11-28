; ; debug rates all pokemons with 10+ on each dv will be shiny
; IsMonShiny:
; 	ld h, d
; 	ld l, e
; 	; attack DV >= 10?
; 	ld a, [hl]
; 	and $f0
; 	cp 3 << 2
; 	jr c, .notShiny
; 	; defense DV >= 10?
; 	ld a, [hli]
; 	and $f
; 	cp 3
; 	jr c, .notShiny
; 	; speed DV >= 10?
; 	ld a, [hl]
; 	and $f0
; 	cp 3 << 2
; 	jr c, .notShiny
; 	; special DV >= 10?
; 	ld a, [hl]
; 	and $f
; 	cp 3
; 	jr c, .notShiny
; 	and a
; 	ret

; ; all shinies 100%
; IsMonShiny:
; 	and a
; 	ret

; og rates 1/8192
IsMonShiny:
	ld h, d
	ld l, e
	ld a, [hli]
	bit 5, a
	jr z, .notShiny
	and a, $f
	cp 10
	jr nz, .notShiny
	ld a, [hl]
	cp (10 << 4) | 10
	jr nz, .notShiny
	and a
	ret

.notShiny
	xor a
	ret

_EvolutionSetWholeScreenPalette:
	ld hl, wShinyMonFlag
	res 0, [hl]
	push de
	ld de, wLoadedMonDVs
	call IsMonShiny
	pop de
	jr z, .setPal
	ld hl, wShinyMonFlag
	set 0, [hl]
.setPal
	ld c, d
	ld b, SET_PAL_POKEMON_WHOLE_SCREEN
	jp RunPaletteCommand

PlayShinySparkleAnimation:
	; flash the screen
	ldh a, [rBGP]
	push af ; save initial palette
	ld a, %00011011 ; 0, 1, 2, 3 (inverted colors)
	ldh [rBGP], a
	ld c, 4
	call DelayFrames
	pop af
	ldh [rBGP], a ; restore initial palette
	; play animation
	ld b, 11 + 1
.loop
	dec b
	jr z, .animationFinished
	ld c, ((ShinySparkleCoordsEnd - ShinySparkleCoords) / 3) + 1
	ld a, [wShinyMonFlag]
	bit 1, a
	ld de, ShinySparkleCoords
	jr z, .ok
	ld de, EnemyShinySparkleCoords
.ok
	ld hl, wShadowOAM
.innerLoop
	dec c
	jr z, .delayFrames
	ld a, [de]
	cp b
	jr c, .sparkleInactive
	sub b
	cp 4
	jr nc, .sparkleInactive
	push bc
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, $C9 ; first sparkle tile
	add 3
	sub b
	ld [hli], a
	xor a
	ld [hli], a
	pop bc
	jr .innerLoop

.sparkleInactive
	inc de
	inc de
	inc de
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	jr .innerLoop

.delayFrames
	push bc
	ld c,2
	call DelayFrames
	ld a, SFX_PRESS_AB
	call PlaySound
	pop bc
	jr .loop

.animationFinished
	xor a
	ld hl, wShadowOAM
	ld bc, 4 * ((ShinySparkleCoordsEnd - ShinySparkleCoords) / 3)
	jp FillMemory

ShinySparkleCoords:
; First byte is the frame where the animation starts (higher = sooner)
; Second and third bytes are y/x coordinates
	db $0B, 70, 48
	db $0A, 75, 60
	db $09, 86, 64
	db $08, 99, 60
	db $07, 103, 48
	db $06, 99, 36
	db $05, 86, 30
	db $04, 75, 36
ShinySparkleCoordsEnd:

EnemyShinySparkleCoords:
; First byte is the frame where the animation starts (higher = sooner)
; Second and third bytes are y/x coordinates
	db $0B, 70 - 48, 48 + 80
	db $0A, 75 - 48, 60 + 80
	db $09, 86 - 48, 64 + 80
	db $08, 99 - 48, 60 + 80
	db $07, 103 - 48, 48 + 80
	db $06, 99 - 48, 36 + 80
	db $05, 86 - 48, 30 + 80
	db $04, 75 - 48, 36 + 80
EnemyShinySparkleCoordsEnd: