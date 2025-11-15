	db RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 69 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBack

	db HORN_ATTACK, SAND_ATTACK, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(RhyhornPicFront)
