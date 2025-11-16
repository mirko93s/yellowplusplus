PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

PrizeMenuMon1Entries:
	db DITTO
	db PINSIR
	db SCYTHER
	db '@'

PrizeMenuMon1Cost:
	bcd2 1337
	bcd2 2500
	bcd2 2500
	db '@'

PrizeMenuMon2Entries:
	db EEVEE
	db DRATINI
	db PORYGON
	db '@'

PrizeMenuMon2Cost:
	bcd2 4600
	bcd2 6500
	bcd2 9999
	db '@'

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db '@'

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db '@'
