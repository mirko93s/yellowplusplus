TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	db LICKITUNG,  GRAVELER, TRADE_DIALOGSET_CASUAL, "SABURO@@@@@" ; route 11
	db CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL, "MASARU@@@@@" ; route 2
	db BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,  "STINGER@@@@" ; ---unused---
	db KANGASKHAN, KADABRA,  TRADE_DIALOGSET_CASUAL, "OHIGE@@@@@@" ; pokemon lab
	db MEW,        MEW,      TRADE_DIALOGSET_HAPPY,  "BART@@@@@@@" ; ---unused---
	db TANGELA,    HAUNTER,  TRADE_DIALOGSET_CASUAL, "GHOSUKE@@@@" ; route 18
	db PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_POLITE, "MARTY@@@@@@" ; ---unused---
	db PIKACHU,    CATERPIE, TRADE_DIALOGSET_POLITE, "BRUCLINO@@@" ; pokemon lab "easter egg"
	db POLIWHIRL,  JYNX,     TRADE_DIALOGSET_HAPPY,  "MASAKO@@@@@" ; pokemon lab
	db CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,  "ROCKY@@@@@@" ; underground path
	assert_table_length NUM_NPC_TRADES
