InitPlayerData:
InitPlayerData2:
	farcall StorageResetMetadata

IF DEF(_DEBUG)
	; Start new debug games near the playtime limit: 99999:50:00.
	ld a, $01
	ld [wPlayTimeHours], a
	ld a, $86
	ld [wPlayTimeHours + 1], a
	ld a, $9f
	ld [wPlayTimeHours + 2], a
	ld a, 50
	ld [wPlayTimeMinutes], a
	xor a
	ld [wPlayTimeSeconds], a
	ld [wPlayTimeFrames], a
	ld [wPlayTimeMaxed], a
ENDC

	call Random
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wUnusedPlayerDataByte], a

	ld a, 90 ; initialize happiness to 90
	ld [wPikachuHappiness], a
	ld a, $80
	ld [wPikachuMood], a ; initialize mood

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wBoxCount
	call InitializeEmptyList
	farcall InitializePocketBag_

DEF START_MONEY EQU $5000
	xor a
	ld [wPlayerMoneyMillions], a
	ld hl, wPlayerMoney + 1
	ld a, HIGH(START_MONEY)
	ld [hld], a
	xor a ; LOW(START_MONEY)
	ld [hli], a
	inc hl
	ld [hl], a

	ld [wMonDataLocation], a

	ld hl, wObtainedBadges
	ld [hl], a

	ld hl, wPlayerCoins
	ld [hli], a
	ld [hl], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	call FillMemory ; clear all game progress flags

	jp InitializeMissableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret
