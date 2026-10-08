; Packed Pokémon records stay compatible with the original save layout.
; Visible slot maps and a redo journal live exclusively in unused SRAM tails.

StorageResetMetadata::
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	xor a
	ld [sStorageJournalMarker], a
	ld a, 2
	ld [MBC1SRamBank], a
	xor a
	ld [sStorageMapMagic], a
	jp StorageCloseSRAM

StorageCloseSRAM:
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

StorageOpenMaps:
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 2
	ld [MBC1SRamBank], a
	ld a, [sStorageMapMagic]
	cp $53
	jr nz, .initialize
	ld a, [sStorageMapMagic + 1]
	cp $42
	jr nz, .initialize
	ld a, [sStorageMapVersion]
	cp STORAGE_MAP_VERSION
	ret z
.initialize
	xor a
	ld [sStorageMapMagic], a
	ld hl, sStorageSlotMaps
	ld bc, NUM_BOXES * STORAGE_MAP_SIZE
	ld a, STORAGE_EMPTY
	call FillMemory
	ld hl, sStorageSlotMaps + MONS_PER_BOX
	ld b, NUM_BOXES
.emptyMap
	xor a
	ld [hli], a
	ld a, MONS_PER_BOX - 1 ; complement of 18*$ff + zero count
	ld [hl], a
	ld de, STORAGE_MAP_SIZE - 1
	add hl, de
	dec b
	jr nz, .emptyMap
	ld a, STORAGE_MAP_VERSION
	ld [sStorageMapVersion], a
	ld a, $42
	ld [sStorageMapMagic + 1], a
	ld a, $53
	ld [sStorageMapMagic], a
	ret

; A = box ID; HL = its map in SRAM bank 2.
StorageMapAddress:
	and $7f
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, hl
	add hl, de
	ld de, sStorageSlotMaps
	add hl, de
	ret

; HL = data, BC = length. A = complemented sum; HL points past data.
StorageChecksum:
	ld d, 0
.loop
	ld a, [hli]
	add d
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, d
	cpl
	ret

; Preserve all callers' registers; safe outside the PC (no map-buffer scratch).
; Repair legacy maps after packed append writers; catches/gifts use the
; dedicated incoming-record hook to preserve their chosen visible slot.
StorageSyncMap::
	push af
	ld a, [wStorageEditing]
	and a
	jr nz, .return
	push bc
	push de
	push hl
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	push hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	cp [hl]
	pop hl
	jr nz, .rebuild
	push hl
	ld de, MONS_PER_BOX
	add hl, de
	ld a, [hl]
	pop hl
	ld e, a
	ld a, [wBoxCount]
	cp e
	jr c, .rebuild
	jr z, .done
	ld d, a
.append
	push hl
	ld b, MONS_PER_BOX
.findEmpty
	ld a, [hl]
	cp STORAGE_EMPTY
	jr z, .found
	inc hl
	dec b
	jr nz, .findEmpty
	pop hl
	jr .rebuild
.found
	ld [hl], e
	pop hl
	inc e
	ld a, e
	cp d
	jr nz, .append
	jr .finish
.rebuild
	ld a, [wBoxCount]
	ld d, a
	ld b, MONS_PER_BOX
	ld c, 0
	push hl
.packed
	ld a, c
	cp d
	jr c, .occupied
	ld a, STORAGE_EMPTY
.occupied
	ld [hli], a
	inc c
	dec b
	jr nz, .packed
	pop hl
.finish
	push hl
	ld de, MONS_PER_BOX
	add hl, de
	ld a, [wBoxCount]
	ld [hl], a
	pop hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
.done
	call StorageCloseSRAM
	pop hl
	pop de
	pop bc
.return
	pop af
	ret

; Called before legacy removal compacts box records. All storage writers share it.
StorageMapOnRemove::
	ld a, [wStorageEditing]
	and a
	ret nz
	ld a, [wRemoveMonFromBox]
	and a
	ret z
	call StorageSyncMap
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	push hl
	ld a, [wWhichPokemon]
	ld e, a
	ld b, MONS_PER_BOX
.slot
	ld a, [hl]
	cp STORAGE_EMPTY
	jr z, .next
	cp e
	jr c, .next
	jr nz, .shift
	ld [hl], STORAGE_EMPTY
	jr .next
.shift
	dec [hl]
.next
	inc hl
	dec b
	jr nz, .slot
	dec [hl] ; packed count
	pop hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
	jp StorageCloseSRAM

StorageReadMap::
	call StorageSyncMap
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	ld de, wStorageMap
	ld bc, MONS_PER_BOX
	call CopyData
	jp StorageCloseSRAM

; Printer scratch overlaps the UI map, so resolve its visible row directly
; from SRAM. Preserve the printer's pointers and page counters.
StoragePrinterRecordIndex::
	push bc
	push de
	push hl
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	ld a, [wBoxNumString]
	cp MONS_PER_BOX
	jr nc, .empty
	ld e, a
	ld d, 0
	add hl, de
	ld b, [hl]
	ld a, [wBoxCount]
	cp b
	jr z, .empty
	jr c, .empty
	ld a, b
	ld [wWhichPokemon], a ; farcall returns its ROM bank in A
	and a
	jr .close
.empty
	scf
.close
	push af
	call StorageCloseSRAM
	pop af
	pop hl
	pop de
	pop bc
	ret

StorageWriteMap::
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	ld d, h
	ld e, l
	ld hl, wStorageMap
	ld bc, MONS_PER_BOX
	call CopyData
	ld a, [wBoxCount]
	ld [de], a
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
	jp StorageCloseSRAM

; A = box ID. Return B = bank, HL = canonical record address.
StorageBoxAddress:
	and $7f
	ld b, 2
	cp NUM_BOXES / 2
	jr c, .bank
	inc b
	sub NUM_BOXES / 2
.bank
	add a
	ld e, a
	ld d, 0
	ld hl, .pointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
.pointers
	dw sBox1, sBox2, sBox3, sBox4, sBox5, sBox6

StorageLoadBox::
	call StorageLoadBoxData
	jp StorageReadMap

; Load records without touching the PC's map/UI buffer (overworld scratch).
StorageLoadBoxData:
	set 7, a
	ld [wCurrentBoxNum], a
	call StorageBoxAddress
	push hl
	push bc
	xor a
	call SwitchSRAMBankAndLatchClockData
	pop bc
	ld a, b
	ld [MBC1SRamBank], a
	pop hl
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	call StorageCloseSRAM
	ret

; Return E = occupied collection slots, excluding party members.
; Use the live page's WRAM count rather than its possibly stale SRAM mirror.
StorageCountMons::
	push bc
	push hl
	ld a, [wBoxCount]
	ld e, a
	ld a, [wCurrentBoxNum]
	bit 7, a
	jr z, .done
	ld c, 0
.page
	ld a, [wCurrentBoxNum]
	and $7f
	cp c
	jr z, .next
	push bc
	push de
	ld a, c
	call StorageBoxAddress
	push hl
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, b
	ld [MBC1SRamBank], a
	pop hl
	ld a, [hl]
	push af
	call StorageCloseSRAM
	pop af
	pop de
	pop bc
	add e
	ld e, a
.next
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .page
.done
	pop hl
	pop bc
	ret

; Capacity checks must not change the live page before a ball succeeds.
; The current page's WRAM count is authoritative; other counts live in SRAM.
StorageHasRoom::
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr c, .room
	ld a, [wCurrentBoxNum]
	bit 7, a
	jr z, .room ; backing pages have not been initialized yet
	push bc
	push de
	push hl
	ld c, 0
.page
	ld a, [wCurrentBoxNum]
	and $7f
	cp c
	jr z, .next
	push bc
	ld a, c
	call StorageBoxAddress
	push hl
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, b
	ld [MBC1SRamBank], a
	pop hl
	ld a, [hl]
	cp MONS_PER_BOX
	push af
	call StorageCloseSRAM
	pop af
	pop bc
	jr c, .found
.next
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .page
	pop hl
	pop de
	pop bc
	scf
	ret
.found
	pop hl
	pop de
	pop bc
.room
	and a
	ret

; Return carry if all 216 slots are occupied, otherwise E = destination slot.
; E survives the farcall trampoline, which overwrites A and BC on return.
; Append after the last visible Pokemon, using the first hole only when the
; collection ends at slot 216. No UI state is borrowed, even during battle.
StoragePrepareIncomingMon::
	push de
	push hl
	ld a, [wCurrentBoxNum]
	push af
	bit 7, a
	jr nz, .initialized
	farcall EmptyAllSRAMBoxes
	ld hl, wCurrentBoxNum
	set 7, [hl]
.initialized
	call StorageSyncMap
	call StorageStoreBox
	ld de, $ffff ; D = first hole, E = last occupied global slot
	ld c, 0 ; global slot, 0..215
	xor a
.page
	push bc
	push de
	call StorageLoadBoxData
	call StorageSyncMap ; validate/rebuild legacy slot maps against records
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	pop de
	pop bc
	ld b, MONS_PER_BOX
.slot
	ld a, [hli]
	cp STORAGE_EMPTY
	jr nz, .occupied
	ld a, d
	cp STORAGE_EMPTY
	jr nz, .next
	ld d, c
	jr .next
.occupied
	ld e, c
.next
	inc c
	dec b
	jr nz, .slot
	call StorageCloseSRAM
	ld a, [wCurrentBoxNum]
	and $7f
	inc a
	cp NUM_BOXES
	jr c, .page
	ld a, e
	inc a ; $ff (empty collection) wraps to slot zero
	cp NUM_BOXES * MONS_PER_BOX
	jr c, .destination
	ld a, d
	cp STORAGE_EMPTY
	jr nz, .destination
	; Nothing fits: restore the original live page and report full storage.
	pop af
	call StorageLoadBoxData
	pop hl
	pop de
	scf
	ret
.destination
	ld b, a
	pop af ; discard the original page; destination becomes the live page
	xor a
.divide
	ld c, a
	ld a, b
	cp MONS_PER_BOX
	jr c, .load
	sub MONS_PER_BOX
	ld b, a
	ld a, c
	inc a
	jr .divide
.load
	push bc
	ld a, c
	call StorageLoadBoxData
	pop bc
	pop hl
	pop de
	ld e, b
	and a
	ret

; E = chosen visible slot. SendNewMonToBox prepends packed record zero;
; shift existing visible record indices and put zero in the chosen hole.
StorageFinishIncomingMon::
	ld a, e
	push af
	call StorageOpenMaps
	ld a, [wCurrentBoxNum]
	call StorageMapAddress
	push hl
	ld b, MONS_PER_BOX
.shift
	ld a, [hl]
	cp STORAGE_EMPTY
	jr z, .next
	inc [hl]
.next
	inc hl
	dec b
	jr nz, .shift
	ld a, [wBoxCount]
	ld [hl], a
	pop hl
	pop af
	push hl
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	pop hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
	jp StorageCloseSRAM

; Preserve the live page while updating its canonical SRAM records.
StorageStoreBox::
	ld a, [wCurrentBoxNum]
	call StorageBoxAddress
	push hl
	push bc
	xor a
	call SwitchSRAMBankAndLatchClockData
	pop bc
	ld a, b
	ld [MBC1SRamBank], a
	pop de
	ld hl, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	call StorageBoxChecksums
	jp StorageCloseSRAM

StorageBoxChecksums:
	ld hl, sBox1
	ld de, sBank2IndividualBoxChecksums
	lb bc, NUM_BOXES / 2, 0 ; C accumulates the bank sum in the same pass
.box
	push bc
	push de
	ld bc, wBoxDataEnd - wBoxDataStart
	call StorageChecksum
	pop de
	ld [de], a
	inc de
	pop bc
	cpl
	add c
	ld c, a
	dec b
	jr nz, .box
	ld a, c
	cpl
	ld [sBank2AllBoxesChecksum], a
	ret

StorageBeginTransaction::
	ld a, [wSaveFileStatus]
	cp 2
	jr z, .saved
	farcall SaveSAVtoSRAM
.saved
	ld a, 1
	ld [wStorageEditing], a
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	xor a
	ld [sStorageJournalMarker], a
	ld a, STORAGE_EMPTY
	ld [sStorageJournalBoxAID], a
	ld [sStorageJournalBoxBID], a
	jp StorageCloseSRAM

StorageStageBoxA::
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	ld a, [wCurrentBoxNum]
	and $7f
	ld [sStorageJournalBoxAID], a
	ld de, sStorageJournalBoxA
	jr StorageStageBox

StorageStageBoxB::
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	ld a, [wCurrentBoxNum]
	and $7f
	ld [sStorageJournalBoxBID], a
	ld de, sStorageJournalBoxB
StorageStageBox:
	ld hl, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	push de
	ld hl, wStorageMap
	ld bc, MONS_PER_BOX
	call CopyData
	ld a, [wBoxCount]
	ld [de], a
	pop hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
	jp StorageCloseSRAM

; Publish only after the complete redo payload and its checksum are durable.
StorageCommitTransaction::
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	ld a, [wCurrentBoxNum]
	ld [sStorageJournalCurrentBox], a
	ld hl, wPikachuHappiness
	ld de, sStorageJournalHappiness
	ld bc, 2
	call CopyData
	ld hl, wPartyDataStart
	ld de, sStorageJournalParty
	ld bc, wPartyDataEnd - wPartyDataStart
	call CopyData
	ld hl, sStorageJournalStart
	ld bc, sStorageJournalEnd - sStorageJournalStart
	call StorageChecksum
	ld [sStorageJournalChecksum], a
	ld a, STORAGE_JOURNAL_READY
	ld [sStorageJournalMarker], a
	call StorageCloseSRAM
	call StorageRecoverJournal
	xor a
	ld [wStorageEditing], a
	jp StorageReadMap

; Also runs before save validation on boot. Replaying is idempotent.
StorageRecoverJournal::
	xor a
	call SwitchSRAMBankAndLatchClockData
	ld a, 1
	ld [MBC1SRamBank], a
	ld a, [sStorageJournalMarker]
	cp STORAGE_JOURNAL_READY
	jp nz, StorageCloseSRAM
	ld hl, sStorageJournalStart
	ld bc, sStorageJournalEnd - sStorageJournalStart
	call StorageChecksum
	ld b, a
	ld a, [sStorageJournalChecksum]
	cp b
	jp nz, StorageCloseSRAM
	ld a, [sStorageJournalBoxAID]
	cp NUM_BOXES
	jp nc, StorageCloseSRAM
	ld b, a
	ld a, [sStorageJournalBoxA]
	cp MONS_PER_BOX + 1
	jp nc, StorageCloseSRAM
	ld a, [sStorageJournalParty]
	cp PARTY_LENGTH + 1
	jp nc, StorageCloseSRAM
	ld a, [sStorageJournalBoxBID]
	cp STORAGE_EMPTY
	jr z, .validatedBoxes
	cp NUM_BOXES
	jp nc, StorageCloseSRAM
	ld a, [sStorageJournalBoxB]
	cp MONS_PER_BOX + 1
	jp nc, StorageCloseSRAM
.validatedBoxes
	ld a, [sStorageJournalCurrentBox]
	and $7f
	cp b
	jr z, .validatedMirror
	ld b, a
	ld a, [sStorageJournalBoxBID]
	cp b
	jp nz, StorageCloseSRAM
.validatedMirror
	ld a, [sStorageJournalBoxAID]
	ld hl, sStorageJournalBoxA
	call StorageReplayBox
	ld a, 1
	ld [MBC1SRamBank], a
	ld a, [sStorageJournalBoxBID]
	cp NUM_BOXES
	jr nc, .party
	ld hl, sStorageJournalBoxB
	call StorageReplayBox
.party
	ld a, 1
	ld [MBC1SRamBank], a
	ld hl, sStorageJournalParty
	ld de, sPartyData
	ld bc, wPartyDataEnd - wPartyDataStart
	call CopyData
	ld hl, sStorageJournalHappiness
	ld de, sMainData + (wPikachuHappiness - wMainDataStart)
	ld bc, 2
	call CopyData
	ld a, [sStorageJournalCurrentBox]
	ld [sMainData + (wCurrentBoxNum - wMainDataStart)], a
	ld b, a
	and $7f
	ld c, a
	ld a, [sStorageJournalBoxAID]
	cp c
	ld hl, sStorageJournalBoxA
	jr z, .mirror
	ld hl, sStorageJournalBoxB
.mirror
	push hl
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	pop hl
	ld de, sCurBoxData
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call StorageChecksum
	ld [sMainDataCheckSum], a
	xor a
	ld [sStorageJournalMarker], a
	jp StorageCloseSRAM

; A = affected box ID, HL = journal box image in bank 1.
; Chunk through wStorageIconBuffer, never switch SRAM while reading a payload.
StorageReplayBox:
	push af
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	ld de, wStorageMap
	ld bc, MONS_PER_BOX
	call CopyData
	pop af
	push af
	call StorageBoxAddress
	ld a, b
	ld [MBC1SRamBank], a
	ld d, h
	ld e, l
	ld hl, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	call StorageBoxChecksums
	call StorageOpenMaps
	pop af
	call StorageMapAddress
	ld d, h
	ld e, l
	push hl
	ld hl, wStorageMap
	ld bc, MONS_PER_BOX
	call CopyData
	ld a, [wBoxCount]
	ld [de], a
	pop hl
	ld bc, MONS_PER_BOX + 1
	call StorageChecksum
	ld [hl], a
	ret

; Resolve visible slot A in the current box map. Carry means empty.
StorageResolveSlot::
	cp MONS_PER_BOX
	jr nc, .empty
	ld hl, wStorageMap
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld b, a
	ld a, [wBoxCount]
	cp b
	jr z, .empty
	jr c, .empty
	ld a, b
	and a
	ret
.empty
	scf
	ret

; Return the selected record index and data location for existing helpers.
StorageSelectMon::
	ld a, [wStorageCursor]
	cp STORAGE_TITLE
	jr z, .empty
	ld b, a
	ld a, [wStoragePanel]
	and a
	ld a, b
	jr z, .box
	ld b, a
	ld a, [wPartyCount]
	cp b
	jr z, .empty
	jr c, .empty
	ld a, b
	ld [wWhichPokemon], a
	xor a
	ld [wMonDataLocation], a
	and a
	ret
.box
	call StorageResolveSlot
	ret c
	ld [wWhichPokemon], a
	ld a, BOX_DATA
	ld [wMonDataLocation], a
	and a
	ret
.empty
	scf
	ret

; Copy selected mon to DE as a normalized party record, OT and nickname.
StorageReadRecord::
	push de
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr nz, .copy
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLevel], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, 1
	call CalcStats
.copy
	pop de
	ld hl, wLoadedMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyData
	push de
	ld a, [wMonDataLocation]
	and a
	ld hl, wPartyMonOT
	jr z, .ot
	ld hl, wBoxMonOT
.ot
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	pop de
	ld bc, NAME_LENGTH
	call CopyData
	push de
	ld a, [wMonDataLocation]
	and a
	ld hl, wPartyMonNicks
	jr z, .nick
	ld hl, wBoxMonNicks
.nick
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	pop de
	ld bc, NAME_LENGTH
	jp CopyData

; HL = normalized record; A = packed party destination index.
StorageWritePartyRecord::
	cp PARTY_LENGTH
	ret nc
	ld [wStorageIndex], a
	push hl
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyData
	push hl
	ld hl, wPartyMonOT
	ld a, [wStorageIndex]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	call CopyData
	push hl
	ld hl, wPartyMonNicks
	ld a, [wStorageIndex]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wStorageIndex]
	ld e, a
	ld d, 0
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld hl, wPartySpecies
	add hl, de
	ld [hl], a
	ret

; HL = normalized record, A = visible empty box slot.
StorageAppendBoxRecord::
	cp MONS_PER_BOX
	ret nc
	push af
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr c, .capacity
	pop af
	ret
.capacity
	ld [wStorageIndex], a
	push hl
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	push de
	push hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyData
	pop hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	pop hl
	ld bc, MON_BOX_LEVEL
	add hl, bc
	ld [hl], a
	; Source now resumes at OT, following the normalized party structure.
	ld hl, wStorageHeld + PARTYMON_STRUCT_LENGTH
	ld a, [wStorageMenuChoice] ; 0 held record, 1 other record
	and a
	jr z, .otSource
	ld hl, wStorageOther + PARTYMON_STRUCT_LENGTH
.otSource
	push hl
	ld hl, wBoxMonOT
	ld a, [wStorageIndex]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	call CopyData
	push hl
	ld hl, wBoxMonNicks
	ld a, [wStorageIndex]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wStorageIndex]
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld b, a
	ld a, [wStorageIndex]
	ld e, a
	ld d, 0
	ld hl, wBoxSpecies
	add hl, de
	ld [hl], b
	inc hl
	ld [hl], STORAGE_EMPTY
	ld hl, wBoxCount
	inc [hl]
	pop af
	ld hl, wStorageMap
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wStorageIndex]
	ld [hl], a
	ret

StorageRemoveBoxSlot::
	call StorageResolveSlot
	ret c
	ld [wWhichPokemon], a
	ld a, 1
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, [wWhichPokemon]
	ld e, a
	ld hl, wStorageMap
	ld b, MONS_PER_BOX
.map
	ld a, [hl]
	cp STORAGE_EMPTY
	jr z, .next
	cp e
	jr c, .next
	jr nz, .shift
	ld [hl], STORAGE_EMPTY
	jr .next
.shift
	dec [hl]
.next
	inc hl
	dec b
	jr nz, .map
	ret

StorageRemovePartyIndex::
	ld b, a
	ld a, [wPartyCount]
	cp b
	ret z
	ret c
	ld a, b
	ld [wWhichPokemon], a
	xor a
	ld [wRemoveMonFromBox], a
	jp RemovePokemon

StorageAppendPartyRecord::
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ret nc
	push af
	call StorageWritePartyRecord
	ld hl, wPartyCount
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld [hl], STORAGE_EMPTY
	pop af
	ret

; Insert a normalized record at A, shifting later party members right.
; The caller has already checked capacity; source record is held/other.
StorageInsertPartyRecord::
	ld b, a
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ret nc
	cp b
	jr c, .bounded
	ld a, b
.bounded
	push hl
	ld [wStorageIndex], a
	ld a, [wPartyCount]
	ld [wStorageMenuChoice], a
.shift
	ld a, [wStorageMenuChoice]
	ld b, a
	ld a, [wStorageIndex]
	cp b
	jr nc, .write
	ld a, b
	dec a
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call StorageShiftPartyEntry
	ld a, [wStorageMenuChoice]
	dec a
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call StorageShiftPartyEntry
	ld a, [wStorageMenuChoice]
	dec a
	ld hl, wPartyMonNicks
	ld bc, NAME_LENGTH
	call StorageShiftPartyEntry
	ld a, [wStorageMenuChoice]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	dec hl
	ld a, [hli]
	ld [hl], a
	ld hl, wStorageMenuChoice
	dec [hl]
	jr .shift
.write
	pop hl
	ld a, [wStorageIndex]
	call StorageWritePartyRecord
	ld hl, wPartyCount
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld [hl], STORAGE_EMPTY
	ret

StorageShiftPartyEntry:
	call AddNTimes
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	jp CopyData
