; Fixed-width titles follow the category order in sound_test.asm.
IF DEF(_DEBUG)
SECTION "Debug Sound Names", ROMX
SoundTestNames:

SoundTestNames_music:
	db "Pallet Town       @" ; Music_PalletTown
	db "Pokemon Center    @" ; Music_Pokecenter
	db "Gym               @" ; Music_Gym
	db "Cities1           @" ; Music_Cities1
	db "Cities2           @" ; Music_Cities2
	db "Celadon           @" ; Music_Celadon
	db "Cinnabar          @" ; Music_Cinnabar
	db "Vermilion         @" ; Music_Vermilion
	db "Lavender          @" ; Music_Lavender
	db "SS Anne           @" ; Music_SSAnne
	db "Meet Prof Oak     @" ; Music_MeetProfOak
	db "Meet Rival        @" ; Music_MeetRival
	db "Museum Guy        @" ; Music_MuseumGuy
	db "Safari Zone       @" ; Music_SafariZone
	db "Pokemon Healed    @" ; Music_PkmnHealed
	db "Routes1           @" ; Music_Routes1
	db "Routes2           @" ; Music_Routes2
	db "Routes3           @" ; Music_Routes3
	db "Routes4           @" ; Music_Routes4
	db "Indigo Plateau    @" ; Music_IndigoPlateau
	db "Gym Leader Battle @" ; Music_GymLeaderBattle
	db "Trainer Battle    @" ; Music_TrainerBattle
	db "Wild Battle       @" ; Music_WildBattle
	db "Final Battle      @" ; Music_FinalBattle
	db "Beat Trainer      @" ; Music_DefeatedTrainer
	db "Beat Wild Mon     @" ; Music_DefeatedWildMon
	db "Beat Gym Leader   @" ; Music_DefeatedGymLeader
	db "Title Screen      @" ; Music_TitleScreen
	db "Credits           @" ; Music_Credits
	db "Hall of Fame      @" ; Music_HallOfFame
	db "Oaks Lab          @" ; Music_OaksLab
	db "Jigglypuff Song   @" ; Music_JigglypuffSong
	db "Bike Riding       @" ; Music_BikeRiding
	db "Surfing           @" ; Music_Surfing
	db "Game Corner       @" ; Music_GameCorner
	db "Yellow Intro      @" ; Music_YellowIntro
	db "Dungeon1          @" ; Music_Dungeon1
	db "Dungeon2          @" ; Music_Dungeon2
	db "Dungeon3          @" ; Music_Dungeon3
	db "Cinnabar Mansion  @" ; Music_CinnabarMansion
	db "Pokemon Tower     @" ; Music_PokemonTower
	db "Silph Co          @" ; Music_SilphCo
	db "Meet Evil Trainer @" ; Music_MeetEvilTrainer
	db "Meet Female       @" ; Music_MeetFemaleTrainer
	db "Meet Male         @" ; Music_MeetMaleTrainer
	db "Surfing Pikachu   @" ; Music_SurfingPikachu
	db "Meet Jessie/James @" ; Music_MeetJessieJames
	db "Yellow Unused Song@" ; Music_YellowUnusedSong
	db "GB Printer        @" ; Music_GBPrinter
	assert (@ - SoundTestNames_music) / 19 == 49

SoundTestNames_sfx:
	db "Get Item1         @" ; SFX_Get_Item1_1
	db "Get Item2         @" ; SFX_Get_Item2_1
	db "Tink              @" ; SFX_Tink_1
	db "Heal HP           @" ; SFX_Heal_HP_1
	db "Heal Ailment      @" ; SFX_Heal_Ailment_1
	db "Start Menu        @" ; SFX_Start_Menu_1
	db "Press AB          @" ; SFX_Press_AB_1
	db "Pokedex Rating    @" ; SFX_Pokedex_Rating_1
	db "Get Key Item      @" ; SFX_Get_Key_Item_1
	db "Poisoned          @" ; SFX_Poisoned_1
	db "Trade Machine     @" ; SFX_Trade_Machine_1
	db "Turn On PC        @" ; SFX_Turn_On_PC_1
	db "Turn Off PC       @" ; SFX_Turn_Off_PC_1
	db "Enter PC          @" ; SFX_Enter_PC_1
	db "Shrink            @" ; SFX_Shrink_1
	db "Switch            @" ; SFX_Switch_1
	db "Healing Machine   @" ; SFX_Healing_Machine_1
	db "Teleport Exit1    @" ; SFX_Teleport_Exit1_1
	db "Teleport Enter1   @" ; SFX_Teleport_Enter1_1
	db "Teleport Exit2    @" ; SFX_Teleport_Exit2_1
	db "Ledge             @" ; SFX_Ledge_1
	db "Teleport Enter2   @" ; SFX_Teleport_Enter2_1
	db "Fly               @" ; SFX_Fly_1
	db "Denied            @" ; SFX_Denied_1
	db "Arrow Tiles       @" ; SFX_Arrow_Tiles_1
	db "Push Boulder      @" ; SFX_Push_Boulder_1
	db "SS Anne Horn      @" ; SFX_SS_Anne_Horn_1
	db "Withdraw Deposit  @" ; SFX_Withdraw_Deposit_1
	db "Cut               @" ; SFX_Cut_1
	db "Go Inside         @" ; SFX_Go_Inside_1
	db "Swap              @" ; SFX_Swap_1
	db "59                @" ; SFX_59_1
	db "Purchase          @" ; SFX_Purchase_1
	db "Collision         @" ; SFX_Collision_1
	db "Go Outside        @" ; SFX_Go_Outside_1
	db "Save              @" ; SFX_Save_1
	db "Pokeflute         @" ; SFX_Pokeflute
	db "Safari Zone PA    @" ; SFX_Safari_Zone_PA
	db "Level Up          @" ; SFX_Level_Up
	db "Ball Toss         @" ; SFX_Ball_Toss
	db "Ball Poof         @" ; SFX_Ball_Poof
	db "Faint Thud        @" ; SFX_Faint_Thud
	db "Run               @" ; SFX_Run
	db "Dex Page Added    @" ; SFX_Dex_Page_Added
	db "Caught Mon        @" ; SFX_Caught_Mon
	db "Peck              @" ; SFX_Peck
	db "Faint Fall        @" ; SFX_Faint_Fall
	db "Battle 09         @" ; SFX_Battle_09
	db "Pound             @" ; SFX_Pound
	db "Battle 0B         @" ; SFX_Battle_0B
	db "Battle 0C         @" ; SFX_Battle_0C
	db "Battle 0D         @" ; SFX_Battle_0D
	db "Battle 0E         @" ; SFX_Battle_0E
	db "Battle 0F         @" ; SFX_Battle_0F
	db "Damage            @" ; SFX_Damage
	db "Not Very Effective@" ; SFX_Not_Very_Effective
	db "Battle 12         @" ; SFX_Battle_12
	db "Battle 13         @" ; SFX_Battle_13
	db "Battle 14         @" ; SFX_Battle_14
	db "Vine Whip         @" ; SFX_Vine_Whip
	db "Battle 16         @" ; SFX_Battle_16
	db "Battle 17         @" ; SFX_Battle_17
	db "Battle 18         @" ; SFX_Battle_18
	db "Battle 19         @" ; SFX_Battle_19
	db "Super Effective   @" ; SFX_Super_Effective
	db "Battle 1B         @" ; SFX_Battle_1B
	db "Battle 1C         @" ; SFX_Battle_1C
	db "Doubleslap        @" ; SFX_Doubleslap
	db "Battle 1E         @" ; SFX_Battle_1E
	db "Horn Drill        @" ; SFX_Horn_Drill
	db "Battle 20         @" ; SFX_Battle_20
	db "Battle 21         @" ; SFX_Battle_21
	db "Battle 22         @" ; SFX_Battle_22
	db "Battle 23         @" ; SFX_Battle_23
	db "Battle 24         @" ; SFX_Battle_24
	db "Battle 25         @" ; SFX_Battle_25
	db "Battle 26         @" ; SFX_Battle_26
	db "Battle 27         @" ; SFX_Battle_27
	db "Battle 28         @" ; SFX_Battle_28
	db "Battle 29         @" ; SFX_Battle_29
	db "Battle 2A         @" ; SFX_Battle_2A
	db "Battle 2B         @" ; SFX_Battle_2B
	db "Battle 2C         @" ; SFX_Battle_2C
	db "Psybeam           @" ; SFX_Psybeam
	db "Battle 2E         @" ; SFX_Battle_2E
	db "Battle 2F         @" ; SFX_Battle_2F
	db "Psychic M         @" ; SFX_Psychic_M
	db "Battle 31         @" ; SFX_Battle_31
	db "Battle 32         @" ; SFX_Battle_32
	db "Battle 33         @" ; SFX_Battle_33
	db "Battle 34         @" ; SFX_Battle_34
	db "Battle 35         @" ; SFX_Battle_35
	db "Battle 36         @" ; SFX_Battle_36
	db "Silph Scope       @" ; SFX_Silph_Scope
	db "Turn On PC Alt    @" ; SFX_Turn_On_PC_3
	db "Enter PC Alt      @" ; SFX_Enter_PC_3
	db "Save Alt          @" ; SFX_Save_3
	db "Intro Lunge       @" ; SFX_Intro_Lunge
	db "Intro Hip         @" ; SFX_Intro_Hip
	db "Intro Hop         @" ; SFX_Intro_Hop
	db "Intro Raise       @" ; SFX_Intro_Raise
	db "Intro Whoosh      @" ; SFX_Intro_Whoosh
	db "Slots Stop Wheel  @" ; SFX_Slots_Stop_Wheel
	db "Slots Reward      @" ; SFX_Slots_Reward
	db "Slots New Spin    @" ; SFX_Slots_New_Spin
	db "Shooting Star     @" ; SFX_Shooting_Star
	db "Surfing Jump      @" ; SFX_Surfing_Jump
	db "Surfing Flip      @" ; SFX_Surfing_Flip
	db "Surfing Crash     @" ; SFX_Surfing_Crash
	db "Unknown 802CC     @" ; SFX_Unknown_802cc
	db "Surfing Land      @" ; SFX_Surfing_Land
	assert (@ - SoundTestNames_sfx) / 19 == 111

SoundTestNames_cries:
	db "Cry 00            @" ; SFX_Cry00_1
	db "Cry 01            @" ; SFX_Cry01_1
	db "Cry 02            @" ; SFX_Cry02_1
	db "Cry 03            @" ; SFX_Cry03_1
	db "Cry 04            @" ; SFX_Cry04_1
	db "Cry 05            @" ; SFX_Cry05_1
	db "Cry 06            @" ; SFX_Cry06_1
	db "Cry 07            @" ; SFX_Cry07_1
	db "Cry 08            @" ; SFX_Cry08_1
	db "Cry 09            @" ; SFX_Cry09_1
	db "Cry 0A            @" ; SFX_Cry0A_1
	db "Cry 0B            @" ; SFX_Cry0B_1
	db "Cry 0C            @" ; SFX_Cry0C_1
	db "Cry 0D            @" ; SFX_Cry0D_1
	db "Cry 0E            @" ; SFX_Cry0E_1
	db "Cry 0F            @" ; SFX_Cry0F_1
	db "Cry 10            @" ; SFX_Cry10_1
	db "Cry 11            @" ; SFX_Cry11_1
	db "Cry 12            @" ; SFX_Cry12_1
	db "Cry 13            @" ; SFX_Cry13_1
	db "Cry 14            @" ; SFX_Cry14_1
	db "Cry 15            @" ; SFX_Cry15_1
	db "Cry 16            @" ; SFX_Cry16_1
	db "Cry 17            @" ; SFX_Cry17_1
	db "Cry 18            @" ; SFX_Cry18_1
	db "Cry 19            @" ; SFX_Cry19_1
	db "Cry 1A            @" ; SFX_Cry1A_1
	db "Cry 1B            @" ; SFX_Cry1B_1
	db "Cry 1C            @" ; SFX_Cry1C_1
	db "Cry 1D            @" ; SFX_Cry1D_1
	db "Cry 1E            @" ; SFX_Cry1E_1
	db "Cry 1F            @" ; SFX_Cry1F_1
	db "Cry 20            @" ; SFX_Cry20_1
	db "Cry 21            @" ; SFX_Cry21_1
	db "Cry 22            @" ; SFX_Cry22_1
	db "Cry 23            @" ; SFX_Cry23_1
	db "Cry 24            @" ; SFX_Cry24_1
	db "Cry 25            @" ; SFX_Cry25_1
	assert (@ - SoundTestNames_cries) / 19 == 38

SoundTestNames_instruments:
	db "Noise Inst 01     @" ; SFX_Noise_Instrument01_1
	db "Noise Inst 02     @" ; SFX_Noise_Instrument02_1
	db "Noise Inst 03     @" ; SFX_Noise_Instrument03_1
	db "Noise Inst 04     @" ; SFX_Noise_Instrument04_1
	db "Noise Inst 05     @" ; SFX_Noise_Instrument05_1
	db "Noise Inst 06     @" ; SFX_Noise_Instrument06_1
	db "Noise Inst 07     @" ; SFX_Noise_Instrument07_1
	db "Noise Inst 08     @" ; SFX_Noise_Instrument08_1
	db "Noise Inst 09     @" ; SFX_Noise_Instrument09_1
	db "Noise Inst 10     @" ; SFX_Noise_Instrument10_1
	db "Noise Inst 11     @" ; SFX_Noise_Instrument11_1
	db "Noise Inst 12     @" ; SFX_Noise_Instrument12_1
	db "Noise Inst 13     @" ; SFX_Noise_Instrument13_1
	db "Noise Inst 14     @" ; SFX_Noise_Instrument14_1
	db "Noise Inst 15     @" ; SFX_Noise_Instrument15_1
	db "Noise Inst 16     @" ; SFX_Noise_Instrument16_1
	db "Noise Inst 17     @" ; SFX_Noise_Instrument17_1
	db "Noise Inst 18     @" ; SFX_Noise_Instrument18_1
	db "Noise Inst 19     @" ; SFX_Noise_Instrument19_1
	assert (@ - SoundTestNames_instruments) / 19 == 19
ENDC
