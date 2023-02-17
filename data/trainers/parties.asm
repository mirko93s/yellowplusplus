TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw UnusedJugglerData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Rival1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Rival2Data
	dw Rival3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData
    
DEF end EQU 0 ; null-terminated

;	    lv, mon,        lv, mon,        lv, mon,        lv, mon,        lv, mon,        lv, mon,        end ; id - location
YoungsterData:
	db  13, RATTATA,    15, EKANS,                                                                      end ;  1 - Route 3
	db  16, SPEAROW,    17, SANDSHREW,                                                                  end ;  2 - Route 3
	db  15, RATTATA,    17, MACHOP,     16, ZUBAT,                                                      end ;  3 - Mt. Moon 1F
	db  18, RATICATE,   20, ARBOK,      22, GOLBAT,                                                     end ;  4 - Route 24
	db  22, RATTATA,    23, SPEAROW,                                                                    end ;  5 - Route 25
	db  23, SLOWPOKE,   24, SHELLDER,                                                                   end ;  6 - Route 25
	db  23, EKANS,      22, SANDSHREW,                                                                  end ;  7 - Route 25
	db  25, NIDORINO,                                                                                   end ;  8 - SS Anne 1F Rooms
	db  33, SANDSLASH,                                                                                  end ;  9 - Route 9
	db  25, EKANS,      24, KOFFING,                                                                    end ; 10 - Route 11
	db  26, SANDSHREW,  27, ZUBAT,                                                                      end ; 11 - Route 11
	db  26, RATTATA,    25, RATICATE,                                                                   end ; 12 - Route 11
	db  26, NIDORAN_M,  27, NIDORINO,                                                                   end ; 13 - Route 11

BugCatcherData:
	db   9, WEEDLE,      9, CATERPIE,                                                                   end ;  1 - Viridian Forest
	db  11, KAKUNA,     11, METAPOD,                                                                    end ;  2 - Viridian Forest
	db  13, BUTTERFREE, 13, BEEDRILL,                                                                   end ;  3 - Viridian Forest
	db  10, BUTTERFREE,                                                                                 end ;  4 - Viridian Forest
	db  13, PINSIR,                                                                                     end ;  5 - Route 3
	db  14, CATERPIE,   15, METAPOD,                                                                    end ;  6 - Route 3
	db  13, ODDISH,     14, PARAS,      15, VENONAT,                                                    end ;  7 - Route 3
	db  17, BUTTERFREE,                                                                                 end ;  8 - Mt. Moon 1F
	db  17, BEEDRILL,                                                                                   end ;  9 - Mt. Moon 1F
	db  19, BUTTERFREE, 21, SCYTHER,                                                                    end ; 10 - Route 24
	db  24, WEEDLE,     26, CATERPIE,   25, WEEDLE,                                                     end ; 11 - Route 6
	db  24, BUTTERFREE, 26, TANGELA,                                                                    end ; 12 - Route 6
	db  33, BUTTERFREE, 33, BEEDRILL,                                                                   end ; 13 - Route 9
	db  30, BEEDRILL,   32, BUTTERFREE, 34, VENONAT,                                                    end ; 14 - Route 9

LassData:
	db  10, NIDORAN_M,  10, NIDORAN_F,                                                                  end ;  1 - Viridian Forest
	db  13, JIGGLYPUFF, 13, JIGGLYPUFF, 15, EEVEE,                                                      end ;  2 - Route 3
	db  15, JIGGLYPUFF, 15, CLEFAIRY,                                                                   end ;  3 - Route 3
	db  15, WIGGLYTUFF, 15, CLEFABLE,                                                                   end ;  4 - Route 3
	db  16, ODDISH,     18, BELLSPROUT,                                                                 end ;  5 - Mt. Moon 1F
	db  16, CLEFAIRY,                                                                                   end ;  6 - Mt. Moon 1F
	db  41, PARAS,      43, PARAS,      45, PARASECT,                                                   end ;  7 - Route 4
	db  20, NIDORINO,   21, CLEFABLE,                                                                   end ;  8 - Route 24
	db  20, NIDORINA,   21, WIGGLYTUFF,                                                                 end ;  9 - Route 24
	db  23, NIDORINO,   23, NIDORINA,                                                                   end ; 10 - Route 25
	db  23, ODDISH,     24, PIDGEOTTO,                                                                  end ; 11 - Route 25
	db  25, PORYGON,    24, NIDORINA,                                                                   end ; 12 - SS Anne 1F Rooms
	db  25, RATTATA,    25, PIKACHU,                                                                    end ; 13 - SS Anne 2F Rooms
	db  36, NIDOQUEEN,                                                                                  end ; 14 - Route 8
	db  35, PERSIAN,    36, PIDGEOT,                                                                    end ; 15 - Route 8
	db  36, DRAGONAIR,  35, NIDOKING,   37, PERSIAN,                                                    end ; 16 - Route 8
	db  37, CLEFABLE,                                                                                   end ; 17 - Route 8
	db  37, BELLSPROUT, 36, WEEPINBELL, 38, VICTREEBEL,                                                 end ; 18 - Celadon Gym
	db  41, VILEPLUME,                                                                                  end ; 19 - Celadon Gym

SailorData:
	db  35, RAICHU,                                                                                     end ;  1 - Vermilion Gym
	db  25, OMANYTE,    25, KABUTO,                                                                     end ;  2 - SS Anne Bow
	db  25, MACHOP,     26, TENTACOOL,                                                                  end ;  3 - SS Anne Bow
	db  25, SHELLDER,   24, TENTACOOL,                                                                  end ;  4 - SS Anne B1F Rooms
	db  24, HORSEA,     26, SHELLDER,   28, TENTACOOL,                                                  end ;  5 - SS Anne B1F Rooms
	db  27, TENTACOOL,  26, STARYU,     25, HORSEA,                                                     end ;  6 - SS Anne B1F Rooms
	db  26, SQUIRTLE,   24, TENTACOOL,                                                                  end ;  7 - SS Anne B1F Rooms
	db  24, MACHOP,     26, MANKEY,     25, HITMONCHAN,                                                 end ;  8 - SS Anne B1F Rooms

JrTrainerMData:
	db  14, DIGLETT,    15, SANDSHREW,                                                                  end ;  1 - Pewter Gym
	db  23, POLIWAG,    22, GOLDEEN,                                                                    end ;  2 - Route 24
	db  20, PRIMEAPE,   21, MACHOKE,                                                                    end ;  3 - Route 24
	db  24, PIDGEOTTO,  26, GLOOM,                                                                      end ;  4 - Route 25
	db  25, SPEAROW,    26, DODUO,                                                                      end ;  5 - Route 6
	db  24, WEEPINBELL,                                                                                 end ;  6 - Route 6
	db  30, RATICATE,   31, DUGTRIO,    32, ARBOK,      32, SANDSLASH,                                  end ;  7 - Route 9
	db  53, NIDOKING,                                                                                   end ;  8 - Route 12

JrTrainerFData:
	db  25, GOLDEEN,                                                                                    end ;  1 - Cerulean Gym
	db  25, CUBONE,                                                                                     end ;  2 - Route 6
	db  25, PIDGEY,     26, SPEAROW,                                                                    end ;  3 - Route 6
	db  33, GLOOM,      31, WEEPINBELL,                                                                 end ;  4 - Route 9
	db  33, PERSIAN,                                                                                    end ;  5 - Route 9
	db  36, RAICHU,     35, CLEFABLE,                                                                   end ;  6 - Route 10
	db  38, PERSIAN,    39, PIDGEOT,                                                                    end ;  7 - Route 10
	db  35, WEEPINBELL, 37, CLEFABLE,                                                                   end ;  8 - Rock Tunnel 1F
	db  35, VILEPLUME,  37, PERSIAN,                                                                    end ;  9 - Rock Tunnel 1F
	db  36, PIDGEOT,    37, RATICATE,                                                                   end ; 10 - Rock Tunnel 1F
	db  37, WIGGLYTUFF, 37, PIDGEOT,                                                                    end ; 11 - Rock Tunnel B1F
	db  37, GLOOM,      34, IVYSAUR,                                                                    end ; 12 - Rock Tunnel B1F
	db  39, BULBASAUR,  41, IVYSAUR,    43, VENUSAUR,                                                   end ; 13 - Celadon Gym
	db  52, PIDGEOT,    51, RAICHU,     52, PERSIAN,                                                    end ; 14 - Route 13
	db  52, POLIWRATH,                                                                                  end ; 15 - Route 13
	db  52, PIDGEOT,    53, PIDGEOT,                                                                    end ; 16 - Route 13
	db  52, SEAKING,    51, SEADRA,                                                                     end ; 17 - Route 13
	db  54, VILEPLUME,                                                                                  end ; 18 - Route 15
	db  54, RAICHU,                                                                                     end ; 19 - Route 15
	db  54, CLEFABLE,                                                                                   end ; 20 - Route 15
	db  53, VICTREEBEL, 55, TANGELA,                                                                    end ; 21 - Route 15
	db  53, TENTACRUEL, 55, SEADRA,     56, DEWGONG,                                                    end ; 22 - Route 20
	db  56, SEAKING,    55, SEAKING,                                                                    end ; 23 - Route 20

PokemaniacData:
	db  40, RHYHORN,    39, LICKITUNG,                                                                  end ;  1 - Route 10
	db  37, MAROWAK,    38, SANDSLASH,                                                                  end ;  2 - Route 10
	db  35, CUBONE,     34, SLOWPOKE,                                                                   end ;  3 - Rock Tunnel 1F
	db  36, SLOWBRO,    37, MAROWAK,                                                                    end ;  4 - Rock Tunnel B1F
	db  36, CHARMELEON, 35, MAROWAK,                                                                    end ;  5 - Rock Tunnel B1F
	db  35, SLOWBRO,                                                                                    end ;  6 - Rock Tunnel B1F
	db  64, CHARIZARD,  66, LAPRAS,     67, LICKITUNG,                                                  end ;  7 - Victory Road 2F

SuperNerdData:
	db  17, MAGNEMITE,  16, VOLTORB,                                                                    end ;  1 - Mt. Moon 1F
	db  20, MAGNETON,   22, ELECTRODE,                                                                  end ;  2 - Mt. Moon B2F
	db  37, ELECTRODE,  36, MAGNETON,   35, ELECTABUZZ,                                                 end ;  3 - Route 8
	db  36, MUK,                                                                                        end ;  4 - Route 8
	db  36, WEEZING,                                                                                    end ;  5 - Route 8
	db  60, NINETALES,                                                                                  end ;  6 - Cinnabar Gym
	db  61, CHARIZARD,  60, ARCANINE,                                                                   end ;  7 - Cinnabar Gym
	db  61, RAPIDASH,                                                                                   end ;  8 - Cinnabar Gym
	db  62, ARCANINE,   63, RAPIDASH,                                                                   end ;  9 - Cinnabar Gym

HikerData:
	db  17, GEODUDE,    16, MACHOP,     17, ONIX,                                                       end ;  1 - Mt. Moon 1F
	db  22, MACHOP,     23, GEODUDE,                                                                    end ;  2 - Route 25
	db  24, GEODUDE,    22, MANKEY,     22, MACHOP,                                                     end ;  3 - Route 25
	db  23, GEODUDE,    23, ONIX,                                                                       end ;  4 - Route 25
	db  33, MACHOKE,    35, MACHOKE,                                                                    end ;  5 - Route 9
	db  34, GRAVELER,   33, MACHOKE,                                                                    end ;  6 - Route 9
	db  33, GRAVELER,   34, ONIX,                                                                       end ;  7 - Route 9
	db  36, MACHOKE,    37, ONIX,                                                                       end ;  8 - Route 10
	db  36, ONIX,       35, GOLEM,                                                                      end ;  9 - Route 10
	db  37, MACHAMP,                                                                                    end ; 10 - Rock Tunnel 1F
	db  36, KABUTO,     36, OMANYTE,                                                                    end ; 11 - Rock Tunnel 1F
	db  37, GOLEM,                                                                                      end ; 12 - Rock Tunnel 1F
	db  34, ONIX,       35, GRAVELER,                                                                   end ; 13 - Rock Tunnel B1F
	db  35, GRAVELER,   34, MACHOKE,                                                                    end ; 14 - Rock Tunnel B1F
	db  36, AERODACTYL,                                                                                 end ; 15 - Rock Tunnel B1F

BikerData:
	db  53, WEEZING,    51, MUK,        52, ARBOK,                                                      end ;  1 - Route 13
	db  53, MUK,        52, WEEZING,                                                                    end ;  2 - Route 14
	db  53, KOFFING,    54, WEEZING,                                                                    end ;  3 - Route 14
	db  53, GRIMER,     52, MUK,                                                                        end ;  4 - Route 14
	db  53, RHYHORN,    54, RHYDON,                                                                     end ;  5 - Route 14
	db  54, WEEZING,    53, MUK,                                                                        end ;  6 - Route 15
	db  54, MUK,        53, WEEZING,                                                                    end ;  7 - Route 15
	db  52, MUK,        51, WEEZING,                                                                    end ;  8 - Route 16
	db  53, DITTO,                                                                                      end ;  9 - Route 16
	db  52, MUK,        51, MUK,                                                                        end ; 10 - Route 16
	db  53, WEEZING,    54, WEEZING,                                                                    end ; 11 - Route 17
	db  53, MUK,                                                                                        end ; 12 - Route 17
	db  53, ELECTRODE,  52, MAGNETON,                                                                   end ; 13 - Route 17
	db  54, GROWLITHE,  53, VULPIX,                                                                     end ; 14 - Route 17
	db  54, WEEZING,    55, WEEZING,                                                                    end ; 15 - Route 17

BurglarData:
	db  60, ARCANINE,   61, NINETALES,                                                                  end ;  1 - Cinnabar Gym
	db  61, FLAREON,                                                                                    end ;  2 - Cinnabar Gym
	db  59, NINETALES,  62, ARCANINE,                                                                   end ;  3 - Cinnabar Gym
	db  57, CHARIZARD,                                                                                  end ;  4 - Mansion 2F
	db  58, NINETALES,                                                                                  end ;  5 - Mansion 3F
	db  57, ARCANINE,   59, RAPIDASH,                                                                   end ;  6 - Mansion B1F

EngineerData:
	db  23, MAGNETON,                                                                                   end ;  1 - Route 11
	db  21, MAGNETON,   22, RAICHU,                                                                     end ;  2 - Route 11

UnusedJugglerData:
; none

FisherData:
	db  26, GOLDEEN,    25, TENTACOOL,  24, VAPOREON,                                                   end ;  1 - SS Anne 2F Rooms
	db  25, TENTACOOL,  24, STARYU,     25, SHELLDER,                                                   end ;  2 - SS Anne B1F Rooms
	db  37, POLIWRATH,  36, SEAKING,                                                                    end ;  3 - Route 12
	db  38, TENTACRUEL, 37, SEAKING,                                                                    end ;  4 - Route 12
	db  37, SEAKING,    38, VAPOREON,                                                                   end ;  5 - Route 12
	db  37, POLIWRATH,  35, SEAKING,    36, SEADRA,                                                     end ;  6 - Route 12
	db  52, GYARADOS,                                                                                   end ;  7 - Route 12
	db  55, SEAKING,    54, SEAKING,                                                                    end ;  8 - Route 21
	db  55, GYARADOS,   52, GYARADOS,   53, GYARADOS,                                                   end ;  9 - Route 21
	db  56, CLOYSTER,                                                                                   end ; 10 - Route 21
	db  56, SEAKING,    55, SEAKING,                                                                    end ; 11 - Route 21

SwimmerData:
	db  24, HORSEA,     23, SHELLDER,                                                                   end ;  1 - Cerulean Gym
	db  54, TENTACRUEL, 55, CLOYSTER,                                                                   end ;  2 - Route 19
	db  54, SEADRA,     53, STARMIE,                                                                    end ;  3 - Route 19
	db  54, POLIWRATH,                                                                                  end ;  4 - Route 19
	db  54, TENTACRUEL, 53, SEADRA,                                                                     end ;  5 - Route 19
	db  55, SEAKING,                                                                                    end ;  6 - Route 19
	db  54, SEADRA,                                                                                     end ;  7 - Route 19
	db  55, TENTACRUEL,                                                                                 end ;  8 - Route 19
	db  55, SHELLDER,   54, CLOYSTER,                                                                   end ;  9 - Route 20
	db  56, STARMIE,                                                                                    end ; 10 - Route 20
	db  55, SEADRA,     54, SEADRA,                                                                     end ; 11 - Route 20
	db  56, SEADRA,     57, TENTACRUEL,                                                                 end ; 12 - Route 21
	db  56, STARMIE,                                                                                    end ; 13 - Route 21
	db  55, STARMIE,    56, BLASTOISE,                                                                  end ; 14 - Route 21
	db  55, POLIWRATH,  54, TENTACRUEL, 57, SEADRA,                                                     end ; 15 - Route 21

CueBallData:
	db  52, MACHAMP,                                                                                    end ;  1 - Route 16
	db  52, PRIMEAPE,                                                                                   end ;  2 - Route 16
	db  52, MACHAMP,                                                                                    end ;  3 - Route 16
	db  53, PRIMEAPE,                                                                                   end ;  4 - Route 17
	db  53, MACHAMP,                                                                                    end ;  5 - Route 17
	db  53, HITMONLEE,                                                                                  end ;  6 - Route 17
	db  53, PRIMEAPE,   55, MACHAMP,                                                                    end ;  7 - Route 17
	db  53, MACHAMP,    54, PRIMEAPE,                                                                   end ;  8 - Route 17
	db  56, HITMONCHAN,                                                                                 end ;  9 - Route 21

GamblerData:
	db  36, POLIWAG,    37, POLIWHIRL,  35, POLIWRATH,                                                  end ;  1 - Route 8
	db  36, ARCANINE,   35, NINETALES,                                                                  end ;  2 - Route 8
	db  26, POLIWHIRL,  27, HORSEA,                                                                     end ;  3 - Route 11
	db  25, WEEPINBELL, 26, GLOOM,                                                                      end ;  4 - Route 11
	db  26, VOLTORB,    25, MAGNEMITE,                                                                  end ;  5 - Route 11
	db  26, GROWLITHE,  25, VULPIX,                                                                     end ;  6 - Route 11

BeautyData:
	db  42, ODDISH,     41, GLOOM,      40, VILEPLUME,                                                  end ;  1 - Celadon Gym
	db  42, VICTREEBEL,                                                                                 end ;  2 - Celadon Gym
	db  42, EXEGGCUTE,  41, EXEGGUTOR,                                                                  end ;  3 - Celadon Gym
	db  52, RATICATE,                                                                                   end ;  4 - Route 13
	db  52, PERSIAN,                                                                                    end ;  5 - Route 13
	db  54, PIDGEOT,    55, WIGGLYTUFF,                                                                 end ;  6 - Route 15
	db  54, VENUSAUR,                                                                                   end ;  7 - Route 15
	db  54, POLIWRATH,  55, SEAKING,                                                                    end ;  8 - Route 19
	db  55, SEAKING,    54, SEAKING,                                                                    end ;  9 - Route 19
	db  55, STARMIE,    54, DEWGONG,                                                                    end ; 10 - Route 19
	db  55, SEADRA,     56, SEADRA,                                                                     end ; 11 - Route 20
	db  55, SEAKING,                                                                                    end ; 12 - Route 20
	db  53, CLOYSTER,   55, SEAKING,                                                                    end ; 13 - Route 20
	db  55, POLIWRATH,  54, SEAKING,                                                                    end ; 14 - Route 20

PsychicData:
	db  51, ABRA,       52, KADABRA,    50, ALAKAZAM,                                                   end ;  1 - Saffron Gym
	db  51, MR_MIME,    50, ALAKAZAM,                                                                   end ;  2 - Saffron Gym
	db  50, SLOWPOKE,   51, SLOWPOKE,   50, MR_MIME,                                                    end ;  3 - Saffron Gym
	db  52, SLOWBRO,                                                                                    end ;  4 - Saffron Gym

RockerData:
	db  34, VOLTORB,    36, ELECTRODE,                                                                  end ;  1 - Vermilion Gym
	db  52, RAICHU,     51, ELECTABUZZ,                                                                 end ;  2 - Route 12

JugglerData:
	db  46, ALAKAZAM,   47, MR_MIME,                                                                    end ;  1 - Silph Co. 5F
	db  55, GOLBAT,     54, MUK,                                                                        end ;  2 - Fuchsia Gym
	db  56, MUK,        54, WEEZING,    55, MUK,                                                        end ;  3 - Fuchsia Gym
	db  55, GOLBAT,     54, WEEZING,    55, MUK,                                                        end ;  4 - Fuchsia Gym
	db  56, MUK,        55, TENTACRUEL, 57, WEEZING,                                                    end ;  5 - Fuchsia Gym
	db  63, HYPNO,      62, ALAKAZAM,                                                                   end ;  6 - Victory Road 2F
	db  64, MR_MIME,                                                                                    end ;  7 - Victory Road 2F

TamerData:
	db  56, NIDOKING,   57, ARBOK,                                                                      end ;  1 - Fuchsia Gym
	db  56, ARBOK,      54, NIDOKING,   58, ARBOK,                                                      end ;  2 - Fuchsia Gym
	db  62, RHYDON,                                                                                     end ;  3 - Viridian Gym
	db  62, ARBOK,      60, TAUROS,                                                                     end ;  4 - Viridian Gym
	db  63, PERSIAN,    64, GOLDUCK,                                                                    end ;  5 - Victory Road 2F

BirdKeeperData:
	db  53, PIDGEOT,                                                                                    end ;  1 - Route 13
	db  50, FEAROW,     52, PIDGEOTTO,  54, PIDGEOT,    56, FEAROW,                                     end ;  2 - Route 13
	db  52, PIDGEOT,    51, FEAROW,                                                                     end ;  3 - Route 13
	db  52, DODRIO,     54, PIDGEOT,                                                                    end ;  4 - Route 14
	db  52, SPEAROW,    53, FEAROW,                                                                     end ;  5 - Route 14
	db  53, PIDGEOT,    55, FEAROW,                                                                     end ;  6 - Route 14
	db  53, DODRIO,     55, FEAROW,                                                                     end ;  7 - Route 14
	db  53, FARFETCHD,                                                                                  end ;  8 - Route 14
	db  54, FEAROW,                                                                                     end ;  9 - Route 14
	db  54, PIDGEOT,    55, FARFETCHD,  52, DODRIO,                                                     end ; 10 - Route 15
	db  53, DODRIO,     52, DODRIO,                                                                     end ; 11 - Route 15
	db  54, FEAROW,                                                                                     end ; 12 - Route 18
	db  54, DODRIO,                                                                                     end ; 13 - Route 18
	db  53, FEAROW,     55, FEAROW,                                                                     end ; 14 - Route 18
	db  55, FEAROW,     57, FEAROW,     54, PIDGEOT,                                                    end ; 15 - Route 20

BlackbeltData:
	db  50, HITMONLEE,  50, HITMONCHAN,                                                                 end ;  1 - Fighting Dojo Leader
	db  45, PRIMEAPE,                                                                                   end ;  2 - Fighting Dojo
	db  45, MACHAMP,                                                                                    end ;  3 - Fighting Dojo
	db  45, PRIMEAPE,                                                                                   end ;  4 - Fighting Dojo
	db  45, PRIMEAPE,                                                                                   end ;  5 - Fighting Dojo
	db  61, MACHAMP,                                                                                    end ;  6 - Viridian Gym
	db  62, MACHAMP,                                                                                    end ;  7 - Viridian Gym
	db  61, MACHAMP,                                                                                    end ;  8 - Viridian Gym
	db  60, MACHAMP,    62, MACHAMP,                                                                    end ;  9 - Victory Road 2F

ScientistData:
	db  45, MUK,        46, WEEZING,                                                                    end ;  1 - Silph Co. 2F
	db  45, ELECTRODE,  47, MAGNETON,                                                                   end ;  2 - Silph Co. 2F
	db  45, MAGNETON,   44, WEEZING,                                                                    end ;  3 - Silph Co. 3F
	db  45, ELECTRODE,  43, JOLTEON,                                                                    end ;  4 - Silph Co. 4F
	db  46, ELECTRODE,  44, MAGNETON,                                                                   end ;  5 - Silph Co. 5F
	db  46, ELECTRODE,  44, MAGNETON,   42, WEEZING,                                                    end ;  6 - Silph Co. 6F
	db  46, MAGNETON,   47, MUK,                                                                        end ;  7 - Silph Co. 7F
	db  47, MUK,        45, ELECTRODE,                                                                  end ;  8 - Silph Co. 8F
	db  47, JOLTEON,    46, DRAGONITE,                                                                  end ;  9 - Silph Co. 9F
	db  47, MAGNEMITE,  48, ELECTABUZZ,                                                                 end ; 10 - Silph Co. 10F
	db  57, WEEZING,    55, ELECTRODE,                                                                  end ; 11 - Mansion 1F
	db  57, MAGNETON,   56, JOLTEON,                                                                    end ; 12 - Mansion 3F
	db  58, MAGNETON,   59, ELECTRODE,                                                                  end ; 13 - Mansion B1F

RocketData:
	db  15, SANDSHREW,  16, RATTATA,    16, ZUBAT,                                                      end ;  1 - Mt. Moon B2F
	db  17, ZUBAT,      18, EKANS,                                                                      end ;  2 - Mt. Moon B2F
	db  16, RATTATA,    17, ZUBAT,                                                                      end ;  3 - Mt. Moon B2F
	db  25, MACHOKE,    24, DROWZEE,                                                                    end ;  4 - Cerulean City
	db  20, RATICATE,   21, GOLBAT,     22, ARBOK,                                                      end ;  5 - Route 24
	db  40, RATICATE,   38, GOLBAT,                                                                     end ;  6 - Game Corner
	db  40, HYPNO,      42, MACHOKE,                                                                    end ;  7 - Rocket Hideout B1F
	db  40, RATICATE,   41, RATICATE,                                                                   end ;  8 - Rocket Hideout B1F
	db  40, WEEZING,    40, MUK,                                                                        end ;  9 - Rocket Hideout B1F
	db  41, RATICATE,   43, RATICATE,                                                                   end ; 10 - Rocket Hideout B1F
	db  41, MUK,        42, WEEZING,                                                                    end ; 11 - Rocket Hideout B1F
	db  41, GOLBAT,     40, RATICATE,   41, GOLBAT,                                                     end ; 12 - Rocket Hideout B2F
	db  42, RATICATE,   43, HYPNO,                                                                      end ; 13 - Rocket Hideout B3F
	db  42, MACHOKE,    43, MACHOKE,                                                                    end ; 14 - Rocket Hideout B3F
	db  44, WEEZING,    41, GOLBAT,     43, MUK,                                                        end ; 15 - Rocket Hideout B4F
	db  45, MAROWAK,    46, GOLBAT,                                                                     end ; 16 - Silph Co. 2F
	db  45, GOLBAT,     43, RATICATE,   46, GOLBAT,                                                     end ; 17 - Silph Co. 2F
	db  41, RATICATE,   43, HYPNO,      45, RATICATE,                                                   end ; 18 - Silph Co. 3F
	db  44, MACHAMP,    46, HYPNO,                                                                      end ; 19 - Silph Co. 4F
	db  44, ARBOK,      46, SANDSLASH,                                                                  end ; 20 - Silph Co. 4F
	db  45, ARBOK,                                                                                      end ; 21 - Silph Co. 5F
	db  46, HYPNO,                                                                                      end ; 22 - Silph Co. 5F
	db  46, MACHOKE,    45, MACHAMP,                                                                    end ; 23 - Silph Co. 6F
	db  46, GOLBAT,     44, GOLBAT,                                                                     end ; 24 - Silph Co. 6F
	db  43, RATICATE,   45, ARBOK,      47, WEEZING,    49, GOLBAT,                                     end ; 25 - Silph Co. 7F
	db  45, CUBONE,     46, MAROWAK,                                                                    end ; 26 - Silph Co. 7F
	db  45, SANDSHREW,  47, SANDSLASH,                                                                  end ; 27 - Silph Co. 7F
	db  47, RATICATE,   46, GOLBAT,                                                                     end ; 28 - Silph Co. 8F
	db  47, WEEZING,    45, GOLBAT,                                                                     end ; 29 - Silph Co. 8F
	db  47, HYPNO,      45, MUK,                                                                        end ; 30 - Silph Co. 9F
	db  47, GOLBAT,     48, HYPNO,                                                                      end ; 31 - Silph Co. 9F
	db  47, MACHAMP,                                                                                    end ; 32 - Silph Co. 10F
	db  47, RATICATE,   45, GOLBAT,     48, ARBOK,                                                      end ; 33 - Silph Co. 11F
	db  18, EKANS,      19, MEOWTH,     18, KOFFING,                                                    end ; 34 - Jessie & James Mt. Moon B2F
	db  44, WEEZING,    45, MEOWTH,     44, ARBOK,                                                      end ; 35 - Jessie & James Rocket Hideout B4F
	db  49, MEOWTH,     48, ARBOK,      48, WEEZING,                                                    end ; 36 - Jessie & James Pokémon Tower 7F
	db  50, WEEZING,    50, ARBOK,      52, MEOWTH,                                                     end ; 37 - Jessie & James Silph Co. 11F

CooltrainerMData:
	db  60, SANDSLASH,  62, DUGTRIO,                                                                    end ;  1 - Viridian Gym
	db  61, RHYDON,                                                                                     end ;  2 - Viridian Gym
	db  61, NIDORINO,   63, NIDOKING,                                                                   end ;  3 - Viridian Gym
	db  63, VENUSAUR,   64, BLASTOISE,  65, CHARIZARD,                                                  end ;  4 - Victory Road 1F
	db  63, EXEGGUTOR,  61, CLOYSTER,   62, ARCANINE,                                                   end ;  5 - Victory Road 3F
	db  63, KINGLER,    62, TENTACRUEL, 65, BLASTOISE,                                                  end ;  6 - Victory Road 3F

CooltrainerFData:
	db  41, VICTREEBEL, 42, VILEPLUME,  40, VENUSAUR,                                                   end ;  1 - Celadon Gym
	db  64, PERSIAN,    62, NINETALES,                                                                  end ;  2 - Victory Road 1F
	db  63, VENOMOTH,   64, VILEPLUME,  63, VICTREEBEL,                                                 end ;  3 - Victory Road 3F
	db  63, PARASECT,   65, DEWGONG,    63, CHANSEY,                                                    end ;  4 - Victory Road 3F

GentlemanData:
	db  34, MAGNEMITE,  36, MAGNETON,                                                                   end ;  1 - Vermilion Gym
	db  26, GROWLITHE,  24, PONYTA,     26, CHARMANDER,                                                 end ;  2 - SS Anne 1F Rooms
	db  25, NIDORINO,   25, NIDORINA,                                                                   end ;  3 - SS Anne 1F Rooms
	db  35, RAICHU,                                                                                     end ;  4 - SS Anne 2F Rooms
	db  25, GROWLITHE,  26, PONYTA,                                                                     end ;  5 - SS Anne 2F Rooms

ChannelerData:
	db  38, GASTLY,                                                                                     end ;  1 - Pokémon Tower 3F
	db  39, GASTLY,                                                                                     end ;  2 - Pokémon Tower 3F
	db  38, GASTLY,                                                                                     end ;  3 - Pokémon Tower 3F
	db  39, GASTLY,                                                                                     end ;  4 - Pokémon Tower 4F
	db  38, GASTLY,     40, HAUNTER,                                                                    end ;  5 - Pokémon Tower 4F
	db  38, HAUNTER,                                                                                    end ;  6 - Pokémon Tower 4F
	db  39, HAUNTER,                                                                                    end ;  7 - Pokémon Tower 5F
	db  39, HAUNTER,                                                                                    end ;  8 - Pokémon Tower 5F
	db  40, HAUNTER,                                                                                    end ;  9 - Pokémon Tower 5F
	db  40, HAUNTER,                                                                                    end ; 10 - Pokémon Tower 5F
	db  40, GASTLY,     41, HAUNTER,    42, GENGAR,                                                     end ; 11 - Pokémon Tower 6F
	db  39, GENGAR,                                                                                     end ; 12 - Pokémon Tower 6F
	db  40, GENGAR,                                                                                     end ; 13 - Pokémon Tower 6F
	db  51, HAUNTER,    53, GENGAR,                                                                     end ; 14 - Saffron Gym
	db  52, GENGAR,                                                                                     end ; 15 - Saffron Gym
	db  53, GASTLY,     54, HAUNTER,    55, GENGAR,                                                     end ; 16 - Saffron Gym

ProfOakData: ; Unused ;todo
	db  66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, BLASTOISE,  70, GYARADOS,                   end
	db  66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, VENUSAUR,   70, GYARADOS,                   end
	db  66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, CHARIZARD,  70, GYARADOS,                   end

ChiefData:
; none

Rival1Data:
	db  5,  EEVEE,                                                                                      end
; Route 22
	db  8,  RATTATA,    9,  SPEAROW,    8,  PIDGEY,     10, EEVEE,                                      end
; Cerulean City
	db  21, PIDGEOTTO,  20, KADABRA,    21, RATICATE,   22, EEVEE,                                      end

Rival2Data:
; SS Anne 2F
	db  33, DODUO,      31, GRAVELER,   32, PIDGEOTTO,  32, KADABRA,    33, EEVEE,                      end
; Pokémon Tower 2F
	db  45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, JOLTEON,                    end
	db  45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, FLAREON,                    end
	db  45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, VAPOREON,                   end
; Silph Co. 7F
	db  52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, ARCANINE,   50, STARMIE,    55, JOLTEON,    end
	db  52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, EXEGGUTOR,  50, STARMIE,    55, FLAREON,    end
	db  52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, EXEGGUTOR,  50, ARCANINE,   55, VAPOREON,   end
; Route 22
	db  68, RHYDON,     71, ARCANINE,   73, TAUROS,     70, GYARADOS,   70, ALAKAZAM,   72, JOLTEON,    end
	db  68, RHYDON,     71, EXEGGUTOR,  73, TAUROS,     70, GYARADOS,   70, ALAKAZAM,   72, FLAREON,    end
	db  68, RHYDON,     71, EXEGGUTOR,  73, TAUROS,     70, ARCANINE,   70, ALAKAZAM,   72, VAPOREON,   end

Rival3Data:
	db  80, TAUROS,     79, ALAKAZAM,   81, ARCANINE,   78, GYARADOS,   82, JOLTEON,    80, MEWTWO,     end
	db  80, TAUROS,     79, ALAKAZAM,   81, EXEGGUTOR,  78, GYARADOS,   82, FLAREON,    80, MEWTWO,     end
	db  80, TAUROS,     79, ALAKAZAM,   81, EXEGGUTOR,  78, ARCANINE,   82, VAPOREON,   80, MEWTWO,     end

BrockData:
	db  12, AERODACTYL, 13, OMASTAR,    15, KABUTOPS,                                                   end

MistyData:
	db  25, VAPOREON,   25, POLIWRATH,  25, DEWGONG,    26, STARMIE,    25, LAPRAS,                     end

LtSurgeData:
	db  35, ELECTRODE,  34, MAGNETON,   35, JOLTEON,    34, ELECTABUZZ, 36, RAICHU,                     end

ErikaData:
	db  45, VILEPLUME,  44, VENUSAUR,   44, TANGELA,    45, VICTREEBEL, 46, EXEGGUTOR,                  end

KogaData:
	db  60, VENOMOTH,   59, WEEZING,    60, NIDOKING,   59, TENTACRUEL, 61, GENGAR,                     end

SabrinaData:
	db  55, JYNX,       54, SLOWBRO,    54, HYPNO,      55, ALAKAZAM,   56, MR_MIME,                    end

BlaineData:
	db  65, CHARIZARD,  64, RAPIDASH,   64, FLAREON,    65, ARCANINE,   66, MAGMAR,                     end

GiovanniData:
	db  48, PERSIAN,    46, DUGTRIO,    47, GENGAR,     46, TAUROS,     47, RHYDON,                     end ;  1 - Rocket Hideout B4F
	db  54, PERSIAN,    54, DUGTRIO,    56, GENGAR,     55, TAUROS,     57, RHYDON,                     end ;  2 - Silph Co. 11F
	db  66, PERSIAN,    67, DUGTRIO,    66, GENGAR,     68, TAUROS,     68, RHYDON,                     end ;  3 - Viridian Gym

LoreleiData:
	db  77, CLOYSTER,   78, VAPOREON,   76, SLOWBRO,    77, JYNX,       78, LAPRAS,                     end

BrunoData:
	db  78, ONIX,       77, HITMONCHAN, 77, HITMONLEE,  78, PRIMEAPE,   77, MACHAMP,                    end

AgathaData:
	db  79, GENGAR,     78, GOLBAT,     78, GENGAR,     78, ARBOK,      77, GENGAR,                     end

LanceData:
	db  80, GYARADOS,   80, CHARIZARD,  79, ELECTABUZZ, 80, SNORLAX,    79, AERODACTYL, 81, DRAGONITE,  end
