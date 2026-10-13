; Primary music channel timing in audio frames.
; Columns: first pass (intro + loop), repeating loop (0 for one-shot), channel.
; Calculated from note lengths, note_type speeds, tempo and fractional carry.
; Update this table when editing the corresponding music sequences.
SoundTestMusicTimings:
	dw 1920, 1920
	db 0 ; Music_PalletTown
	dw 1728, 1728
	db 0 ; Music_Pokecenter
	dw 1863, 1656
	db 0 ; Music_Gym
	dw 3456, 3456
	db 0 ; Music_Cities1
	dw 1998, 1776
	db 0 ; Music_Cities2
	dw 1836, 1728
	db 0 ; Music_Celadon
	dw 1296, 1296
	db 0 ; Music_Cinnabar
	dw 1404, 1404
	db 0 ; Music_Vermilion
	dw 2736, 2280
	db 0 ; Music_Lavender
	dw 1920, 1920
	db 0 ; Music_SSAnne
	dw 1428, 672
	db 0 ; Music_MeetProfOak
	dw 1008, 840
	db 0 ; Music_MeetRival
	dw 972, 384
	db 0 ; Music_MuseumGuy
	dw 445, 396
	db 0 ; Music_SafariZone
	dw 135, 0
	db 0 ; Music_PkmnHealed
	dw 1368, 1368
	db 0 ; Music_Routes1
	dw 1140, 1140
	db 0 ; Music_Routes2
	dw 1623, 1332
	db 0 ; Music_Routes3
	dw 1998, 1776
	db 0 ; Music_Routes4
	dw 1782, 1584
	db 0 ; Music_IndigoPlateau
	dw 3432, 2652
	db 0 ; Music_GymLeaderBattle
	dw 5796, 4956
	db 0 ; Music_TrainerBattle
	dw 2652, 1872
	db 0 ; Music_WildBattle
	dw 4452, 3612
	db 0 ; Music_FinalBattle
	dw 756, 672
	db 0 ; Music_DefeatedTrainer
	dw 756, 672
	db 0 ; Music_DefeatedWildMon
	dw 2184, 2016
	db 0 ; Music_DefeatedGymLeader
	dw 2835, 2592
	db 0 ; Music_TitleScreen
	dw 5880, 0
	db 0 ; Music_Credits
	dw 1680, 1344
	db 0 ; Music_HallOfFame
	dw 892, 840
	db 0 ; Music_OaksLab
	dw 396, 0
	db 0 ; Music_JigglypuffSong
	dw 2065, 2052
	db 0 ; Music_BikeRiding
	dw 1635, 1440
	db 0 ; Music_Surfing
	dw 2340, 2160
	db 0 ; Music_GameCorner
	dw 1305, 0
	db 0 ; Music_YellowIntro
	dw 4104, 3996
	db 0 ; Music_Dungeon1
	dw 3024, 3024
	db 0 ; Music_Dungeon2
	dw 4983, 4983
	db 0 ; Music_Dungeon3
	dw 2328, 2329
	db 0 ; Music_CinnabarMansion
	dw 3762, 3648
	db 0 ; Music_PokemonTower
	dw 3717, 3507
	db 0 ; Music_SilphCo
	dw 162, 93
	db 0 ; Music_MeetEvilTrainer
	dw 453, 372
	db 0 ; Music_MeetFemaleTrainer
	dw 504, 336
	db 0 ; Music_MeetMaleTrainer
	dw 1930, 1404
	db 0 ; Music_SurfingPikachu
	dw 1080, 864
	db 0 ; Music_MeetJessieJames
	dw 1680, 1260
	db 0 ; Music_YellowUnusedSong
	dw 3456, 3072
	db 2 ; Music_GBPrinter
	assert (@ - SoundTestMusicTimings) / 5 == 49
