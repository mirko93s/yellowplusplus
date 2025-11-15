	db DODRIO ; pokedex id

	db  60, 110,  70, 110,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBack

	db PECK, GROWL, MIRROR_MOVE, TRI_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SKULL_BASH,   SKY_ATTACK,   REST,         TRI_ATTACK,   \
	     SUBSTITUTE,   FLY
	; end

	db BANK(DodrioPicFront)
