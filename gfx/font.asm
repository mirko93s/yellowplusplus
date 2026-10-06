PokemonLogoJapanGraphics: INCBIN "gfx/title/pokemon_logo_japan.2bpp"
FontGraphics:: INCBIN "gfx/font/font.1bpp"
FontGraphicsEnd::

ABTiles: INCBIN "gfx/font/AB.2bpp"

; Packed shared tiles; the loader preserves their original VRAM IDs.
HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp", 0, 11 tiles
HpBarAndStatusGraphicsEnd::
SharedLevelGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp", 11 tiles, 1 tiles
SharedIDGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp", 12 tiles, 2 tiles
SharedNamingGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp", 14 tiles, 2 tiles

BattleHudTiles:: INCBIN "gfx/battle/battle_hud.1bpp"
BattleHudTilesEnd::

NintendoCopyrightLogoGraphics: INCBIN "gfx/splash/copyright.2bpp"

GamefreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
GamefreakLogoGraphicsEnd:

NineTile: INCBIN "gfx/title/nine.2bpp"

; Each PNG contains only the six border tiles in charmap order.
; Keep the space tile at $7f blank for every frame.
TextBoxGraphics::
	INCBIN "gfx/frames/1.2bpp" ; default frame
	ds 1 tiles, 0
	INCBIN "gfx/frames/2.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/3.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/4.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/5.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/6.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/7.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/8.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/9.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/10.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/11.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/12.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/13.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/14.2bpp"
	ds 1 tiles, 0
	INCBIN "gfx/frames/15.2bpp"
	ds 1 tiles, 0
TextBoxGraphicsEnd::
	ASSERT TextBoxGraphicsEnd - TextBoxGraphics == NUM_TEXTBOX_FRAMES * TEXTBOX_FRAME_TILES tiles

PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
