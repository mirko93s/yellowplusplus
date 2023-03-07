UniqueDVTrainerPokemon:
	; 	TrainerClass, TrainerNo, PartySpecies, Level, AtkDefDV, SpdSpcDV

	; shiny
	; db BROCK, 1, AERODACTYL, 12, $AA, $AA
    ;  trainerclass     id pokémon      lvl     atk/def spc/spd
	db YOUNGSTER,       9, SANDSHREW,   33,     $AA,    $AA     ; A.J.
	db JR_TRAINER_M,    6, WEEPINBELL,  24,     $AA,    $AA     ; JOE
	db JR_TRAINER_F,    2, CUBONE,      25,     $AA,    $AA     ; GISELLE
	db LANCE,           1, DRAGONITE,   62,     $FA,    $AA     ; LANCE

	;other
	; db LANCE, 1, DRAGONITE, 62, $FF, $FF

	db $FF ; end
