SECTION "Sprite Buffers", SRAM

sSpriteBuffer0:: ds SPRITEBUFFERSIZE
sSpriteBuffer1:: ds SPRITEBUFFERSIZE
sSpriteBuffer2:: ds SPRITEBUFFERSIZE

	ds $100

sHallOfFame:: ds HOF_TEAM * HOF_TEAM_CAPACITY


SECTION "Save Data", SRAM

	ds $598

sGameData::
sPlayerName::  ds NAME_LENGTH
sMainData::    ds wMainDataEnd - wMainDataStart
sSpriteData::  ds wSpriteDataEnd - wSpriteDataStart
sPartyData::   ds wPartyDataEnd - wPartyDataStart
sCurBoxData::  ds wBoxDataEnd - wBoxDataStart
sTileAnimations:: db
sGameDataEnd::
sMainDataCheckSum:: db


; The PC boxes will not fit into one SRAM bank,
; so they use multiple SECTIONs
DEF box_n = 0
MACRO boxes
	REPT \1
		DEF box_n += 1
	sBox{d:box_n}:: ds wBoxDataEnd - wBoxDataStart
	ENDR
ENDM

SECTION "Saved Boxes 1", SRAM

; sBox1 - sBox6
	boxes 6
sBank2AllBoxesChecksum:: db
sBank2IndividualBoxChecksums:: ds 6

SECTION "Saved Boxes 2", SRAM

; sBox7 - sBox12
	boxes 6
sBank3AllBoxesChecksum:: db
sBank3IndividualBoxChecksums:: ds 6

; All 12 boxes fit within 2 SRAM banks
	ASSERT box_n == NUM_BOXES, \
		"boxes: Expected {d:NUM_BOXES} total boxes, got {d:box_n}"

; Fixed unused tails: do not move any legacy save address.
SECTION "Storage UI Backup", SRAM[$b900], BANK[0]
sStorageUIBackup:: ds wStorageStateEnd - wStorageState
sStorageOverworldMap:: ds wOverworldMapEnd - wOverworldMap
	ASSERT @ <= $c000

SECTION "Storage Journal", SRAM[$b500], BANK[1]
sStorageJournalMarker:: db
sStorageJournalStart::
sStorageJournalBoxAID:: db
sStorageJournalBoxBID:: db
sStorageJournalCurrentBox:: db
sStorageJournalHappiness:: ds 2
sStorageJournalBoxA:: ds wBoxDataEnd - wBoxDataStart
sStorageJournalMapA:: ds STORAGE_MAP_SIZE
sStorageJournalBoxB:: ds wBoxDataEnd - wBoxDataStart
sStorageJournalMapB:: ds STORAGE_MAP_SIZE
sStorageJournalParty:: ds wPartyDataEnd - wPartyDataStart
sStorageJournalEnd::
sStorageJournalChecksum:: db
	ASSERT @ <= $c000

SECTION "Storage Slot Maps", SRAM[$b900], BANK[2]
sStorageMapMagic:: ds 2
sStorageMapVersion:: db
sStorageSlotMaps:: ds NUM_BOXES * STORAGE_MAP_SIZE

SECTION "Storage Overworld BG Tiles", SRAM[$ba00], BANK[2]
sStorageOverworldBGTiles:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

SECTION "Storage Overworld BG Attributes", SRAM[$b900], BANK[3]
sStorageOverworldBGAttributes:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
