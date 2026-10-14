	db MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 58 ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC        , BODY_SLAM    , TAKE_DOWN    , DOUBLE_EDGE  , BUBBLEBEAM, \
	     WATER_GUN    , PAY_DAY      , RAGE         , THUNDERBOLT  , THUNDER, \
	     DIG          , MIMIC        , DOUBLE_TEAM  , BIDE         , SWIFT, \
	     SKULL_BASH   , DREAM_EATER  , REST         , SUBSTITUTE   , CUT, \
	     FLASH
	; end

	db BANK(MeowthPicFront)
