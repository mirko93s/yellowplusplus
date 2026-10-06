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

TextBoxGraphics:: INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::

PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
