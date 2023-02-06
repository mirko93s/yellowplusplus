WildMonEncounterSlotChances:
; There are 10 slots for wild pokemon, and this is the table that defines how common each of
; those 10 slots is. A random number is generated and then the first byte of each pair in this
; table is compared against that random number. If the random number is less than or equal
; to the first byte, then that slot is chosen.  The second byte is double the slot number.
	db  50, $00 ; 20%
	db 101, $02 ; 20%
	db 126, $04 ; 10%
	db 151, $06 ; 10%
	db 176, $08 ; 10%
	db 201, $0A ; 10%
	db 214, $0C ;  5%
	db 227, $0E ;  5%
	db 238, $10 ;  4%
	db 249, $12 ;  4%
	db 252, $14 ;  1%
	db 255, $16 ;  1%
