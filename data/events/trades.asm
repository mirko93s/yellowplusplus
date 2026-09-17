TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	;  give mon,   get mon,	 dialog id,      			nickname
	db LICKITUNG,  GRAVELER, TRADE_DIALOGSET_CASUAL, 	"Saburo@@@@@" ; route 11
	db CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL, 	"Masaru@@@@@" ; route 2
	db BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,  	"Stinger@@@@" ; ---unused---
	db KANGASKHAN, KADABRA,  TRADE_DIALOGSET_CASUAL, 	"Ohige@@@@@@" ; pokemon lab
	db MEW,        MEW,      TRADE_DIALOGSET_HAPPY,  	"Bart@@@@@@@" ; ---unused---
	db TANGELA,    HAUNTER,  TRADE_DIALOGSET_CASUAL, 	"Ghosuke@@@@" ; route 18
	db PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_EVOLUTION, "Marty@@@@@@" ; ---unused---
	db PIKACHU,    CATERPIE, TRADE_DIALOGSET_EVOLUTION, "Bruclino@@@" ; pokemon lab "easter egg"
	db POLIWHIRL,  JYNX,     TRADE_DIALOGSET_HAPPY,  	"Masako@@@@@" ; pokemon lab
	db CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,  	"Rocky@@@@@@" ; underground path
	assert_table_length NUM_NPC_TRADES
