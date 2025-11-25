UniqueDVTrainerPokemon:
	; 	TrainerClass, TrainerNo, PartySpecies, Level, AtkDefDV, SpdSpcDV

	; shiny
	; db BROCK, 1, AERODACTYL, 12, $AA, $AA
    ;  trainerclass     id pokémon      lvl     atk/def spc/spd
	db YOUNGSTER,       9, SANDSHREW,   33,     $AA,    $AA     ; A.J.
	db JR_TRAINER_M,    6, WEEPINBELL,  24,     $AA,    $AA     ; JOE
	db JR_TRAINER_F,    2, CUBONE,      25,     $AA,    $AA     ; GISELLE
	db LANCE,           1, DRAGONITE,   62,     $FA,    $AA
	
	; rematches
	db BROCK,           2, AERODACTYL,  98,     $EA,    $AA
	db MISTY,           2, LAPRAS,      97,     $BA,    $AA
	db LT_SURGE,        2, JOLTEON,     97,     $7A,    $AA
	db ERIKA,           2, PARASECT,    96,     $EA,    $AA
	db KOGA,            2, GENGAR,      99,     $2A,    $AA
	db SABRINA,         2, EXEGGUTOR,   99,     $AA,    $AA
	db BLAINE,          2, CHARIZARD,   99,     $6A,    $AA
	db GIOVANNI,        2, KANGASKHAN,  94,     $EA,    $AA
	db LORELEI,         2, DEWGONG,    121,     $3A,    $AA
	db BRUNO,           2, ONIX,       124,     $FA,    $AA
	db AGATHA,          2, VENOMOTH,   115,     $6A,    $AA
	db LANCE,           2, DRAGONITE,  125,     $FA,    $AA

	; valid shiny atk dvs: 2, 3, 6, 7, 10, 11, 14, 15

	db $FF ; end
