# Bug Fixes

Related fixes are grouped together here. This includes original Yellow bugs and problems corrected while adding Yellow++ features.

## Battles and Pokémon

- Removed the original **1-in-256 miss** when a move should have maximum accuracy.
- Fixed guaranteed-critical handling and **Focus Energy lowering critical-hit chances** instead of raising them.
- Prevented Reflect and Light Screen from overflowing, and a battle freeze against extremely low defensive stats.
- Corrected effectiveness messages against dual-type Pokémon.
- Corrected hit restrictions for HP-draining moves and Dream Eater.
- Added protection against Substitute leaving its user at zero HP, though it can still fail in some cases where enough HP remains.
- Fixed healing moves failing when the Pokémon is missing exactly **255 or 511 HP**.
- Fixed interrupted Dig/Fly leaving Pokémon permanently invulnerable.
- Fixed Psywave causing link-battle desynchronization and Bide damage carrying over after battle.
- Trainer HP displays update after an opponent uses a healing item.
- Status-curing items no longer reset unrelated stat changes.
- Corrected the female Cooltrainer's low-HP switching behavior.
- Captured transformed Pokémon are no longer automatically treated as Ditto.
- Unseen ghosts cannot be identified without the Silph Scope or reveal their hidden species in the Pokédex.
- PP restoration correctly accounts for PP Ups.
- Fixed skipped moves when gaining multiple levels, incorrect evolution moves and level-one entries, and wrong moves or stats after evolution.
- Fixed TM-use crashes and Substitute-related problems.
- Fixed sleep duration, healing while asleep, and waking behavior.
- Ineffective item uses no longer raise Pikachu's friendship.
- Fixed Pokémon seen/caught tracking and Koffing's missing Pokédex entry.
- Corrected wild shiny generation and scripted shiny gifts.
- Fixed Nuzlocke encounter tracking in two areas and Rare Candy reviving fainted Nuzlocke Pokémon.
- Corrected seeded-randomizer results and setup prompts.
- Corrected trainer team selections, custom movesets, and Giovanni/Lance shiny assignments.

## Exploration and events

- Fixed the north–south Underground Path's dimensions and a faulty encounter boundary.
- You can move immediately after returning Mr. Fuji home.
- Resetting no longer bypasses Safari Zone restrictions.
- Corrected collisions, including Pikachu following through expanded maps and a misplaced following-Pikachu position.
- Corrected NPC movement, delays, and visibility at map edges.
- Prevented landing on NPCs after jumping ledges.
- Holding A at the Route 12 binoculars no longer stops NPC movement.
- Fixed the Route 16 sign, Route 2 gate tiles, and a Viridian Cut tree.
- Itemfinder detects hidden items at map edges.
- Fixed Escape Rope animation and music after falling through a hole while cycling.
- A Poké Doll can no longer bypass the ghost Marowak story event.
- Overworld sprites reload correctly after using the Poké Flute.

## Game Corner

- The hidden **40-coin stash** gives all 40 coins, previously only 20.
- Corrected slot-machine odds and selection of a nonexistent lucky machine.
- Fixed slot-machine graphics loading.

## Graphics and audio

- Corrected battle transitions in dungeon maps.
- Fixed the opponent's Double Edge animation, missing backsprite corners, and tearing during sprite slides.
- Fixed Strength-boulder dust and the Pokémon Center healing-machine flash.
- Removed two unwanted splash-screen stars.
- Psychic, Psywave, and Night Shade now shake the full intended screen area.
- Fixed distorted Articuno binocular cries and unwanted fossil cries in the museum.
- Corrected audio pitch problems, interrupted item jingles, missing Oak's Lab music channels, and victory music playing at the wrong time.
- Corrected player movement and shrinking animations, Hall of Fame portraits, party minisprites, and status-screen graphics.
- Fixed shiny, evolution, and intro colors, including the player changing gender after viewing a shiny Pokémon.
- Talking to Pikachu no longer changes overworld sprite colors.
- Fixed back-sprite colors, monochrome icon colors, and the Water type icon's shading.
- Corrected intro slowdown, cries, and palettes.

## Menus, text, and saves

- Fixed leftover move-menu text, party graphics overwriting battle sprites, and status icons missing in PC summaries.
- Fixed Pokédex evolution text overlapping its frame and other status/Pokédex layout issues.
- Corrected font characters, naming text, missing punctuation, item descriptions, and grammar.
- EXP messages correctly display five-digit rewards.
- Fixed held buttons triggering unwanted actions, repeated Bag SELECT actions, menu exits, and brief overworld flashes.
- Bicycle selection opens its action menu; both Bag use and SELECT shortcuts respect forced cycling.
- Corrected storage submenus, selection, movement, and cancellation behavior.
- Fixed older saves freezing on Continue after ROM updates.

Further loading and responsiveness improvements are included on [Everyday features](https://github.com/mirko93s/yellowplusplus/wiki/Everyday-Features).

