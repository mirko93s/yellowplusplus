	db TENTACOOL ; pokedex id

	db  40,  40,  35,  70,  50, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 190 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
	dw TentacoolPicFront, TentacoolPicBack

	db POISON_STING, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         MEGA_DRAIN,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT,          SURF
	; end

	db BANK(TentacoolPicFront)
