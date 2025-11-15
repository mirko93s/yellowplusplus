	db RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBack

	db TACKLE, TAIL_WHIP, FURY_ATTACK, GROWL ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE
	; end

	db BANK(RapidashPicFront)
