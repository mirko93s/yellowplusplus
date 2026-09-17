_DexCompletionText::
	text "#dex comp-"
	line "letion is:"

	para '@'
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text " #mon seen"
	line '@'
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text " #mon owned"

	para "Prof. Oak's"
	line "Rating:"
	prompt

_DexRatingText_Own0To9::
	text "You still have"
	line "lots to do."
	cont "Look for #mon"
	cont "in grassy areas!"
	done

_DexRatingText_Own10To19::
	text "You're on the"
	line "right track! "
	cont "Get a Flash HM"
	cont "from my Aide!"
	done

_DexRatingText_Own20To29::
	text "You still need"
	line "more #mon!"
	cont "Try to catch"
	cont "other species!"
	done

_DexRatingText_Own30To39::
	text "Good, you're"
	line "trying hard!"
	cont "Get an Itemfinder"
	cont "from my Aide!"
	done

_DexRatingText_Own40To49::
	text "Looking good!"
	line "Go find my Aide"
	cont "when you get 50!"
	done

_DexRatingText_Own50To59::
	text "You finally got at"
	line "least 50 species!"
	cont "Be sure to get"
	cont "Exp. All from my"
	cont "Aide!"
	done

_DexRatingText_Own60To69::
	text "Oh! This is get-"
	line "ting even better!"
	done

_DexRatingText_Own70To79::
	text "Very good!"
	line "Go fish for some"
	cont "marine #mon!"
	done

_DexRatingText_Own80To89::
	text "Wonderful!"
	line "Do you like to"
	cont "collect things?"
	done

_DexRatingText_Own90To99::
	text "I'm impressed!"
	line "It must have been"
	cont "difficult to do!"
	done

_DexRatingText_Own100To109::
	text "You finally got at"
	line "least 100 species!"
	cont "I can't believe"
	cont "how good you are!"
	done

_DexRatingText_Own110To119::
	text "You even have the"
	line "evolved forms of"
	cont "#mon! Super!"
	done

_DexRatingText_Own120To129::
	text "Excellent! Trade"
	line "with friends to"
	cont "get some more!"
	done

_DexRatingText_Own130To139::
	text "Outstanding!"
	line "You've become a"
	cont "real pro at this!"
	done

_DexRatingText_Own140To149::
	text "I have nothing"
	line "left to say!"
	cont "You're the"
	cont "authority now!"
	done

_DexRatingText_Own150To151::
	text "Your #dex is"
	line "fully complete!"
	cont "Congratulations!"
	done
