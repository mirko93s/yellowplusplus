	db JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBack

	db TACKLE, TAIL_WHIP, GROWL, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , HYPER_BEAM, \
	     PAY_DAY      , RAGE         , THUNDERBOLT  , THUNDER      , DIG, \
	     MIMIC        , DOUBLE_TEAM  , REFLECT      , BIDE         , SWIFT, \
	     SKULL_BASH   , REST         , THUNDER_WAVE , SUBSTITUTE   , STRENGTH, \
	     FLASH
	; end

	db BANK(JolteonPicFront)
