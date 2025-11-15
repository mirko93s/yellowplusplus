	db GOLEM ; pokedex id

	db  80, 120, 130,  45,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 248 ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBack

	db TACKLE, DEFENSE_CURL, SAND_ATTACK, BIDE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         METRONOME,    SELFDESTRUCT, FIRE_BLAST,   \
	     REST,         EXPLOSION,    ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(GolemPicFront)
