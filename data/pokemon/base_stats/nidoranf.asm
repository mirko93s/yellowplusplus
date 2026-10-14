	db NIDORAN_F ; pokedex id

	db  55,  47,  52,  41,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/nidoranf.pic", 0, 1 ; sprite dimensions
	dw NidoranFPicFront, NidoranFPicBack

	db GROWL, SCRATCH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , ICE_BEAM, \
	     BLIZZARD     , RAGE         , THUNDERBOLT  , THUNDER      , DIG, \
	     MIMIC        , DOUBLE_TEAM  , REFLECT      , BIDE         , SKULL_BASH, \
	     REST         , SUBSTITUTE   , CUT          , STRENGTH
	; end

	db BANK(NidoranFPicFront)
