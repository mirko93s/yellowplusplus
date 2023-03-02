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
	dw JessieAndJamesData
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

;	    name@       lv, mon,        lv, mon,        lv, mon,        lv, mon,        lv, mon,        lv, mon,        end ; id - location
YoungsterData:
	db  "BEN@",     13, RATTATA,    15, EKANS,                                                                      end ;  1 - Route 3
	db  "CALVIN@",  16, SPEAROW,    17, SANDSHREW,                                                                  end ;  2 - Route 3
	db  "JOSH@",    15, RATTATA,    17, MACHOP,     16, ZUBAT,                                                      end ;  3 - Mt. Moon 1F
	db  "NICHOLAI@",18, RATICATE,   20, ARBOK,      22, GOLBAT,                                                     end ;  4 - Route 24
	db  "DAN@",     22, RATTATA,    23, SPEAROW,                                                                    end ;  5 - Route 25
	db  "BRET@",    23, SLOWPOKE,   24, SHELLDER,                                                                   end ;  6 - Route 25
	db  "DENNIS@",  23, EKANS,      22, SANDSHREW,                                                                  end ;  7 - Route 25
	db  "TYLER@",   25, NIDORINO,                                                                                   end ;  8 - SS Anne 1F Rooms
	db  "A.J.@",    33, SANDSHREW,                                                                                  end ;  9 - Route 9
	db  "EDDIE@",   25, EKANS,      24, KOFFING,                                                                    end ; 10 - Route 11
	db  "ROBBY@",   26, SANDSHREW,  27, ZUBAT,                                                                      end ; 11 - Route 11
	db  "RONNY@",   26, RATTATA,    25, RATICATE,                                                                   end ; 12 - Route 11
	db  "JOEY@",    26, NIDORAN_M,  27, NIDORINO,                                                                   end ; 13 - Route 11

BugCatcherData:
	db  "BRIAN@",    9, WEEDLE,      9, CATERPIE,                                                                   end ;  1 - Viridian Forest
	db  "DOUG@",    11, KAKUNA,     11, METAPOD,                                                                    end ;  2 - Viridian Forest
	db  "RICK@",    13, BUTTERFREE, 13, BEEDRILL,                                                                   end ;  3 - Viridian Forest
	db  "SAMMY@",   10, BUTTERFREE,                                                                                 end ;  4 - Viridian Forest
	db  "GREG@",    13, PINSIR,                                                                                     end ;  5 - Route 3
	db  "AARON@",   14, CATERPIE,   15, METAPOD,                                                                    end ;  6 - Route 3
	db  "EVAN@",    13, ODDISH,     14, PARAS,      15, VENONAT,                                                    end ;  7 - Route 3
	db  "KENT@",    17, BUTTERFREE,                                                                                 end ;  8 - Mt. Moon 1F
	db  "TERRY@",   17, BEEDRILL,                                                                                   end ;  9 - Mt. Moon 1F
	db  "CALE@",    19, BUTTERFREE, 21, SCYTHER,                                                                    end ; 10 - Route 24
	db  "BOBBY@",   24, WEEDLE,     26, CATERPIE,   25, WEEDLE,                                                     end ; 11 - Route 6
	db  "JAKE@",    24, BUTTERFREE, 26, TANGELA,                                                                    end ; 12 - Route 6
	db  "CONNER@",  33, BUTTERFREE, 33, BEEDRILL,                                                                   end ; 13 - Route 9
	db  "KENNY@",   30, BEEDRILL,   32, BUTTERFREE, 34, VENONAT,                                                    end ; 14 - Route 9

LassData:
	db  "JOANA@",   10, NIDORAN_M,  10, NIDORAN_F,                                                                  end ;  1 - Viridian Forest
	db  "DIANNE@",  13, JIGGLYPUFF, 13, JIGGLYPUFF, 15, EEVEE,                                                      end ;  2 - Route 3
	db  "CINDY@",   15, JIGGLYPUFF, 15, CLEFAIRY,                                                                   end ;  3 - Route 3
	db  "HANA@",    15, WIGGLYTUFF, 15, CLEFABLE,                                                                   end ;  4 - Route 3
	db  "HAZEL@",   16, ODDISH,     18, BELLSPROUT,                                                                 end ;  5 - Mt. Moon 1F
	db  "KATRINA@", 16, CLEFAIRY,                                                                                   end ;  6 - Mt. Moon 1F
	db  "MIRIAM@",  41, PARAS,      43, PARAS,      45, PARASECT,                                                   end ;  7 - Route 4
	db  "RELI@",    20, NIDORINO,   21, CLEFABLE,                                                                   end ;  8 - Route 24
	db  "ALI@",     20, NIDORINA,   21, WIGGLYTUFF,                                                                 end ;  9 - Route 24
	db  "JANICE@",  23, NIDORINO,   23, NIDORINA,                                                                   end ; 10 - Route 25
	db  "EMMA@",    23, ODDISH,     24, PIDGEOTTO,                                                                  end ; 11 - Route 25
	db  "CHEL@",    25, PORYGON,    24, NIDORINA,                                                                   end ; 12 - SS Anne 1F Rooms
	db  "AOI@",     25, RATTATA,    25, PIKACHU,                                                                    end ; 13 - SS Anne 2F Rooms
	db  "HALEY@",   36, NIDOQUEEN,                                                                                  end ; 14 - Route 8
	db  "JOCELYN@", 35, PERSIAN,    36, PIDGEOT,                                                                    end ; 15 - Route 8
	db  "SUMMER@",  36, DRAGONAIR,  35, NIDOKING,   37, PERSIAN,                                                    end ; 16 - Route 8
	db  "MILA@",    37, CLEFABLE,                                                                                   end ; 17 - Route 8
	db  "LINA@",    37, BELLSPROUT, 36, WEEPINBELL, 38, VICTREEBEL,                                                 end ; 18 - Celadon Gym
	db  "MEGAN@",   41, VILEPLUME,                                                                                  end ; 19 - Celadon Gym

SailorData:
	db  "DWAYNE@",  35, RAICHU,                                                                                     end ;  1 - Vermilion Gym
	db  "EDMOND@",  25, OMANYTE,    25, KABUTO,                                                                     end ;  2 - SS Anne Bow
	db  "DIRK@",    25, MACHOP,     26, TENTACOOL,                                                                  end ;  3 - SS Anne Bow
	db  "DWAYNE@",  25, SHELLDER,   24, TENTACOOL,                                                                  end ;  4 - SS Anne B1F Rooms
	db  "TREVOR@",  24, HORSEA,     26, SHELLDER,   28, TENTACOOL,                                                  end ;  5 - SS Anne B1F Rooms
	db  "ELDRITCH@",27, TENTACOOL,  26, STARYU,     25, HORSEA,                                                     end ;  6 - SS Anne B1F Rooms
	db  "CALUDE@",  26, SQUIRTLE,   24, TENTACOOL,                                                                  end ;  7 - SS Anne B1F Rooms
	db  "HUEY@",    24, MACHOP,     26, MANKEY,     25, HITMONCHAN,                                                 end ;  8 - SS Anne B1F Rooms

JrTrainerMData:
	db  "LIAM@",    14, DIGLETT,    15, SANDSHREW,                                                                  end ;  1 - Pewter Gym
	db  "SHANE@",   23, POLIWAG,    22, GOLDEEN,                                                                    end ;  2 - Route 24
	db  "KEVIN@",   20, PRIMEAPE,   21, MACHOKE,                                                                    end ;  3 - Route 24
	db  "DUSTIN@",  24, PIDGEOTTO,  26, GLOOM,                                                                      end ;  4 - Route 25
	db  "JEFF@",    25, SPEAROW,    26, DODUO,                                                                      end ;  5 - Route 6
	db  "JOE@",     24, WEEPINBELL,                                                                                 end ;  6 - Route 6
	db  "DREW@",    30, RATICATE,   31, DUGTRIO,    32, ARBOK,      32, SANDSLASH,                                  end ;  7 - Route 9
	db  "JUSTIN@",  53, NIDOKING,                                                                                   end ;  8 - Route 12

JrTrainerFData:
	db  "MISAKI@",  25, GOLDEEN,                                                                                    end ;  1 - Cerulean Gym
	db  "GISELLE@", 25, CUBONE,                                                                                     end ;  2 - Route 6
	db  "KELSEY@",  25, PIDGEY,     26, SPEAROW,                                                                    end ;  3 - Route 6
	db  "ALICIA@",  33, GLOOM,      31, WEEPINBELL,                                                                 end ;  4 - Route 9
	db  "CAITLIN@", 33, PERSIAN,                                                                                    end ;  5 - Route 9
	db  "CAROL@",   36, RAICHU,     35, CLEFABLE,                                                                   end ;  6 - Route 10
	db  "DALIA@",   38, PERSIAN,    39, PIDGEOT,                                                                    end ;  7 - Route 10
	db  "DANA@",    35, WEEPINBELL, 37, CLEFABLE,                                                                   end ;  8 - Rock Tunnel 1F
	db  "LEAH@",    35, VILEPLUME,  37, PERSIAN,                                                                    end ;  9 - Rock Tunnel 1F
	db  "MISSY@",   36, PIDGEOT,    37, RATICATE,                                                                   end ; 10 - Rock Tunnel 1F
	db  "NANCY@",   37, WIGGLYTUFF, 37, PIDGEOT,                                                                    end ; 11 - Rock Tunnel B1F
	db  "ROBIN@",   37, GLOOM,      34, IVYSAUR,                                                                    end ; 12 - Rock Tunnel B1F
	db  "TINA@",    39, BULBASAUR,  41, IVYSAUR,    43, VENUSAUR,                                                   end ; 13 - Celadon Gym
	db  "GWEN@",    52, PIDGEOT,    51, RAICHU,     52, PERSIAN,                                                    end ; 14 - Route 13
	db  "SUSIE@",   52, POLIWRATH,                                                                                  end ; 15 - Route 13
	db  "YAZMIN@",  52, PIDGEOT,    53, PIDGEOT,                                                                    end ; 16 - Route 13
	db  "AMARA@",   52, SEAKING,    51, SEADRA,                                                                     end ; 17 - Route 13
	db  "STACY@",   54, VILEPLUME,                                                                                  end ; 18 - Route 15
	db  "LIZ@",     54, RAICHU,                                                                                     end ; 19 - Route 15
	db  "TANYA@",   54, CLEFABLE,                                                                                   end ; 20 - Route 15
	db  "TIFFANY@", 53, VICTREEBEL, 55, TANGELA,                                                                    end ; 21 - Route 15
	db  "IRENE@",   53, TENTACRUEL, 55, SEADRA,     56, DEWGONG,                                                    end ; 22 - Route 20
	db  "KYLEE@",   56, SEAKING,    55, SEAKING,                                                                    end ; 23 - Route 20

PokemaniacData:
	db  "KIRK@",    40, RHYHORN,    39, LICKITUNG,                                                                  end ;  1 - Route 10
	db  "MARK@",    37, MAROWAK,    38, SANDSLASH,                                                                  end ;  2 - Route 10
	db  "ASHTON@",  35, CUBONE,     34, SLOWPOKE,                                                                   end ;  3 - Rock Tunnel 1F
	db  "COOPER@",  36, SLOWBRO,    37, MAROWAK,                                                                    end ;  4 - Rock Tunnel B1F
	db  "WINSTON@", 36, CHARMELEON, 35, MAROWAK,                                                                    end ;  5 - Rock Tunnel B1F
	db  "LEO@",     35, SLOWBRO,                                                                                    end ;  6 - Rock Tunnel B1F
	db  "DAWSON@",  64, CHARIZARD,  66, LAPRAS,     67, LICKITUNG,                                                  end ;  7 - Victory Road 2F

SuperNerdData:
	db  "JOVAN@",   17, MAGNEMITE,  16, VOLTORB,                                                                    end ;  1 - Mt. Moon 1F
	db  "MIGUEL@",  20, MAGNETON,   22, ELECTRODE,                                                                  end ;  2 - Mt. Moon B2F
	db  "AIDAN@",   37, ELECTRODE,  36, MAGNETON,   35, ELECTABUZZ,                                                 end ;  3 - Route 8
	db  "LESLIE@",  36, MUK,                                                                                        end ;  4 - Route 8
	db  "CONWAY@",  36, WEEZING,                                                                                    end ;  5 - Route 8
	db  "ERIK@",    60, NINETALES,                                                                                  end ;  6 - Cinnabar Gym
	db  "DEREK@",   61, CHARIZARD,  60, ARCANINE,                                                                   end ;  7 - Cinnabar Gym
	db  "MILES@",   61, RAPIDASH,                                                                                   end ;  8 - Cinnabar Gym
	db  "MARKUS@",  62, ARCANINE,   63, RAPIDASH,                                                                   end ;  9 - Cinnabar Gym

HikerData:
	db  "MARCOS@",  17, GEODUDE,    16, MACHOP,     17, ONIX,                                                       end ;  1 - Mt. Moon 1F
	db  "FRANKLIN@",22, MACHOP,     23, GEODUDE,                                                                    end ;  2 - Route 25
	db  "NOB@",     24, GEODUDE,    22, MANKEY,     22, MACHOP,                                                     end ;  3 - Route 25
	db  "IRWIN@",   23, GEODUDE,    23, ONIX,                                                                       end ;  4 - Route 25
	db  "ALAN@",    33, MACHOKE,    35, MACHOKE,                                                                    end ;  5 - Route 9
	db  "JEREMY@",  34, GRAVELER,   33, MACHOKE,                                                                    end ;  6 - Route 9
	db  "KENJI@",   33, GRAVELER,   34, ONIX,                                                                       end ;  7 - Route 9
	db  "CLARK@",   36, MACHOKE,    37, ONIX,                                                                       end ;  8 - Route 10
	db  "PAUL@",    36, ONIX,       35, GOLEM,                                                                      end ;  9 - Route 10
	db  "ALLEN@",   37, MACHAMP,                                                                                    end ; 10 - Rock Tunnel 1F
	db  "CLAUS@",   36, KABUTO,     36, OMANYTE,                                                                    end ; 11 - Rock Tunnel 1F
	db  "OLIVER@",  37, GOLEM,                                                                                      end ; 12 - Rock Tunnel 1F
	db  "ANDY@",    34, ONIX,       35, GRAVELER,                                                                   end ; 13 - Rock Tunnel B1F
	db  "DEXTER@",  35, GRAVELER,   34, MACHOKE,                                                                    end ; 14 - Rock Tunnel B1F
	db  "LIONEL@",  36, AERODACTYL,                                                                                 end ; 15 - Rock Tunnel B1F

BikerData:
	db  "PHILIP@",  53, WEEZING,    51, MUK,        52, ARBOK,                                                      end ;  1 - Route 13
	db  "CHARLES@", 53, MUK,        52, WEEZING,                                                                    end ;  2 - Route 14
	db  "GLENN@",   53, KOFFING,    54, WEEZING,                                                                    end ;  3 - Route 14
	db  "HARRIS@",  53, GRIMER,     52, MUK,                                                                        end ;  4 - Route 14
	db  "JOEL@",    53, RHYHORN,    54, RHYDON,                                                                     end ;  5 - Route 14
	db  "RILEY@",   54, WEEZING,    53, MUK,                                                                        end ;  6 - Route 15
	db  "ZEKE@",    54, MUK,        53, WEEZING,                                                                    end ;  7 - Route 15
	db  "STANLEY@", 52, MUK,        51, WEEZING,                                                                    end ;  8 - Route 16
	db  "DILLON@",  53, DITTO,                                                                                      end ;  9 - Route 16
	db  "TYRA@",    52, MUK,        51, MUK,                                                                        end ; 10 - Route 16
	db  "AIDEN@",   53, WEEZING,    54, WEEZING,                                                                    end ; 11 - Route 17
	db  "DALE@",    53, MUK,                                                                                        end ; 12 - Route 17
	db  "JACOB@",   53, ELECTRODE,  52, MAGNETON,                                                                   end ; 13 - Route 17
	db  "ERNEST@",  54, GROWLITHE,  53, VULPIX,                                                                     end ; 14 - Route 17
	db  "CHOPPER@", 54, WEEZING,    55, WEEZING,                                                                    end ; 15 - Route 17

BurglarData:
	db  "DUSTY@",   60, ARCANINE,   61, NINETALES,                                                                  end ;  1 - Cinnabar Gym
	db  "QUINN@",   61, FLAREON,                                                                                    end ;  2 - Cinnabar Gym
	db  "RAMON@",   59, NINETALES,  62, ARCANINE,                                                                   end ;  3 - Cinnabar Gym
	db  "ARNIE@",   57, CHARIZARD,                                                                                  end ;  4 - Mansion 2F
	db  "LEWIS@",   58, NINETALES,                                                                                  end ;  5 - Mansion 3F
	db  "SIMON@",   57, ARCANINE,   59, RAPIDASH,                                                                   end ;  6 - Mansion B1F

EngineerData:
	db  "BERNIE@",  23, MAGNETON,                                                                                   end ;  1 - Route 11
	db  "BRAXTON@", 21, MAGNETON,   22, RAICHU,                                                                     end ;  2 - Route 11

JessieAndJamesData:
	db  "JAMES@",   18, EKANS,      19, MEOWTH,     18, KOFFING,                                                    end ;  1 - Jessie & James Mt. Moon B2F
	db  "JAMES@",   44, WEEZING,    45, MEOWTH,     44, ARBOK,                                                      end ;  2 - Jessie & James Rocket Hideout B4F
	db  "JAMES@",   49, MEOWTH,     48, ARBOK,      48, WEEZING,                                                    end ;  3 - Jessie & James Pokémon Tower 7F
	db  "JAMES@",   50, WEEZING,    50, ARBOK,      52, MEOWTH,                                                     end ;  4 - Jessie & James Silph Co. 11F

FisherData:
	db  "BARNY@",   26, GOLDEEN,    25, TENTACOOL,  24, VAPOREON,                                                   end ;  1 - SS Anne 2F Rooms
	db  "DALE@",    25, TENTACOOL,  24, STARYU,     25, SHELLDER,                                                   end ;  2 - SS Anne B1F Rooms
	db  "ANDREW@",  37, POLIWRATH,  36, SEAKING,                                                                    end ;  3 - Route 12
	db  "CHIP@",    38, TENTACRUEL, 37, SEAKING,                                                                    end ;  4 - Route 12
	db  "ELLIOT@",  37, SEAKING,    38, VAPOREON,                                                                   end ;  5 - Route 12
	db  "HANK@",    37, POLIWRATH,  35, SEAKING,    36, SEADRA,                                                     end ;  6 - Route 12
	db  "NED@",     52, GYARADOS,                                                                                   end ;  7 - Route 12
	db  "NOILAN@",  55, SEAKING,    54, SEAKING,                                                                    end ;  8 - Route 21
	db  "WADE@",    55, GYARADOS,   52, GYARADOS,   53, GYARADOS,                                                   end ;  9 - Route 21
	db  "RONALD@",  56, CLOYSTER,                                                                                   end ; 10 - Route 21
	db  "WILTON@",  56, SEAKING,    55, SEAKING,                                                                    end ; 11 - Route 21

SwimmerData:
	db  "LUIS@",    24, HORSEA,     23, SHELLDER,                                                                   end ;  1 - Cerulean Gym
	db  "AXLE@",    54, TENTACRUEL, 55, CLOYSTER,                                                                   end ;  2 - Route 19
	db  "DAVID@",   54, SEADRA,     53, STARMIE,                                                                    end ;  3 - Route 19
	db  "REECE@",   54, POLIWRATH,                                                                                  end ;  4 - Route 19
	db  "RICHARD@", 54, TENTACRUEL, 53, SEADRA,                                                                     end ;  5 - Route 19
	db  "MARLON@",  55, SEAKING,                                                                                    end ;  6 - Route 19
	db  "JACOB@",   54, SEADRA,                                                                                     end ;  7 - Route 19
	db  "LOGAN@",   55, TENTACRUEL,                                                                                 end ;  8 - Route 19
	db  "DARRIN@",  55, SHELLDER,   54, CLOYSTER,                                                                   end ;  9 - Route 20
	db  "DOUGLAS@", 56, STARMIE,                                                                                    end ; 10 - Route 20
	db  "DEAN@",    55, SEADRA,     54, SEADRA,                                                                     end ; 11 - Route 20
	db  "JACK@",    56, SEADRA,     57, TENTACRUEL,                                                                 end ; 12 - Route 21
	db  "JEROME@",  56, STARMIE,                                                                                    end ; 13 - Route 21
	db  "ROLAND@",  55, STARMIE,    56, BLASTOISE,                                                                  end ; 14 - Route 21
	db  "SPENCER@", 55, POLIWRATH,  54, TENTACRUEL, 57, SEADRA,                                                     end ; 15 - Route 21

CueBallData:
	db  "KOJI@",    52, MACHAMP,                                                                                    end ;  1 - Route 16
	db  "ZEEK@",    52, PRIMEAPE,                                                                                   end ;  2 - Route 16
	db  "NICKY@",   52, MACHAMP,                                                                                    end ;  3 - Route 16
	db  "KIRBY@",   53, PRIMEAPE,                                                                                   end ;  4 - Route 17
	db  "RICKY@",   53, MACHAMP,                                                                                    end ;  5 - Route 17
	db  "REESE@",   53, HITMONLEE,                                                                                  end ;  6 - Route 17
	db  "JOHNNY@",  53, PRIMEAPE,   55, MACHAMP,                                                                    end ;  7 - Route 17
	db  "DAVE@",    53, MACHAMP,    54, PRIMEAPE,                                                                   end ;  8 - Route 17
	db  "MARTIN@",  56, HITMONCHAN,                                                                                 end ;  9 - Route 21

GamblerData:
	db  "RICH@",    36, POLIWAG,    37, POLIWHIRL,  35, POLIWRATH,                                                  end ;  1 - Route 8
	db  "STAN@",    36, ARCANINE,   35, NINETALES,                                                                  end ;  2 - Route 8
	db  "HUGO@",    26, POLIWHIRL,  27, HORSEA,                                                                     end ;  3 - Route 11
	db  "DARIAN@",  25, WEEPINBELL, 26, GLOOM,                                                                      end ;  4 - Route 11
	db  "JASPER@",  26, VOLTORB,    25, MAGNEMITE,                                                                  end ;  5 - Route 11
	db  "CARLOS@",  26, GROWLITHE,  25, VULPIX,                                                                     end ;  6 - Route 11

BeautyData:
	db  "LORI@",    42, ODDISH,     41, GLOOM,      40, VILEPLUME,                                                  end ;  1 - Celadon Gym
	db  "MAI@",     42, VICTREEBEL,                                                                                 end ;  2 - Celadon Gym
	db  "TAMIA@",   42, EXEGGCUTE,  41, EXEGGUTOR,                                                                  end ;  3 - Celadon Gym
	db  "SHEILA@",  52, RATICATE,                                                                                   end ;  4 - Route 13
	db  "LILY@",    52, PERSIAN,                                                                                    end ;  5 - Route 13
	db  "LANA@",    54, PIDGEOT,    55, WIGGLYTUFF,                                                                 end ;  6 - Route 15
	db  "VIOLET@",  54, VENUSAUR,                                                                                   end ;  7 - Route 15
	db  "ALICE@",   54, POLIWRATH,  55, SEAKING,                                                                    end ;  8 - Route 19
	db  "ANYA@",    55, SEAKING,    54, SEAKING,                                                                    end ;  9 - Route 19
	db  "CONNIE@",  55, STARMIE,    54, DEWGONG,                                                                    end ; 10 - Route 19
	db  "HANSOL@",  55, SEADRA,     56, SEADRA,                                                                     end ; 11 - Route 20
	db  "SHIRLEY@", 55, SEAKING,                                                                                    end ; 12 - Route 20
	db  "DAISY@",   53, CLOYSTER,   55, SEAKING,                                                                    end ; 13 - Route 20
	db  "NICOLE@",  55, POLIWRATH,  54, SEAKING,                                                                    end ; 14 - Route 20

PsychicData:
	db  "JOHAN@",   51, ABRA,       52, KADABRA,    50, ALAKAZAM,                                                   end ;  1 - Saffron Gym
	db  "PRESTON@", 51, MR_MIME,    50, ALAKAZAM,                                                                   end ;  2 - Saffron Gym
	db  "VLAD@",    50, SLOWPOKE,   51, SLOWPOKE,   50, MR_MIME,                                                    end ;  3 - Saffron Gym
	db  "RICKY@",   52, SLOWBRO,                                                                                    end ;  4 - Saffron Gym

RockerData:
	db  "BAILY@",   34, VOLTORB,    36, ELECTRODE,                                                                  end ;  1 - Vermilion Gym
	db  "LUCA@",    52, RAICHU,     51, ELECTABUZZ,                                                                 end ;  2 - Route 12

JugglerData:
	db  "DALTON@",  46, ALAKAZAM,   47, MR_MIME,                                                                    end ;  1 - Silph Co. 5F
	db  "HARRY@",   55, GOLBAT,     54, MUK,                                                                        end ;  2 - Fuchsia Gym
	db  "KIRK@",    56, MUK,        54, WEEZING,    55, MUK,                                                        end ;  3 - Fuchsia Gym
	db  "HORTON@",  55, GOLBAT,     54, WEEZING,    55, MUK,                                                        end ;  4 - Fuchsia Gym
	db  "FRITZ@",   56, MUK,        55, TENTACRUEL, 57, WEEZING,                                                    end ;  5 - Fuchsia Gym
	db  "NELSON@",  63, HYPNO,      62, ALAKAZAM,                                                                   end ;  6 - Victory Road 2F
	db  "GREGORY",  64, MR_MIME,                                                                                    end ;  7 - Victory Road 2F

TamerData:
	db  "EDGAR@",   56, NIDOKING,   57, ARBOK,                                                                      end ;  1 - Fuchsia Gym
	db  "PHIL@",    56, ARBOK,      54, NIDOKING,   58, ARBOK,                                                      end ;  2 - Fuchsia Gym
	db  "COLE@",    62, RHYDON,                                                                                     end ;  3 - Viridian Gym
	db  "JASON@",   62, ARBOK,      60, TAUROS,                                                                     end ;  4 - Viridian Gym
	db  "VINCENT@", 63, PERSIAN,    64, GOLDUCK,                                                                    end ;  5 - Victory Road 2F

BirdKeeperData:
	db  "ROBERT@",  53, PIDGEOT,                                                                                    end ;  1 - Route 13
	db  "PERRY@",   50, FEAROW,     52, PIDGEOTTO,  54, PIDGEOT,    56, FEAROW,                                     end ;  2 - Route 13
	db  "THEO@",    52, PIDGEOT,    51, FEAROW,                                                                     end ;  3 - Route 13
	db  "BENNY@",   52, DODRIO,     54, PIDGEOT,                                                                    end ;  4 - Route 14
	db  "DONALD@",  52, SPEAROW,    53, FEAROW,                                                                     end ;  5 - Route 14
	db  "ROY@",     53, PIDGEOT,    55, FEAROW,                                                                     end ;  6 - Route 14
	db  "HOWIE@",   53, DODRIO,     55, FEAROW,                                                                     end ;  7 - Route 14
	db  "BOB@",     53, FARFETCHD,                                                                                  end ;  8 - Route 14
	db  "BORIS@",   54, FEAROW,                                                                                     end ;  9 - Route 14
	db  "EDWIN@",   54, PIDGEOT,    55, FARFETCHD,  52, DODRIO,                                                     end ; 10 - Route 15
	db  "RALPH@",   53, DODRIO,     52, DODRIO,                                                                     end ; 11 - Route 15
	db  "JACOB@",   54, FEAROW,                                                                                     end ; 12 - Route 18
	db  "RAMIRO@",  54, DODRIO,                                                                                     end ; 13 - Route 18
	db  "WYATT@",   53, FEAROW,     55, FEAROW,                                                                     end ; 14 - Route 18
	db  "ROGER@",   55, FEAROW,     57, FEAROW,     54, PIDGEOT,                                                    end ; 15 - Route 20

BlackbeltData:
	db  "KOICHI@",  50, HITMONLEE,  50, HITMONCHAN,                                                                 end ;  1 - Fighting Dojo Leader
	db  "AARON@",   45, PRIMEAPE,                                                                                   end ;  2 - Fighting Dojo
	db  "HIDEKI@",  45, MACHAMP,                                                                                    end ;  3 - Fighting Dojo
	db  "HITOSHI@", 45, PRIMEAPE,                                                                                   end ;  4 - Fighting Dojo
	db  "MIKE@",    45, PRIMEAPE,                                                                                   end ;  5 - Fighting Dojo
	db  "TAKASHI@", 61, MACHAMP,                                                                                    end ;  6 - Viridian Gym
	db  "KIYO@",    62, MACHAMP,                                                                                    end ;  7 - Viridian Gym
	db  "CONNALLY@",61, MACHAMP,                                                                                    end ;  8 - Viridian Gym
	db  "DAISUKE@", 60, MACHAMP,    62, MACHAMP,                                                                    end ;  9 - Victory Road 2F

ScientistData:
	db  "BEAU@",    45, MUK,        46, WEEZING,                                                                    end ;  1 - Silph Co. 2F
	db  "CONNOR@",  45, ELECTRODE,  47, MAGNETON,                                                                   end ;  2 - Silph Co. 2F
	db  "ED@",      45, MAGNETON,   44, WEEZING,                                                                    end ;  3 - Silph Co. 3F
	db  "JERRY@",   45, ELECTRODE,  43, JOLTEON,                                                                    end ;  4 - Silph Co. 4F
	db  "JOSE@",    46, ELECTRODE,  44, MAGNETON,                                                                   end ;  5 - Silph Co. 5F
	db  "JOSHUA@",  46, ELECTRODE,  44, MAGNETON,   42, WEEZING,                                                    end ;  6 - Silph Co. 6F
	db  "PARKER@",  46, MAGNETON,   47, MUK,                                                                        end ;  7 - Silph Co. 7F
	db  "RODNEY@",  47, MUK,        45, ELECTRODE,                                                                  end ;  8 - Silph Co. 8F
	db  "TAYLOR@",  47, JOLTEON,    46, DRAGONITE,                                                                  end ;  9 - Silph Co. 9F
	db  "TRAVIS@",  47, MAGNEMITE,  48, ELECTABUZZ,                                                                 end ; 10 - Silph Co. 10F
	db  "BRAYDON@", 57, WEEZING,    55, ELECTRODE,                                                                  end ; 11 - Mansion 1F
	db  "IVAN@",    57, MAGNETON,   56, JOLTEON,                                                                    end ; 12 - Mansion 3F
	db  "TED@",     58, MAGNETON,   59, ELECTRODE,                                                                  end ; 13 - Mansion B1F

RocketData:
	db  "GRUNT@",   15, SANDSHREW,  16, RATTATA,    16, ZUBAT,                                                      end ;  1 - Mt. Moon B2F
	db  "GRUNT@",   17, ZUBAT,      18, EKANS,                                                                      end ;  2 - Mt. Moon B2F
	db  "GRUNT@",   16, RATTATA,    17, ZUBAT,                                                                      end ;  3 - Mt. Moon B2F
	db  "GRUNT@",   25, MACHOKE,    24, DROWZEE,                                                                    end ;  4 - Cerulean City
	db  "GRUNT@",   20, RATICATE,   21, GOLBAT,     22, ARBOK,                                                      end ;  5 - Route 24
	db  "GRUNT@",   40, RATICATE,   38, GOLBAT,                                                                     end ;  6 - Game Corner
	db  "GRUNT@",   40, HYPNO,      42, MACHOKE,                                                                    end ;  7 - Rocket Hideout B1F
	db  "GRUNT@",   40, RATICATE,   41, RATICATE,                                                                   end ;  8 - Rocket Hideout B1F
	db  "GRUNT@",   40, WEEZING,    40, MUK,                                                                        end ;  9 - Rocket Hideout B1F
	db  "GRUNT@",   41, RATICATE,   43, RATICATE,                                                                   end ; 10 - Rocket Hideout B1F
	db  "GRUNT@",   41, MUK,        42, WEEZING,                                                                    end ; 11 - Rocket Hideout B1F
	db  "GRUNT@",   41, GOLBAT,     40, RATICATE,   41, GOLBAT,                                                     end ; 12 - Rocket Hideout B2F
	db  "GRUNT@",   42, RATICATE,   43, HYPNO,                                                                      end ; 13 - Rocket Hideout B3F
	db  "GRUNT@",   42, MACHOKE,    43, MACHOKE,                                                                    end ; 14 - Rocket Hideout B3F
	db  "GRUNT@",   44, WEEZING,    41, GOLBAT,     43, MUK,                                                        end ; 15 - Rocket Hideout B4F
	db  "GRUNT@",   45, MAROWAK,    46, GOLBAT,                                                                     end ; 16 - Silph Co. 2F
	db  "GRUNT@",   45, GOLBAT,     43, RATICATE,   46, GOLBAT,                                                     end ; 17 - Silph Co. 2F
	db  "GRUNT@",   41, RATICATE,   43, HYPNO,      45, RATICATE,                                                   end ; 18 - Silph Co. 3F
	db  "GRUNT@",   44, MACHAMP,    46, HYPNO,                                                                      end ; 19 - Silph Co. 4F
	db  "GRUNT@",   44, ARBOK,      46, SANDSLASH,                                                                  end ; 20 - Silph Co. 4F
	db  "GRUNT@",   45, ARBOK,                                                                                      end ; 21 - Silph Co. 5F
	db  "GRUNT@",   46, HYPNO,                                                                                      end ; 22 - Silph Co. 5F
	db  "GRUNT@",   46, MACHOKE,    45, MACHAMP,                                                                    end ; 23 - Silph Co. 6F
	db  "GRUNT@",   46, GOLBAT,     44, GOLBAT,                                                                     end ; 24 - Silph Co. 6F
	db  "GRUNT@",   43, RATICATE,   45, ARBOK,      47, WEEZING,    49, GOLBAT,                                     end ; 25 - Silph Co. 7F
	db  "GRUNT@",   45, CUBONE,     46, MAROWAK,                                                                    end ; 26 - Silph Co. 7F
	db  "GRUNT@",   45, SANDSHREW,  47, SANDSLASH,                                                                  end ; 27 - Silph Co. 7F
	db  "GRUNT@",   47, RATICATE,   46, GOLBAT,                                                                     end ; 28 - Silph Co. 8F
	db  "GRUNT@",   47, WEEZING,    45, GOLBAT,                                                                     end ; 29 - Silph Co. 8F
	db  "GRUNT@",   47, HYPNO,      45, MUK,                                                                        end ; 30 - Silph Co. 9F
	db  "GRUNT@",   47, GOLBAT,     48, HYPNO,                                                                      end ; 31 - Silph Co. 9F
	db  "GRUNT@",   47, MACHAMP,                                                                                    end ; 32 - Silph Co. 10F
	db  "GRUNT@",   47, RATICATE,   45, GOLBAT,     48, ARBOK,                                                      end ; 33 - Silph Co. 11F

CooltrainerMData:
	db  "SAMUEL@",  60, SANDSLASH,  62, DUGTRIO,                                                                    end ;  1 - Viridian Gym
	db  "YUJI@",    61, RHYDON,                                                                                     end ;  2 - Viridian Gym
	db  "ZACH@",    61, NIDORINO,   63, NIDOKING,                                                                   end ;  3 - Viridian Gym
	db  "COLBY@",   63, VENUSAUR,   64, BLASTOISE,  65, CHARIZARD,                                                  end ;  4 - Victory Road 1F
	db  "GEORGE@",  63, EXEGGUTOR,  61, CLOYSTER,   62, ARCANINE,                                                   end ;  5 - Victory Road 3F
	db  "COREY@",   63, KINGLER,    62, TENTACRUEL, 65, BLASTOISE,                                                  end ;  6 - Victory Road 3F

CooltrainerFData:
	db  "MARY@",    41, VICTREEBEL, 42, VILEPLUME,  40, VENUSAUR,                                                   end ;  1 - Celadon Gym
	db  "ALEXA@",   64, PERSIAN,    62, NINETALES,                                                                  end ;  2 - Victory Road 1F
	db  "ANNIE@",   63, VENOMOTH,   64, VILEPLUME,  63, VICTREEBEL,                                                 end ;  3 - Victory Road 3F
	db  "NAOMI@",   63, PARASECT,   65, DEWGONG,    63, CHANSEY,                                                    end ;  4 - Victory Road 3F

GentlemanData:
	db  "TUCKER@",  34, MAGNEMITE,  36, MAGNETON,                                                                   end ;  1 - Vermilion Gym
	db  "ARTHUR@",  26, GROWLITHE,  24, PONYTA,     26, CHARMANDER,                                                 end ;  2 - SS Anne 1F Rooms
	db  "BROOKS@",  25, NIDORINO,   25, NIDORINA,                                                                   end ;  3 - SS Anne 1F Rooms
	db  "LAMAR@",   35, RAICHU,                                                                                     end ;  4 - SS Anne 2F Rooms
	db  "THOMAS@",  25, GROWLITHE,  26, PONYTA,                                                                     end ;  5 - SS Anne 2F Rooms

ChannelerData:
	db  "ANGELICA@",38, GASTLY,                                                                                     end ;  1 - Pokémon Tower 3F
	db  "CARLY@",   39, GASTLY,                                                                                     end ;  2 - Pokémon Tower 3F
	db  "EMILIA@",  38, GASTLY,                                                                                     end ;  3 - Pokémon Tower 3F
	db  "HOPE@",    39, GASTLY,                                                                                     end ;  4 - Pokémon Tower 4F
	db  "JANAE@",   38, GASTLY,     40, HAUNTER,                                                                    end ;  5 - Pokémon Tower 4F
	db  "JENNIFER@",38, HAUNTER,                                                                                    end ;  6 - Pokémon Tower 4F
	db  "JODY@",    39, HAUNTER,                                                                                    end ;  7 - Pokémon Tower 5F
	db  "KARINA@",  39, HAUNTER,                                                                                    end ;  8 - Pokémon Tower 5F
	db  "LAUREL@",  40, HAUNTER,                                                                                    end ;  9 - Pokémon Tower 5F
	db  "PATRICIA@",40, HAUNTER,                                                                                    end ; 10 - Pokémon Tower 5F
	db  "PAULA@",   40, GASTLY,     41, HAUNTER,    42, GENGAR,                                                     end ; 11 - Pokémon Tower 6F
	db  "RUTH@",    39, GENGAR,                                                                                     end ; 12 - Pokémon Tower 6F
	db  "TAMMY@",   40, GENGAR,                                                                                     end ; 13 - Pokémon Tower 6F
	db  "IMARI@",   51, HAUNTER,    53, GENGAR,                                                                     end ; 14 - Saffron Gym
	db  "STACY@",   52, GENGAR,                                                                                     end ; 15 - Saffron Gym
	db  "TASHA@",   53, GASTLY,     54, HAUNTER,    55, GENGAR,                                                     end ; 16 - Saffron Gym

ProfOakData: ; Unused ;todo
	db  "PROF.OAK@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, BLASTOISE,  70, GYARADOS,                   end
	db  "PROF.OAK@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, VENUSAUR,   70, GYARADOS,                   end
	db  "PROF.OAK@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, CHARIZARD,  70, GYARADOS,                   end

ChiefData:
; none

Rival1Data:
	db  "<RIVAL>@", 5,  EEVEE,                                                                                      end
; Route 22
	db  "<RIVAL>@", 8,  RATTATA,    9,  SPEAROW,    8,  PIDGEY,     10, EEVEE,                                      end
; Cerulean City
	db  "<RIVAL>@", 21, PIDGEOTTO,  20, KADABRA,    21, RATICATE,   22, EEVEE,                                      end

Rival2Data:
; SS Anne 2F
	db  "<RIVAL>@", 33, DODUO,      31, GRAVELER,   32, PIDGEOTTO,  32, KADABRA,    33, EEVEE,                      end
; Pokémon Tower 2F
	db  "<RIVAL>@", 45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, JOLTEON,                    end
	db  "<RIVAL>@", 45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, FLAREON,                    end
	db  "<RIVAL>@", 45, PIDGEOT,    43, GOLEM,      42, ALAKAZAM,   43, SANDSLASH,  45, VAPOREON,                   end
; Silph Co. 7F
	db  "<RIVAL>@", 52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, ARCANINE,   50, STARMIE,    55, JOLTEON,    end
	db  "<RIVAL>@", 52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, EXEGGUTOR,  50, STARMIE,    55, FLAREON,    end
	db  "<RIVAL>@", 52, SANDSLASH,  53, DODRIO,     51, ALAKAZAM,   50, EXEGGUTOR,  50, ARCANINE,   55, VAPOREON,   end
; Route 22
	db  "<RIVAL>@", 68, RHYDON,     71, ARCANINE,   73, TAUROS,     70, GYARADOS,   70, ALAKAZAM,   72, JOLTEON,    end
	db  "<RIVAL>@", 68, RHYDON,     71, EXEGGUTOR,  73, TAUROS,     70, GYARADOS,   70, ALAKAZAM,   72, FLAREON,    end
	db  "<RIVAL>@", 68, RHYDON,     71, EXEGGUTOR,  73, TAUROS,     70, ARCANINE,   70, ALAKAZAM,   72, VAPOREON,   end

Rival3Data:
	db  "<RIVAL>@", 80, TAUROS,     79, ALAKAZAM,   81, ARCANINE,   78, GYARADOS,   82, JOLTEON,    80, MEWTWO,     end
	db  "<RIVAL>@", 80, TAUROS,     79, ALAKAZAM,   81, EXEGGUTOR,  78, GYARADOS,   82, FLAREON,    80, MEWTWO,     end
	db  "<RIVAL>@", 80, TAUROS,     79, ALAKAZAM,   81, EXEGGUTOR,  78, ARCANINE,   82, VAPOREON,   80, MEWTWO,     end

BrockData:
	db  "BROCK@",   13, AERODACTYL, 12, OMASTAR,    14, KABUTOPS,   15, ONIX,                                       end

MistyData:
	db  "MISTY@",   25, VAPOREON,   25, POLIWRATH,  25, BLASTOISE,  26, STARMIE,    25, ARTICUNO,                   end

LtSurgeData:
	db  "LT.SURGE@",35, ELECTRODE,  34, JOLTEON,    35, ZAPDOS,     34, ELECTABUZZ, 36, RAICHU,                     end

ErikaData:
	db  "ERIKA@",   45, VILEPLUME,  44, VENUSAUR,   44, TANGELA,    45, VICTREEBEL, 46, EXEGGUTOR,                  end

KogaData:
	db  "KOGA@",    60, VENOMOTH,   59, WEEZING,    60, NIDOKING,   59, TENTACRUEL, 61, GENGAR,                     end

SabrinaData:
	db  "SABRINA@", 55, JYNX,       54, SLOWBRO,    54, HYPNO,      55, ALAKAZAM,   56, MR_MIME,                    end

BlaineData:
	db  "BLAINE@",  65, CHARIZARD,  64, MAGMAR,     64, FLAREON,    66, ARCANINE,   65, MOLTRES,                    end

GiovanniData:
	db  "GIOVANNI@",48, PERSIAN,    46, DUGTRIO,    47, GENGAR,     46, TAUROS,     47, RHYDON,                     end ;  1 - Rocket Hideout B4F
	db  "GIOVANNI@",54, PERSIAN,    54, DUGTRIO,    56, GENGAR,     55, TAUROS,     57, RHYDON,                     end ;  2 - Silph Co. 11F
	db  "GIOVANNI@",66, PERSIAN,    67, TAUROS,     66, GENGAR,     68, RHYDON,     68, MEWTWO,                     end ;  3 - Viridian Gym

LoreleiData:
	db  "LORELEI@", 77, CLOYSTER,   78, VAPOREON,   76, SLOWBRO,    77, JYNX,       78, LAPRAS,                     end

BrunoData:
	db  "BRUNO@",   78, PRIMEAPE,   77, HITMONCHAN, 77, HITMONLEE,  78, POLIWRATH,  77, MACHAMP,                    end

AgathaData:
	db  "AGATHA@",  79, GENGAR,     78, GOLBAT,     78, GENGAR,     78, ARBOK,      77, GENGAR,                     end

LanceData:
	db  "LANCE@",   80, GYARADOS,   80, CHARIZARD,  79, ELECTABUZZ, 80, SNORLAX,    79, AERODACTYL, 81, DRAGONITE,  end
