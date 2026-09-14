setNuzlockeFlag::
	ld hl, wNuzlockeRegions
	ld a, [wCurMap]
	cp INDIGO_PLATEAU
	jr nc, .routeRegion1
	cp PALLET_TOWN
	jr z, .nuzPalletTownFlag
	cp VIRIDIAN_CITY
	jr z, .nuzViridianCityFlag
	cp CERULEAN_CITY
	jr z, .nuzCeruleanCityFlag
	cp VERMILION_CITY
	jr z, .nuzVermilionCityFlag
	cp VERMILION_DOCK
	jr z, .nuzVermilionCityFlag
	cp CELADON_CITY
	jr z, .nuzCeladonCityFlag
	cp FUCHSIA_CITY
	jr z, .nuzFuchsiaCityFlag
	cp CINNABAR_ISLAND
	jr z, .nuzCinnabarIslandFlag
	
.nuzPalletTownFlag
	set PALLET_TOWN_NUZ, [hl]	
	ret
.nuzViridianCityFlag
	set VIRIDIAN_CITY_NUZ, [hl]	
	ret
.nuzCeruleanCityFlag
	set CERULEAN_CITY_NUZ, [hl]	
	ret
.nuzVermilionCityFlag
	set VERMILION_CITY_NUZ, [hl]	
	ret
.nuzCeladonCityFlag
	set CELADON_CITY_NUZ, [hl]	
	ret
.nuzFuchsiaCityFlag
	set FUCHSIA_CITY_NUZ, [hl]
	ret
.nuzCinnabarIslandFlag
	set CINNABAR_ISLAND_NUZ, [hl]
	ret

.routeRegion1
	inc hl
	cp ROUTE_8
	jr nc, .routeRegion2
	cp SAFFRON_CITY
	jr z, .nuzSaffronCityFlag
	cp ROUTE_1
	jr z, .nuzRoute1Flag
	cp ROUTE_2
	jr z, .nuzRoute2Flag
	cp ROUTE_3
	jr z, .nuzRoute3Flag
	cp ROUTE_4
	jr z, .nuzRoute4Flag
	cp ROUTE_5
	jr z, .nuzRoute5Flag
	cp ROUTE_6
	jr z, .nuzRoute6Flag
	cp ROUTE_7
	jr z, .nuzRoute7Flag
	
.nuzSaffronCityFlag
	set SAFFRON_CITY_NUZ, [hl]	
	ret	
.nuzRoute1Flag
	set ROUTE_1_NUZ, [hl]	
	ret
.nuzRoute2Flag
	set ROUTE_2_NUZ, [hl]
	ret
.nuzRoute3Flag
	set ROUTE_3_NUZ, [hl]
	ret
.nuzRoute4Flag
	set ROUTE_4_NUZ, [hl]
	ret
.nuzRoute5Flag
	set ROUTE_5_NUZ, [hl]
	ret
.nuzRoute6Flag
	set ROUTE_6_NUZ, [hl]
	ret
.nuzRoute7Flag
	set ROUTE_7_NUZ, [hl]
	ret

.routeRegion2
	inc hl
	cp ROUTE_16
	jr nc, .routeRegion3
	cp ROUTE_8
	jr z, .nuzRoute8Flag
	cp ROUTE_9
	jr z, .nuzRoute9Flag
	cp ROUTE_10
	jr z, .nuzRoute10Flag
	cp ROUTE_11
	jr z, .nuzRoute11Flag
	cp ROUTE_12
	jr z, .nuzRoute12Flag
	cp ROUTE_13
	jr z, .nuzRoute13Flag
	cp ROUTE_14
	jr z, .nuzRoute14Flag
	cp ROUTE_15
	jr z, .nuzRoute15Flag

.nuzRoute8Flag
	set ROUTE_8_NUZ, [hl]
	ret
.nuzRoute9Flag
	set ROUTE_9_NUZ, [hl]
	ret
.nuzRoute10Flag
	set ROUTE_10_NUZ, [hl]
	ret
.nuzRoute11Flag
	set ROUTE_11_NUZ, [hl]
	ret
.nuzRoute12Flag
	set ROUTE_12_NUZ, [hl]
	ret
.nuzRoute13Flag
	set ROUTE_13_NUZ, [hl]
	ret
.nuzRoute14Flag
	set ROUTE_14_NUZ, [hl]
	ret
.nuzRoute15Flag
	set ROUTE_15_NUZ, [hl]
	ret

.routeRegion3
	inc hl
	cp ROUTE_24
	jr nc, .routeRegion4
	cp ROUTE_16
	jr z, .nuzRoute16Flag
	cp ROUTE_17
	jr z, .nuzRoute17Flag
	cp ROUTE_18
	jr z, .nuzRoute18Flag
	cp ROUTE_19
	jr z, .nuzRoute19Flag
	cp ROUTE_20
	jr z, .nuzRoute20Flag
	cp ROUTE_21
	jr z, .nuzRoute21Flag
	cp ROUTE_22
	jr z, .nuzRoute22Flag
	cp ROUTE_23
	jr z, .nuzRoute23Flag

.nuzRoute16Flag
	set ROUTE_16_NUZ, [hl]
	ret
.nuzRoute17Flag
	set ROUTE_17_NUZ, [hl]
	ret
.nuzRoute18Flag
	set ROUTE_18_NUZ, [hl]
	ret
.nuzRoute19Flag
	set ROUTE_19_NUZ, [hl]
	ret
.nuzRoute20Flag
	set ROUTE_20_NUZ, [hl]
	ret
.nuzRoute21Flag
	set ROUTE_21_NUZ, [hl]
	ret
.nuzRoute22Flag
	set ROUTE_22_NUZ, [hl]
	ret
.nuzRoute23Flag
	set ROUTE_23_NUZ, [hl]
	ret

.routeRegion4
	inc hl
	cp MR_FUJIS_HOUSE
	jr nc, .finalRegion
	cp ROUTE_24
	jr z, .nuzRoute24Flag
	cp ROUTE_25
	jr z, .nuzRoute25Flag
	cp VIRIDIAN_FOREST
	jr z, .nuzViridianForestFlag
	cp CERULEAN_TRASHED_HOUSE ; This will check all the Mt. Moon floors
	jr c, .nuzMtMoonFlag
	cp CERULEAN_GYM ; The gym counts for Cerulean city
	jp z, .nuzCeruleanCityFlag
	cp ROCK_TUNNEL_1F
	jr z, .nuzRockTunnelFlag
	cp ROCK_TUNNEL_B1F
	jr z, .nuzRockTunnelFlag
	cp POWER_PLANT
	jr z, .nuzPowerPlantFlag
	cp VICTORY_ROAD_1F
	jr z, .nuzVictoryRoadFlag
	jr .nuzPokemonTowerFlag ; Last remaining option is Pokemon Tower

.nuzRoute24Flag
	set ROUTE_24_NUZ, [hl]
	ret
.nuzRoute25Flag
	set ROUTE_25_NUZ, [hl]
	ret
.nuzViridianForestFlag
	set VIRIDIAN_FOREST_NUZ, [hl]
	ret
.nuzMtMoonFlag
	set MT_MOON_NUZ, [hl]
	ret
.nuzRockTunnelFlag
	set ROCK_TUNNEL_NUZ, [hl]
	ret
.nuzPowerPlantFlag
	set POWER_PLANT_NUZ, [hl]
	ret
.nuzVictoryRoadFlag
	set VICTORY_ROAD_NUZ, [hl]
	ret
.nuzPokemonTowerFlag
	set POKEMON_TOWER_NUZ, [hl]
	ret

.finalRegion
	inc hl
	cp VERMILION_OLD_ROD_HOUSE
	jr c, .nuzSeafoamIslandsFlag ; This checks B1F, B2F, B3F, and B4F
	cp POKEMON_MANSION_1F
	jr z, .nuzPokemonMansionFlag
	cp SEAFOAM_ISLANDS_1F
	jr z, .nuzSeafoamIslandsFlag
	cp DIGLETTS_CAVE
	jr z, .nuzDiglettsCaveFlag
	cp ROCKET_HIDEOUT_B1F ; Checks for victory road 2F and 3F
	jr c, .nuzVictoryRoadFlag
	cp SAFARI_ZONE_EAST ; Check pokemon mansion 2F, 3F, and B1F
	jr c, .nuzPokemonMansionFlag
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr c, .nuzSafariZoneFlag
	jr .nuzCeruleanCaveFlag ; Last remaining zone for nuzlocke is Cerulean Cave 1F 2F B1F

.nuzSeafoamIslandsFlag
	set SEAFOAM_ISLANDS_NUZ, [hl]
	ret
.nuzDiglettsCaveFlag
	set DIGLETTS_CAVE_NUZ, [hl]
	ret
.nuzPokemonMansionFlag
	set POKEMON_MANSION_NUZ, [hl]
	ret
.nuzSafariZoneFlag
	set SAFARI_ZONE_NUZ, [hl]
	ret
.nuzCeruleanCaveFlag
	set CERULEAN_CAVE_NUZ, [hl]
	ret

checkNuzlockeStatus::
	ld hl, wNuzlockeRegions
	ld a, [wCurMap]
	cp INDIGO_PLATEAU
	jr nc, .routeRegion1
	cp PALLET_TOWN
	jr z, .nuzPalletTown
	cp VIRIDIAN_CITY
	jr z, .nuzViridianCity
	cp CERULEAN_CITY
	jr z, .nuzCeruleanCity
	cp VERMILION_CITY
	jr z, .nuzVermilionCity
	cp VERMILION_DOCK
	jr z, .nuzVermilionCity
	cp CELADON_CITY
	jr z, .nuzCeladonCity
	cp FUCHSIA_CITY
	jr z, .nuzFuchsiaCity
	cp CINNABAR_ISLAND
	jr z, .nuzCinnabarIsland
        
.nuzPalletTown
	bit PALLET_TOWN_NUZ, [hl]	
	ret
.nuzViridianCity
	bit VIRIDIAN_CITY_NUZ, [hl]	
	ret
.nuzCeruleanCity
	bit CERULEAN_CITY_NUZ, [hl]	
	ret
.nuzVermilionCity
	bit VERMILION_CITY_NUZ, [hl]	
	ret
.nuzCeladonCity
	bit CELADON_CITY_NUZ, [hl]	
	ret
.nuzFuchsiaCity
	bit FUCHSIA_CITY_NUZ, [hl]
	ret
.nuzCinnabarIsland
	bit CINNABAR_ISLAND_NUZ, [hl]
	ret

.routeRegion1
	inc hl
	cp ROUTE_8
	jr nc, .routeRegion2
	cp SAFFRON_CITY
	jr z, .nuzSaffronCity
	cp ROUTE_1
	jr z, .nuzRoute1
	cp ROUTE_2
	jr z, .nuzRoute2
	cp ROUTE_3
	jr z, .nuzRoute3
	cp ROUTE_4
	jr z, .nuzRoute4
	cp ROUTE_5
	jr z, .nuzRoute5
	cp ROUTE_6
	jr z, .nuzRoute6
	cp ROUTE_7
	jr z, .nuzRoute7

.nuzSaffronCity
	bit SAFFRON_CITY_NUZ, [hl]	
	ret	
.nuzRoute1
	bit ROUTE_1_NUZ, [hl]	
	ret
.nuzRoute2
	bit ROUTE_2_NUZ, [hl]
	ret
.nuzRoute3
	bit ROUTE_3_NUZ, [hl]
	ret
.nuzRoute4
	bit ROUTE_4_NUZ, [hl]
	ret
.nuzRoute5
	bit ROUTE_5_NUZ, [hl]
	ret
.nuzRoute6
	bit ROUTE_6_NUZ, [hl]
	ret
.nuzRoute7
	bit ROUTE_7_NUZ, [hl]
	ret

.routeRegion2
	inc hl
	cp ROUTE_16
	jr nc, .routeRegion3
	cp ROUTE_8
	jr z, .nuzRoute8
	cp ROUTE_9
	jr z, .nuzRoute9
	cp ROUTE_10
	jr z, .nuzRoute10
	cp ROUTE_11
	jr z, .nuzRoute11
	cp ROUTE_12
	jr z, .nuzRoute12
	cp ROUTE_13
	jr z, .nuzRoute13
	cp ROUTE_14
	jr z, .nuzRoute14
	cp ROUTE_15
	jr z, .nuzRoute15

.nuzRoute8
	bit ROUTE_8_NUZ, [hl]
	ret
.nuzRoute9
	bit ROUTE_9_NUZ, [hl]
	ret
.nuzRoute10
	bit ROUTE_10_NUZ, [hl]
	ret
.nuzRoute11
	bit ROUTE_11_NUZ, [hl]
	ret
.nuzRoute12
	bit ROUTE_12_NUZ, [hl]
	ret
.nuzRoute13
	bit ROUTE_13_NUZ, [hl]
	ret
.nuzRoute14
	bit ROUTE_14_NUZ, [hl]
	ret
.nuzRoute15
	bit ROUTE_15_NUZ, [hl]
	ret

.routeRegion3
	inc hl
	cp ROUTE_24
	jr nc, .routeRegion4
	cp ROUTE_16
	jr z, .nuzRoute16
	cp ROUTE_17
	jr z, .nuzRoute17
	cp ROUTE_18
	jr z, .nuzRoute18
	cp ROUTE_19
	jr z, .nuzRoute19
	cp ROUTE_20
	jr z, .nuzRoute20
	cp ROUTE_21
	jr z, .nuzRoute21
	cp ROUTE_22
	jr z, .nuzRoute22
	cp ROUTE_23
	jr z, .nuzRoute23
       
.nuzRoute16
	bit ROUTE_16_NUZ, [hl]
	ret
.nuzRoute17
	bit ROUTE_17_NUZ, [hl]
	ret
.nuzRoute18
	bit ROUTE_18_NUZ, [hl]
	ret
.nuzRoute19
	bit ROUTE_19_NUZ, [hl]
	ret
.nuzRoute20
	bit ROUTE_20_NUZ, [hl]
	ret
.nuzRoute21
	bit ROUTE_21_NUZ, [hl]
	ret
.nuzRoute22
	bit ROUTE_22_NUZ, [hl]
	ret
.nuzRoute23
	bit ROUTE_23_NUZ, [hl]
	ret

.routeRegion4
	inc hl
	cp MR_FUJIS_HOUSE
	jr nc, .finalRegion
	cp ROUTE_24
	jr z, .nuzRoute24
	cp ROUTE_25
	jr z, .nuzRoute25
	cp VIRIDIAN_FOREST
	jr z, .nuzViridianForest
	cp CERULEAN_TRASHED_HOUSE ; This will check all the Mt. Moon floors
	jr c, .nuzMtMoon
	cp CERULEAN_GYM ; The gym counts for Cerulean city
	jp z, .nuzCeruleanCity
	CP ROCK_TUNNEL_1F
	jr z, .nuzRockTunnel
	cp ROCK_TUNNEL_B1F
	jr z, .nuzRockTunnel
	cp POWER_PLANT
	jr z, .nuzPowerPlant
	cp VICTORY_ROAD_1F
	jr z, .nuzVictoryRoad
	jr .nuzPokemonTower  ; Last remaining option is Pokemon Tower

.nuzRoute24
	bit ROUTE_24_NUZ, [hl]
	ret
.nuzRoute25
	bit ROUTE_25_NUZ, [hl]
	ret
.nuzViridianForest
	bit VIRIDIAN_FOREST_NUZ, [hl]
	ret
.nuzMtMoon
	bit MT_MOON_NUZ, [hl]
	ret
.nuzRockTunnel
	bit ROCK_TUNNEL_NUZ, [hl]
	ret
.nuzPowerPlant
	bit POWER_PLANT_NUZ, [hl]
	ret
.nuzVictoryRoad
	bit VICTORY_ROAD_NUZ, [hl]
	ret
.nuzPokemonTower
	bit POKEMON_TOWER_NUZ, [hl]
	ret

.finalRegion
	inc hl
	cp VERMILION_OLD_ROD_HOUSE
	jr c, .nuzSeafoamIslands  ; This checks B1F, B2F, B3F, and B4F
	cp POKEMON_MANSION_1F
	jr z, .nuzPokemonMansion
	cp SEAFOAM_ISLANDS_1F
	jr z, .nuzSeafoamIslands
	cp DIGLETTS_CAVE
	jr z, .nuzDiglettsCave
	cp ROCKET_HIDEOUT_B1F ; Checks for victory road 2F and 3F
	jr c, .nuzVictoryRoad
	cp SAFARI_ZONE_EAST ; Check pokemon mansion 2F, 3F, and B1F
	jr c, .nuzPokemonMansion
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr c, .nuzSafariZone
	jr .nuzCeruleanCave  ; Last remaining zone for nuzlocke is Cerulean Cave 1F 2F B1F

.nuzSeafoamIslands
	bit SEAFOAM_ISLANDS_NUZ, [hl]
	ret
.nuzDiglettsCave
	bit DIGLETTS_CAVE_NUZ, [hl]
	ret
.nuzPokemonMansion
	bit POKEMON_MANSION_NUZ, [hl]
	ret
.nuzSafariZone
	bit SAFARI_ZONE_NUZ, [hl]
	ret
.nuzCeruleanCave
	bit CERULEAN_CAVE_NUZ, [hl]
	ret

setFamilyCaught::
	ld a, [wExtraFlags]
	bit 4, a
	ret z ; return early if dupe clause is disabled
	ld a, [wTempMon]
	ld b, FLAG_SET
	call loadFamilyTable
	ret

checkFamilyCaught::
	ld a, [wExtraFlags]
	bit 4, a
	ret z ; return early if dupe clause is disabled
	ld a, [wEnemyMonSpecies]
	ld b, FLAG_TEST
	call loadFamilyTable
	ld a, c
	and a
	ret z ; return if not caught with carry cleared
	scf
	ret

loadFamilyTable:
	dec a
	ld e, a
	ld d, 0
	ld hl, FamilyBitTable
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, wCaughtFamilies
	predef FlagActionPredef
	ret

FamilyBitTable:
    db 0     ; 001 Bulbasaur
    db 0     ; 002 Ivysaur
    db 0     ; 003 Venusaur
    db 1     ; 004 Charmander
    db 1     ; 005 Charmeleon
    db 1     ; 006 Charizard
    db 2     ; 007 Squirtle
    db 2     ; 008 Wartortle
    db 2     ; 009 Blastoise
    db 3     ; 010 Caterpie
    db 3     ; 011 Metapod
    db 3     ; 012 Butterfree
    db 4     ; 013 Weedle
    db 4     ; 014 Kakuna
    db 4     ; 015 Beedrill
    db 5     ; 016 Pidgey
    db 5     ; 017 Pidgeotto
    db 5     ; 018 Pidgeot
    db 6     ; 019 Rattata
    db 6     ; 020 Raticate
    db 7     ; 021 Spearow
    db 7     ; 022 Fearow
    db 8     ; 023 Ekans
    db 8     ; 024 Arbok
    db 9     ; 025 Pikachu
    db 9     ; 026 Raichu
    db 10    ; 027 Sandshrew
    db 10    ; 028 Sandslash
    db 11    ; 029 Nidoran♀
    db 11    ; 030 Nidorina
    db 11    ; 031 Nidoqueen
    db 12    ; 032 Nidoran♂
    db 12    ; 033 Nidorino
    db 12    ; 034 Nidoking
    db 13    ; 035 Clefairy
    db 13    ; 036 Clefable
    db 14    ; 037 Vulpix
    db 14    ; 038 Ninetales
    db 15    ; 039 Jigglypuff
    db 15    ; 040 Wigglytuff
    db 16    ; 041 Zubat
    db 16    ; 042 Golbat
    db 17    ; 043 Oddish
    db 17    ; 044 Gloom
    db 17    ; 045 Vileplume
    db 18    ; 046 Paras
    db 18    ; 047 Parasect
    db 19    ; 048 Venonat
    db 19    ; 049 Venomoth
    db 20    ; 050 Diglett
    db 20    ; 051 Dugtrio
    db 21    ; 052 Meowth
    db 21    ; 053 Persian
    db 22    ; 054 Psyduck
    db 22    ; 055 Golduck
    db 23    ; 056 Mankey
    db 23    ; 057 Primeape
    db 24    ; 058 Growlithe
    db 24    ; 059 Arcanine
    db 25    ; 060 Poliwag
    db 25    ; 061 Poliwhirl
    db 25    ; 062 Poliwrath
    db 26    ; 063 Abra
    db 26    ; 064 Kadabra
    db 26    ; 065 Alakazam
    db 27    ; 066 Machop
    db 27    ; 067 Machoke
    db 27    ; 068 Machamp
    db 28    ; 069 Bellsprout
    db 28    ; 070 Weepinbell
    db 28    ; 071 Victreebel
    db 29    ; 072 Tentacool
    db 29    ; 073 Tentacruel
    db 30    ; 074 Geodude
    db 30    ; 075 Graveler
    db 30    ; 076 Golem
    db 31    ; 077 Ponyta
    db 31    ; 078 Rapidash
    db 32    ; 079 Slowpoke
    db 32    ; 080 Slowbro
    db 33    ; 081 Magnemite
    db 33    ; 082 Magneton
    db 34    ; 083 Farfetch'd
    db 35    ; 084 Doduo
    db 35    ; 085 Dodrio
    db 36    ; 086 Seel
    db 36    ; 087 Dewgong
    db 37    ; 088 Grimer
    db 37    ; 089 Muk
    db 38    ; 090 Shellder
    db 38    ; 091 Cloyster
    db 39    ; 092 Gastly
    db 39    ; 093 Haunter
    db 39    ; 094 Gengar
    db 40    ; 095 Onix
    db 41    ; 096 Drowzee
    db 41    ; 097 Hypno
    db 42    ; 098 Krabby
    db 42    ; 099 Kingler
    db 43    ; 100 Voltorb
    db 43    ; 101 Electrode
    db 44    ; 102 Exeggcute
    db 44    ; 103 Exeggutor
    db 45    ; 104 Cubone
    db 45    ; 105 Marowak
    db 46    ; 106 Hitmonlee
    db 47    ; 107 Hitmonchan
    db 48    ; 108 Lickitung
    db 49    ; 109 Koffing
    db 49    ; 110 Weezing
    db 50    ; 111 Rhyhorn
    db 50    ; 112 Rhydon
    db 51    ; 113 Chansey
    db 52    ; 114 Tangela
    db 53    ; 115 Kangaskhan
    db 54    ; 116 Horsea
    db 54    ; 117 Seadra
    db 55    ; 118 Goldeen
    db 55    ; 119 Seaking
    db 56    ; 120 Staryu
    db 56    ; 121 Starmie
    db 57    ; 122 Mr. Mime
    db 58    ; 123 Scyther
    db 59    ; 124 Jynx
    db 60    ; 125 Electabuzz
    db 61    ; 126 Magmar
    db 62    ; 127 Pinsir
    db 63    ; 128 Tauros
    db 64    ; 129 Magikarp
    db 64    ; 130 Gyarados
    db 65    ; 131 Lapras
    db 66    ; 132 Ditto
    db 67    ; 133 Eevee
    db 67    ; 134 Vaporeon
    db 67    ; 135 Jolteon
    db 67    ; 136 Flareon
    db 68    ; 137 Porygon
    db 69    ; 138 Omanyte
    db 69    ; 139 Omastar
    db 70    ; 140 Kabuto
    db 70    ; 141 Kabutops
    db 71    ; 142 Aerodactyl
    db 72    ; 143 Snorlax
    db 73    ; 144 Articuno
    db 74    ; 145 Zapdos
    db 75    ; 146 Moltres
    db 76    ; 147 Dratini
    db 76    ; 148 Dragonair
    db 76    ; 149 Dragonite
    db 77    ; 150 Mewtwo
    db 78    ; 151 Mew
