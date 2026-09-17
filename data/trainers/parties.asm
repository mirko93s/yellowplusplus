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
	db  "Ben@",     13, RATTATA,    15, EKANS,                                                                      end ;  1 - Route 3
	db  "Calvin@",  16, SPEAROW,    17, SANDSHREW,                                                                  end ;  2 - Route 3
	db  "Josh@",    15, RATTATA,    17, MACHOP,     16, ZUBAT,                                                      end ;  3 - Mt. Moon 1F
	db  "Nicholai@",18, RATICATE,   20, ARBOK,      22, GOLBAT,                                                     end ;  4 - Route 24
	db  "Dan@",     22, RATTATA,    23, SPEAROW,                                                                    end ;  5 - Route 25
	db  "Bret@",    23, SLOWPOKE,   24, SHELLDER,                                                                   end ;  6 - Route 25
	db  "Dennis@",  23, EKANS,      22, SANDSHREW,                                                                  end ;  7 - Route 25
	db  "Tyler@",   25, NIDORINO,                                                                                   end ;  8 - SS Anne 1F Rooms
	db  "A.J.@",    33, SANDSHREW,                                                                                  end ;  9 - Route 9
	db  "Eddie@",   25, EKANS,      24, KOFFING,                                                                    end ; 10 - Route 11
	db  "Robby@",   26, SANDSHREW,  27, ZUBAT,                                                                      end ; 11 - Route 11
	db  "Ronny@",   26, RATTATA,    25, RATICATE,                                                                   end ; 12 - Route 11
	db  "Joey@",    26, NIDORAN_M,  27, NIDORINO,                                                                   end ; 13 - Route 11

BugCatcherData:
	db  "Brian@",    9, WEEDLE,      9, CATERPIE,                                                                   end ;  1 - Viridian Forest
	db  "Doug@",    11, KAKUNA,     11, METAPOD,                                                                    end ;  2 - Viridian Forest
	db  "Rick@",    13, BUTTERFREE, 13, BEEDRILL,                                                                   end ;  3 - Viridian Forest
	db  "Sammy@",   10, BUTTERFREE,                                                                                 end ;  4 - Viridian Forest
	db  "Greg@",    13, PINSIR,                                                                                     end ;  5 - Route 3
	db  "Aaron@",   14, CATERPIE,   15, METAPOD,                                                                    end ;  6 - Route 3
	db  "Evan@",    13, ODDISH,     14, PARAS,      15, VENONAT,                                                    end ;  7 - Route 3
	db  "Kent@",    17, BUTTERFREE,                                                                                 end ;  8 - Mt. Moon 1F
	db  "Terry@",   17, BEEDRILL,                                                                                   end ;  9 - Mt. Moon 1F
	db  "Cale@",    19, BUTTERFREE, 21, SCYTHER,                                                                    end ; 10 - Route 24
	db  "Bobby@",   24, WEEDLE,     26, CATERPIE,   25, WEEDLE,                                                     end ; 11 - Route 6
	db  "Jake@",    24, BUTTERFREE, 26, TANGELA,                                                                    end ; 12 - Route 6
	db  "Conner@",  33, BUTTERFREE, 33, BEEDRILL,                                                                   end ; 13 - Route 9
	db  "Kenny@",   30, BEEDRILL,   32, BUTTERFREE, 34, VENONAT,                                                    end ; 14 - Route 9

LassData:
	db  "Joana@",   10, NIDORAN_M,  10, NIDORAN_F,                                                                  end ;  1 - Viridian Forest
	db  "Dianne@",  13, JIGGLYPUFF, 13, JIGGLYPUFF, 15, EEVEE,                                                      end ;  2 - Route 3
	db  "Cindy@",   15, JIGGLYPUFF, 15, CLEFAIRY,                                                                   end ;  3 - Route 3
	db  "Hana@",    15, WIGGLYTUFF, 15, CLEFABLE,                                                                   end ;  4 - Route 3
	db  "Hazel@",   16, ODDISH,     18, BELLSPROUT,                                                                 end ;  5 - Mt. Moon 1F
	db  "Katrina@", 16, CLEFAIRY,                                                                                   end ;  6 - Mt. Moon 1F
	db  "Miriam@",  41, PARAS,      43, PARAS,      45, PARASECT,                                                   end ;  7 - Route 4
	db  "Reli@",    20, NIDORINO,   21, CLEFABLE,                                                                   end ;  8 - Route 24
	db  "Ali@",     20, NIDORINA,   21, WIGGLYTUFF,                                                                 end ;  9 - Route 24
	db  "Janice@",  23, NIDORINO,   23, NIDORINA,                                                                   end ; 10 - Route 25
	db  "Emma@",    23, ODDISH,     24, PIDGEOTTO,                                                                  end ; 11 - Route 25
	db  "Chel@",    25, PORYGON,    24, NIDORINA,                                                                   end ; 12 - SS Anne 1F Rooms
	db  "Aoi@",     25, RATTATA,    25, PIKACHU,                                                                    end ; 13 - SS Anne 2F Rooms
	db  "Haley@",   36, NIDOQUEEN,                                                                                  end ; 14 - Route 8
	db  "Jocelyn@", 35, PERSIAN,    36, PIDGEOT,                                                                    end ; 15 - Route 8
	db  "Summer@",  36, DRAGONAIR,  35, NIDOKING,   37, PERSIAN,                                                    end ; 16 - Route 8
	db  "Mila@",    37, CLEFABLE,                                                                                   end ; 17 - Route 8
	db  "Lina@",    37, BELLSPROUT, 36, WEEPINBELL, 38, VICTREEBEL,                                                 end ; 18 - Celadon Gym
	db  "Megan@",   41, VILEPLUME,                                                                                  end ; 19 - Celadon Gym

SailorData:
	db  "Dwayne@",  35, RAICHU,                                                                                     end ;  1 - Vermilion Gym
	db  "Edmond@",  25, OMANYTE,    25, KABUTO,                                                                     end ;  2 - SS Anne Bow
	db  "Dirk@",    25, MACHOP,     26, TENTACOOL,                                                                  end ;  3 - SS Anne Bow
	db  "Dwayne@",  25, SHELLDER,   24, TENTACOOL,                                                                  end ;  4 - SS Anne B1F Rooms
	db  "Trevor@",  24, HORSEA,     26, SHELLDER,   28, TENTACOOL,                                                  end ;  5 - SS Anne B1F Rooms
	db  "Eldritch@",27, TENTACOOL,  26, STARYU,     25, HORSEA,                                                     end ;  6 - SS Anne B1F Rooms
	db  "Calude@",  26, SQUIRTLE,   24, TENTACOOL,                                                                  end ;  7 - SS Anne B1F Rooms
	db  "Huey@",    24, MACHOP,     26, MANKEY,     25, HITMONCHAN,                                                 end ;  8 - SS Anne B1F Rooms

JrTrainerMData:
	db  "Liam@",    14, DIGLETT,    15, SANDSHREW,                                                                  end ;  1 - Pewter Gym
	db  "Shane@",   23, POLIWAG,    22, GOLDEEN,                                                                    end ;  2 - Route 24
	db  "Kevin@",   20, PRIMEAPE,   21, MACHOKE,                                                                    end ;  3 - Route 24
	db  "Dustin@",  24, PIDGEOTTO,  26, GLOOM,                                                                      end ;  4 - Route 25
	db  "Jeff@",    25, SPEAROW,    26, DODUO,                                                                      end ;  5 - Route 6
	db  "Joe@",     24, WEEPINBELL,                                                                                 end ;  6 - Route 6
	db  "Drew@",    30, RATICATE,   31, DUGTRIO,    32, ARBOK,      32, SANDSLASH,                                  end ;  7 - Route 9
	db  "Justin@",  53, NIDOKING,                                                                                   end ;  8 - Route 12

JrTrainerFData:
	db  "Misaki@",  25, GOLDEEN,                                                                                    end ;  1 - Cerulean Gym
	db  "Giselle@", 25, CUBONE,                                                                                     end ;  2 - Route 6
	db  "Kelsey@",  25, PIDGEY,     26, SPEAROW,                                                                    end ;  3 - Route 6
	db  "Alicia@",  33, GLOOM,      31, WEEPINBELL,                                                                 end ;  4 - Route 9
	db  "Caitlin@", 33, PERSIAN,                                                                                    end ;  5 - Route 9
	db  "Carol@",   36, RAICHU,     35, CLEFABLE,                                                                   end ;  6 - Route 10
	db  "Dalia@",   38, PERSIAN,    39, PIDGEOT,                                                                    end ;  7 - Route 10
	db  "Dana@",    35, WEEPINBELL, 37, CLEFABLE,                                                                   end ;  8 - Rock Tunnel 1F
	db  "Leah@",    35, VILEPLUME,  37, PERSIAN,                                                                    end ;  9 - Rock Tunnel 1F
	db  "Missy@",   36, PIDGEOT,    37, RATICATE,                                                                   end ; 10 - Rock Tunnel 1F
	db  "Nancy@",   37, WIGGLYTUFF, 37, PIDGEOT,                                                                    end ; 11 - Rock Tunnel B1F
	db  "Robin@",   37, GLOOM,      34, IVYSAUR,                                                                    end ; 12 - Rock Tunnel B1F
	db  "Tina@",    39, BULBASAUR,  41, IVYSAUR,    43, VENUSAUR,                                                   end ; 13 - Celadon Gym
	db  "Gwen@",    52, PIDGEOT,    51, RAICHU,     52, PERSIAN,                                                    end ; 14 - Route 13
	db  "Susie@",   52, POLIWRATH,                                                                                  end ; 15 - Route 13
	db  "Yazmin@",  52, PIDGEOT,    53, PIDGEOT,                                                                    end ; 16 - Route 13
	db  "Amara@",   52, SEAKING,    51, SEADRA,                                                                     end ; 17 - Route 13
	db  "Stacy@",   54, VILEPLUME,                                                                                  end ; 18 - Route 15
	db  "Liz@",     54, RAICHU,                                                                                     end ; 19 - Route 15
	db  "Tanya@",   54, CLEFABLE,                                                                                   end ; 20 - Route 15
	db  "Tiffany@", 53, VICTREEBEL, 55, TANGELA,                                                                    end ; 21 - Route 15
	db  "Irene@",   53, TENTACRUEL, 55, SEADRA,     56, DEWGONG,                                                    end ; 22 - Route 20
	db  "Kylee@",   56, SEAKING,    55, SEAKING,                                                                    end ; 23 - Route 20

PokemaniacData:
	db  "Kirk@",    40, RHYHORN,    39, LICKITUNG,                                                                  end ;  1 - Route 10
	db  "Mark@",    37, MAROWAK,    38, SANDSLASH,                                                                  end ;  2 - Route 10
	db  "Ashton@",  35, CUBONE,     34, SLOWPOKE,                                                                   end ;  3 - Rock Tunnel 1F
	db  "Cooper@",  36, SLOWBRO,    37, MAROWAK,                                                                    end ;  4 - Rock Tunnel B1F
	db  "Winston@", 36, CHARMELEON, 35, MAROWAK,                                                                    end ;  5 - Rock Tunnel B1F
	db  "Leo@",     35, SLOWBRO,                                                                                    end ;  6 - Rock Tunnel B1F
	db  "Dawson@",  64, CHARIZARD,  66, LAPRAS,     67, LICKITUNG,                                                  end ;  7 - Victory Road 2F

SuperNerdData:
	db  "Jovan@",   17, MAGNEMITE,  16, VOLTORB,                                                                    end ;  1 - Mt. Moon 1F
	db  "Miguel@",  20, MAGNETON,   22, ELECTRODE,                                                                  end ;  2 - Mt. Moon B2F
	db  "Aidan@",   37, ELECTRODE,  36, MAGNETON,   35, ELECTABUZZ,                                                 end ;  3 - Route 8
	db  "Leslie@",  36, MUK,                                                                                        end ;  4 - Route 8
	db  "Conway@",  36, WEEZING,                                                                                    end ;  5 - Route 8
	db  "Erik@",    60, NINETALES,                                                                                  end ;  6 - Cinnabar Gym
	db  "Derek@",   61, CHARIZARD,  60, ARCANINE,                                                                   end ;  7 - Cinnabar Gym
	db  "Miles@",   61, RAPIDASH,                                                                                   end ;  8 - Cinnabar Gym
	db  "Markus@",  62, ARCANINE,   63, RAPIDASH,                                                                   end ;  9 - Cinnabar Gym

HikerData:
	db  "Marcos@",  17, GEODUDE,    16, MACHOP,     17, ONIX,                                                       end ;  1 - Mt. Moon 1F
	db  "Franklin@",22, MACHOP,     23, GEODUDE,                                                                    end ;  2 - Route 25
	db  "Nob@",     24, GEODUDE,    22, MANKEY,     22, MACHOP,                                                     end ;  3 - Route 25
	db  "Irwin@",   23, GEODUDE,    23, ONIX,                                                                       end ;  4 - Route 25
	db  "Alan@",    33, MACHOKE,    35, MACHOKE,                                                                    end ;  5 - Route 9
	db  "Jeremy@",  34, GRAVELER,   33, MACHOKE,                                                                    end ;  6 - Route 9
	db  "Kenji@",   33, GRAVELER,   34, ONIX,                                                                       end ;  7 - Route 9
	db  "Clark@",   36, MACHOKE,    37, ONIX,                                                                       end ;  8 - Route 10
	db  "Paul@",    36, ONIX,       35, GOLEM,                                                                      end ;  9 - Route 10
	db  "Allen@",   37, MACHAMP,                                                                                    end ; 10 - Rock Tunnel 1F
	db  "Claus@",   36, KABUTO,     36, OMANYTE,                                                                    end ; 11 - Rock Tunnel 1F
	db  "Oliver@",  37, GOLEM,                                                                                      end ; 12 - Rock Tunnel 1F
	db  "Andy@",    34, ONIX,       35, GRAVELER,                                                                   end ; 13 - Rock Tunnel B1F
	db  "Dexter@",  35, GRAVELER,   34, MACHOKE,                                                                    end ; 14 - Rock Tunnel B1F
	db  "Lionel@",  36, AERODACTYL,                                                                                 end ; 15 - Rock Tunnel B1F

BikerData:
	db  "Philip@",  53, WEEZING,    51, MUK,        52, ARBOK,                                                      end ;  1 - Route 13
	db  "Charles@", 53, MUK,        52, WEEZING,                                                                    end ;  2 - Route 14
	db  "Glenn@",   53, KOFFING,    54, WEEZING,                                                                    end ;  3 - Route 14
	db  "Harris@",  53, GRIMER,     52, MUK,                                                                        end ;  4 - Route 14
	db  "Joel@",    53, RHYHORN,    54, RHYDON,                                                                     end ;  5 - Route 14
	db  "Riley@",   54, WEEZING,    53, MUK,                                                                        end ;  6 - Route 15
	db  "Zeke@",    54, MUK,        53, WEEZING,                                                                    end ;  7 - Route 15
	db  "Stanley@", 52, MUK,        51, WEEZING,                                                                    end ;  8 - Route 16
	db  "Dillon@",  53, DITTO,                                                                                      end ;  9 - Route 16
	db  "Tyra@",    52, MUK,        51, MUK,                                                                        end ; 10 - Route 16
	db  "Aiden@",   53, WEEZING,    54, WEEZING,                                                                    end ; 11 - Route 17
	db  "Dale@",    53, MUK,                                                                                        end ; 12 - Route 17
	db  "Jacob@",   53, ELECTRODE,  52, MAGNETON,                                                                   end ; 13 - Route 17
	db  "Ernest@",  54, GROWLITHE,  53, VULPIX,                                                                     end ; 14 - Route 17
	db  "Chopper@", 54, WEEZING,    55, WEEZING,                                                                    end ; 15 - Route 17

BurglarData:
	db  "Dusty@",   60, ARCANINE,   61, NINETALES,                                                                  end ;  1 - Cinnabar Gym
	db  "Quinn@",   61, FLAREON,                                                                                    end ;  2 - Cinnabar Gym
	db  "Ramon@",   59, NINETALES,  62, ARCANINE,                                                                   end ;  3 - Cinnabar Gym
	db  "Arnie@",   57, CHARIZARD,                                                                                  end ;  4 - Mansion 2F
	db  "Lewis@",   58, NINETALES,                                                                                  end ;  5 - Mansion 3F
	db  "Simon@",   57, ARCANINE,   59, RAPIDASH,                                                                   end ;  6 - Mansion B1F

EngineerData:
	db  "Bernie@",  23, MAGNETON,                                                                                   end ;  1 - Route 11
	db  "Braxton@", 21, MAGNETON,   22, RAICHU,                                                                     end ;  2 - Route 11

JessieAndJamesData:
	db  "James@",   18, EKANS,      19, MEOWTH,     18, KOFFING,                                                    end ;  1 - Jessie & James Mt. Moon B2F
	db  "James@",   44, WEEZING,    45, MEOWTH,     44, ARBOK,                                                      end ;  2 - Jessie & James Rocket Hideout B4F
	db  "James@",   49, MEOWTH,     48, ARBOK,      48, WEEZING,                                                    end ;  3 - Jessie & James Pokémon Tower 7F
	db  "James@",   50, WEEZING,    50, ARBOK,      52, MEOWTH,                                                     end ;  4 - Jessie & James Silph Co. 11F

FisherData:
	db  "Barny@",   26, GOLDEEN,    25, TENTACOOL,  24, VAPOREON,                                                   end ;  1 - SS Anne 2F Rooms
	db  "Dale@",    25, TENTACOOL,  24, STARYU,     25, SHELLDER,                                                   end ;  2 - SS Anne B1F Rooms
	db  "Andrew@",  37, POLIWRATH,  36, SEAKING,                                                                    end ;  3 - Route 12
	db  "Chip@",    38, TENTACRUEL, 37, SEAKING,                                                                    end ;  4 - Route 12
	db  "Elliot@",  37, SEAKING,    38, VAPOREON,                                                                   end ;  5 - Route 12
	db  "Hank@",    37, POLIWRATH,  35, SEAKING,    36, SEADRA,                                                     end ;  6 - Route 12
	db  "Ned@",     52, GYARADOS,                                                                                   end ;  7 - Route 12
	db  "Noilan@",  55, SEAKING,    54, SEAKING,                                                                    end ;  8 - Route 21
	db  "Wade@",    55, GYARADOS,   52, GYARADOS,   53, GYARADOS,                                                   end ;  9 - Route 21
	db  "Ronald@",  56, CLOYSTER,                                                                                   end ; 10 - Route 21
	db  "Wilton@",  56, SEAKING,    55, SEAKING,                                                                    end ; 11 - Route 21

SwimmerData:
	db  "Luis@",    24, HORSEA,     23, SHELLDER,                                                                   end ;  1 - Cerulean Gym
	db  "Axle@",    54, TENTACRUEL, 55, CLOYSTER,                                                                   end ;  2 - Route 19
	db  "David@",   54, SEADRA,     53, STARMIE,                                                                    end ;  3 - Route 19
	db  "Reece@",   54, POLIWRATH,                                                                                  end ;  4 - Route 19
	db  "Richard@", 54, TENTACRUEL, 53, SEADRA,                                                                     end ;  5 - Route 19
	db  "Marlon@",  55, SEAKING,                                                                                    end ;  6 - Route 19
	db  "Jacob@",   54, SEADRA,                                                                                     end ;  7 - Route 19
	db  "Logan@",   55, TENTACRUEL,                                                                                 end ;  8 - Route 19
	db  "Darrin@",  55, SHELLDER,   54, CLOYSTER,                                                                   end ;  9 - Route 20
	db  "Douglas@", 56, STARMIE,                                                                                    end ; 10 - Route 20
	db  "Dean@",    55, SEADRA,     54, SEADRA,                                                                     end ; 11 - Route 20
	db  "Jack@",    56, SEADRA,     57, TENTACRUEL,                                                                 end ; 12 - Route 21
	db  "Jerome@",  56, STARMIE,                                                                                    end ; 13 - Route 21
	db  "Roland@",  55, STARMIE,    56, BLASTOISE,                                                                  end ; 14 - Route 21
	db  "Spencer@", 55, POLIWRATH,  54, TENTACRUEL, 57, SEADRA,                                                     end ; 15 - Route 21

CueBallData:
	db  "Koji@",    52, MACHAMP,                                                                                    end ;  1 - Route 16
	db  "Zeek@",    52, PRIMEAPE,                                                                                   end ;  2 - Route 16
	db  "Nicky@",   52, MACHAMP,                                                                                    end ;  3 - Route 16
	db  "Kirby@",   53, PRIMEAPE,                                                                                   end ;  4 - Route 17
	db  "Ricky@",   53, MACHAMP,                                                                                    end ;  5 - Route 17
	db  "Reese@",   53, HITMONLEE,                                                                                  end ;  6 - Route 17
	db  "Johnny@",  53, PRIMEAPE,   55, MACHAMP,                                                                    end ;  7 - Route 17
	db  "Dave@",    53, MACHAMP,    54, PRIMEAPE,                                                                   end ;  8 - Route 17
	db  "Martin@",  56, HITMONCHAN,                                                                                 end ;  9 - Route 21

GamblerData:
	db  "Rich@",    36, POLIWAG,    37, POLIWHIRL,  35, POLIWRATH,                                                  end ;  1 - Route 8
	db  "Stan@",    36, ARCANINE,   35, NINETALES,                                                                  end ;  2 - Route 8
	db  "Hugo@",    26, POLIWHIRL,  27, HORSEA,                                                                     end ;  3 - Route 11
	db  "Darian@",  25, WEEPINBELL, 26, GLOOM,                                                                      end ;  4 - Route 11
	db  "Jasper@",  26, VOLTORB,    25, MAGNEMITE,                                                                  end ;  5 - Route 11
	db  "Carlos@",  26, GROWLITHE,  25, VULPIX,                                                                     end ;  6 - Route 11

BeautyData:
	db  "Lori@",    42, ODDISH,     41, GLOOM,      40, VILEPLUME,                                                  end ;  1 - Celadon Gym
	db  "Mai@",     42, VICTREEBEL,                                                                                 end ;  2 - Celadon Gym
	db  "Tamia@",   42, EXEGGCUTE,  41, EXEGGUTOR,                                                                  end ;  3 - Celadon Gym
	db  "Sheila@",  52, RATICATE,                                                                                   end ;  4 - Route 13
	db  "Lily@",    52, PERSIAN,                                                                                    end ;  5 - Route 13
	db  "Lana@",    54, PIDGEOT,    55, WIGGLYTUFF,                                                                 end ;  6 - Route 15
	db  "Violet@",  54, VENUSAUR,                                                                                   end ;  7 - Route 15
	db  "Alice@",   54, POLIWRATH,  55, SEAKING,                                                                    end ;  8 - Route 19
	db  "Anya@",    55, SEAKING,    54, SEAKING,                                                                    end ;  9 - Route 19
	db  "Connie@",  55, STARMIE,    54, DEWGONG,                                                                    end ; 10 - Route 19
	db  "Hansol@",  55, SEADRA,     56, SEADRA,                                                                     end ; 11 - Route 20
	db  "Shirley@", 55, SEAKING,                                                                                    end ; 12 - Route 20
	db  "Daisy@",   53, CLOYSTER,   55, SEAKING,                                                                    end ; 13 - Route 20
	db  "Nicole@",  55, POLIWRATH,  54, SEAKING,                                                                    end ; 14 - Route 20

PsychicData:
	db  "Johan@",   51, ABRA,       52, KADABRA,    50, ALAKAZAM,                                                   end ;  1 - Saffron Gym
	db  "Preston@", 51, MR_MIME,    50, ALAKAZAM,                                                                   end ;  2 - Saffron Gym
	db  "Vlad@",    50, SLOWPOKE,   51, SLOWPOKE,   50, MR_MIME,                                                    end ;  3 - Saffron Gym
	db  "Ricky@",   52, SLOWBRO,                                                                                    end ;  4 - Saffron Gym

RockerData:
	db  "Baily@",   34, VOLTORB,    36, ELECTRODE,                                                                  end ;  1 - Vermilion Gym
	db  "Luca@",    52, RAICHU,     51, ELECTABUZZ,                                                                 end ;  2 - Route 12

JugglerData:
	db  "Dalton@",  46, ALAKAZAM,   47, MR_MIME,                                                                    end ;  1 - Silph Co. 5F
	db  "Harry@",   55, GOLBAT,     54, MUK,                                                                        end ;  2 - Fuchsia Gym
	db  "Kirk@",    56, MUK,        54, WEEZING,    55, MUK,                                                        end ;  3 - Fuchsia Gym
	db  "Horton@",  55, GOLBAT,     54, WEEZING,    55, MUK,                                                        end ;  4 - Fuchsia Gym
	db  "Fritz@",   56, MUK,        55, TENTACRUEL, 57, WEEZING,                                                    end ;  5 - Fuchsia Gym
	db  "Nelson@",  63, HYPNO,      62, ALAKAZAM,                                                                   end ;  6 - Victory Road 2F
	db  "Gregory@", 64, MR_MIME,                                                                                    end ;  7 - Victory Road 2F

TamerData:
	db  "Edgar@",   56, NIDOKING,   57, ARBOK,                                                                      end ;  1 - Fuchsia Gym
	db  "Phil@",    56, ARBOK,      54, NIDOKING,   58, ARBOK,                                                      end ;  2 - Fuchsia Gym
	db  "Cole@",    62, RHYDON,                                                                                     end ;  3 - Viridian Gym
	db  "Jason@",   62, ARBOK,      60, TAUROS,                                                                     end ;  4 - Viridian Gym
	db  "Vincent@", 63, PERSIAN,    64, GOLDUCK,                                                                    end ;  5 - Victory Road 2F

BirdKeeperData:
	db  "Robert@",  53, PIDGEOT,                                                                                    end ;  1 - Route 13
	db  "Perry@",   50, FEAROW,     52, PIDGEOTTO,  54, PIDGEOT,    56, FEAROW,                                     end ;  2 - Route 13
	db  "Theo@",    52, PIDGEOT,    51, FEAROW,                                                                     end ;  3 - Route 13
	db  "Benny@",   52, DODRIO,     54, PIDGEOT,                                                                    end ;  4 - Route 14
	db  "Donald@",  52, SPEAROW,    53, FEAROW,                                                                     end ;  5 - Route 14
	db  "Roy@",     53, PIDGEOT,    55, FEAROW,                                                                     end ;  6 - Route 14
	db  "Howie@",   53, DODRIO,     55, FEAROW,                                                                     end ;  7 - Route 14
	db  "Bob@",     53, FARFETCHD,                                                                                  end ;  8 - Route 14
	db  "Boris@",   54, FEAROW,                                                                                     end ;  9 - Route 14
	db  "Edwin@",   54, PIDGEOT,    55, FARFETCHD,  52, DODRIO,                                                     end ; 10 - Route 15
	db  "Ralph@",   53, DODRIO,     52, DODRIO,                                                                     end ; 11 - Route 15
	db  "Jacob@",   54, FEAROW,                                                                                     end ; 12 - Route 18
	db  "Ramiro@",  54, DODRIO,                                                                                     end ; 13 - Route 18
	db  "Wyatt@",   53, FEAROW,     55, FEAROW,                                                                     end ; 14 - Route 18
	db  "Roger@",   55, FEAROW,     57, FEAROW,     54, PIDGEOT,                                                    end ; 15 - Route 20

BlackbeltData:
	db  "Koichi@",  50, HITMONLEE,  50, HITMONCHAN,                                                                 end ;  1 - Fighting Dojo Leader
	db  "Aaron@",   45, PRIMEAPE,                                                                                   end ;  2 - Fighting Dojo
	db  "Hideki@",  45, MACHAMP,                                                                                    end ;  3 - Fighting Dojo
	db  "Hitoshi@", 45, PRIMEAPE,                                                                                   end ;  4 - Fighting Dojo
	db  "Mike@",    45, PRIMEAPE,                                                                                   end ;  5 - Fighting Dojo
	db  "Takashi@", 61, MACHAMP,                                                                                    end ;  6 - Viridian Gym
	db  "Kiyo@",    62, MACHAMP,                                                                                    end ;  7 - Viridian Gym
	db  "Connally@",61, MACHAMP,                                                                                    end ;  8 - Viridian Gym
	db  "Daisuke@", 60, MACHAMP,    62, MACHAMP,                                                                    end ;  9 - Victory Road 2F

ScientistData:
	db  "Beau@",    45, MUK,        46, WEEZING,                                                                    end ;  1 - Silph Co. 2F
	db  "Connor@",  45, ELECTRODE,  47, MAGNETON,                                                                   end ;  2 - Silph Co. 2F
	db  "Ed@",      45, MAGNETON,   44, WEEZING,                                                                    end ;  3 - Silph Co. 3F
	db  "Jerry@",   45, ELECTRODE,  43, JOLTEON,                                                                    end ;  4 - Silph Co. 4F
	db  "Jose@",    46, ELECTRODE,  44, MAGNETON,                                                                   end ;  5 - Silph Co. 5F
	db  "Joshua@",  46, ELECTRODE,  44, MAGNETON,   42, WEEZING,                                                    end ;  6 - Silph Co. 6F
	db  "Parker@",  46, MAGNETON,   47, MUK,                                                                        end ;  7 - Silph Co. 7F
	db  "Rodney@",  47, MUK,        45, ELECTRODE,                                                                  end ;  8 - Silph Co. 8F
	db  "Taylor@",  47, JOLTEON,    46, DRAGONITE,                                                                  end ;  9 - Silph Co. 9F
	db  "Travis@",  47, MAGNEMITE,  48, ELECTABUZZ,                                                                 end ; 10 - Silph Co. 10F
	db  "Braydon@", 57, WEEZING,    55, ELECTRODE,                                                                  end ; 11 - Mansion 1F
	db  "Ivan@",    57, MAGNETON,   56, JOLTEON,                                                                    end ; 12 - Mansion 3F
	db  "Ted@",     58, MAGNETON,   59, ELECTRODE,                                                                  end ; 13 - Mansion B1F

RocketData:
	db  "Grunt@",   15, SANDSHREW,  16, RATTATA,    16, ZUBAT,                                                      end ;  1 - Mt. Moon B2F
	db  "Grunt@",   17, ZUBAT,      18, EKANS,                                                                      end ;  2 - Mt. Moon B2F
	db  "Grunt@",   16, RATTATA,    17, ZUBAT,                                                                      end ;  3 - Mt. Moon B2F
	db  "Grunt@",   25, MACHOKE,    24, DROWZEE,                                                                    end ;  4 - Cerulean City
	db  "Grunt@",   20, RATICATE,   21, GOLBAT,     22, ARBOK,                                                      end ;  5 - Route 24
	db  "Grunt@",   40, RATICATE,   38, GOLBAT,                                                                     end ;  6 - Game Corner
	db  "Grunt@",   40, HYPNO,      42, MACHOKE,                                                                    end ;  7 - Rocket Hideout B1F
	db  "Grunt@",   40, RATICATE,   41, RATICATE,                                                                   end ;  8 - Rocket Hideout B1F
	db  "Grunt@",   40, WEEZING,    40, MUK,                                                                        end ;  9 - Rocket Hideout B1F
	db  "Grunt@",   41, RATICATE,   43, RATICATE,                                                                   end ; 10 - Rocket Hideout B1F
	db  "Grunt@",   41, MUK,        42, WEEZING,                                                                    end ; 11 - Rocket Hideout B1F
	db  "Grunt@",   41, GOLBAT,     40, RATICATE,   41, GOLBAT,                                                     end ; 12 - Rocket Hideout B2F
	db  "Grunt@",   42, RATICATE,   43, HYPNO,                                                                      end ; 13 - Rocket Hideout B3F
	db  "Grunt@",   42, MACHOKE,    43, MACHOKE,                                                                    end ; 14 - Rocket Hideout B3F
	db  "Grunt@",   44, WEEZING,    41, GOLBAT,     43, MUK,                                                        end ; 15 - Rocket Hideout B4F
	db  "Grunt@",   45, MAROWAK,    46, GOLBAT,                                                                     end ; 16 - Silph Co. 2F
	db  "Grunt@",   45, GOLBAT,     43, RATICATE,   46, GOLBAT,                                                     end ; 17 - Silph Co. 2F
	db  "Grunt@",   41, RATICATE,   43, HYPNO,      45, RATICATE,                                                   end ; 18 - Silph Co. 3F
	db  "Grunt@",   44, MACHAMP,    46, HYPNO,                                                                      end ; 19 - Silph Co. 4F
	db  "Grunt@",   44, ARBOK,      46, SANDSLASH,                                                                  end ; 20 - Silph Co. 4F
	db  "Grunt@",   45, ARBOK,                                                                                      end ; 21 - Silph Co. 5F
	db  "Grunt@",   46, HYPNO,                                                                                      end ; 22 - Silph Co. 5F
	db  "Grunt@",   46, MACHOKE,    45, MACHAMP,                                                                    end ; 23 - Silph Co. 6F
	db  "Grunt@",   46, GOLBAT,     44, GOLBAT,                                                                     end ; 24 - Silph Co. 6F
	db  "Grunt@",   43, RATICATE,   45, ARBOK,      47, WEEZING,    49, GOLBAT,                                     end ; 25 - Silph Co. 7F
	db  "Grunt@",   45, CUBONE,     46, MAROWAK,                                                                    end ; 26 - Silph Co. 7F
	db  "Grunt@",   45, SANDSHREW,  47, SANDSLASH,                                                                  end ; 27 - Silph Co. 7F
	db  "Grunt@",   47, RATICATE,   46, GOLBAT,                                                                     end ; 28 - Silph Co. 8F
	db  "Grunt@",   47, WEEZING,    45, GOLBAT,                                                                     end ; 29 - Silph Co. 8F
	db  "Grunt@",   47, HYPNO,      45, MUK,                                                                        end ; 30 - Silph Co. 9F
	db  "Grunt@",   47, GOLBAT,     48, HYPNO,                                                                      end ; 31 - Silph Co. 9F
	db  "Grunt@",   47, MACHAMP,                                                                                    end ; 32 - Silph Co. 10F
	db  "Grunt@",   47, RATICATE,   45, GOLBAT,     48, ARBOK,                                                      end ; 33 - Silph Co. 11F

CooltrainerMData:
	db  "Samuel@",  60, SANDSLASH,  62, DUGTRIO,                                                                    end ;  1 - Viridian Gym
	db  "Yuji@",    61, RHYDON,                                                                                     end ;  2 - Viridian Gym
	db  "Zach@",    61, NIDORINO,   63, NIDOKING,                                                                   end ;  3 - Viridian Gym
	db  "Colby@",   63, VENUSAUR,   64, BLASTOISE,  65, CHARIZARD,                                                  end ;  4 - Victory Road 1F
	db  "George@",  63, EXEGGUTOR,  61, CLOYSTER,   62, ARCANINE,                                                   end ;  5 - Victory Road 3F
	db  "Corey@",   63, KINGLER,    62, TENTACRUEL, 65, BLASTOISE,                                                  end ;  6 - Victory Road 3F

CooltrainerFData:
	db  "Mary@",    41, VICTREEBEL, 42, VILEPLUME,  40, VENUSAUR,                                                   end ;  1 - Celadon Gym
	db  "Alexa@",   64, PERSIAN,    62, NINETALES,                                                                  end ;  2 - Victory Road 1F
	db  "Annie@",   63, VENOMOTH,   64, VILEPLUME,  63, VICTREEBEL,                                                 end ;  3 - Victory Road 3F
	db  "Naomi@",   63, PARASECT,   65, DEWGONG,    63, CHANSEY,                                                    end ;  4 - Victory Road 3F

GentlemanData:
	db  "Tucker@",  34, MAGNEMITE,  36, MAGNETON,                                                                   end ;  1 - Vermilion Gym
	db  "Arthur@",  26, GROWLITHE,  24, PONYTA,     26, CHARMANDER,                                                 end ;  2 - SS Anne 1F Rooms
	db  "Brooks@",  25, NIDORINO,   25, NIDORINA,                                                                   end ;  3 - SS Anne 1F Rooms
	db  "Lamar@",   35, RAICHU,                                                                                     end ;  4 - SS Anne 2F Rooms
	db  "Thomas@",  25, GROWLITHE,  26, PONYTA,                                                                     end ;  5 - SS Anne 2F Rooms

ChannelerData:
	db  "Angelica@",38, GASTLY,                                                                                     end ;  1 - Pokémon Tower 3F
	db  "Carly@",   39, GASTLY,                                                                                     end ;  2 - Pokémon Tower 3F
	db  "Emilia@",  38, GASTLY,                                                                                     end ;  3 - Pokémon Tower 3F
	db  "Hope@",    39, GASTLY,                                                                                     end ;  4 - Pokémon Tower 4F
	db  "Janae@",   38, GASTLY,     40, HAUNTER,                                                                    end ;  5 - Pokémon Tower 4F
	db  "Jennifer@",38, HAUNTER,                                                                                    end ;  6 - Pokémon Tower 4F
	db  "Jody@",    39, HAUNTER,                                                                                    end ;  7 - Pokémon Tower 5F
	db  "Karina@",  39, HAUNTER,                                                                                    end ;  8 - Pokémon Tower 5F
	db  "Laurel@",  40, HAUNTER,                                                                                    end ;  9 - Pokémon Tower 5F
	db  "Patricia@",40, HAUNTER,                                                                                    end ; 10 - Pokémon Tower 5F
	db  "Paula@",   40, GASTLY,     41, HAUNTER,    42, GENGAR,                                                     end ; 11 - Pokémon Tower 6F
	db  "Ruth@",    39, GENGAR,                                                                                     end ; 12 - Pokémon Tower 6F
	db  "Tammy@",   40, GENGAR,                                                                                     end ; 13 - Pokémon Tower 6F
	db  "Imari@",   51, HAUNTER,    53, GENGAR,                                                                     end ; 14 - Saffron Gym
	db  "Stacy@",   52, GENGAR,                                                                                     end ; 15 - Saffron Gym
	db  "Tasha@",   53, GASTLY,     54, HAUNTER,    55, GENGAR,                                                     end ; 16 - Saffron Gym

ProfOakData: ; Unused ;todo
	db  "Prof. Oak@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, BLASTOISE,  70, GYARADOS,                   end
	db  "Prof. Oak@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, VENUSAUR,   70, GYARADOS,                   end
	db  "Prof. Oak@",66, TAUROS,     67, EXEGGUTOR,  68, ARCANINE,   69, CHARIZARD,  70, GYARADOS,                   end

ChiefData:
; none

Rival1Data:
; Oak's Lab
	db  "<RIVAL>@", 5,  EEVEE,                                                                                      end
; Route 22
	db  "<RIVAL>@", 8,  SQUIRTLE,    9,  PIDGEY,    10, EEVEE,                                                      end
; Cerulean City
	db  "<RIVAL>@", 21, PIDGEOTTO,  20, NIDORINA,   21, WARTORTLE,  22, EEVEE,                                      end

Rival2Data:
; SS Anne 2F
	db  "<RIVAL>@", 31, GROWLITHE,  30, DODUO,      32, PIDGEOTTO,  32, WARTORTLE,  33, EEVEE,                      end
; Pokémon Tower 2F
	db  "<RIVAL>@", 42, GRAVELER,   43, DODRIO,     45, PIDGEOT,    43, BLASTOISE,  45, JOLTEON,                    end
	db  "<RIVAL>@", 42, GRAVELER,   43, DODRIO,     45, PIDGEOT,    43, BLASTOISE,  45, FLAREON,                    end
	db  "<RIVAL>@", 42, GRAVELER,   43, DODRIO,     45, PIDGEOT,    43, BLASTOISE,  45, VAPOREON,                   end
; Silph Co. 7F
	db  "<RIVAL>@", 52, GOLEM,      53, NIDOQUEEN,  51, PIDGEOT,    50, BLASTOISE,  55, JOLTEON,    50, TAUROS,     end
	db  "<RIVAL>@", 52, GOLEM,      53, NIDOQUEEN,  51, PIDGEOT,    50, BLASTOISE,  55, FLAREON,    50, TAUROS,     end
	db  "<RIVAL>@", 52, GOLEM,      53, NIDOQUEEN,  51, PIDGEOT,    50, BLASTOISE,  55, VAPOREON,   50, TAUROS,     end
; Route 22
	db  "<RIVAL>@", 68, ARCANINE,   71, NIDOQUEEN,  73, PIDGEOT,    70, BLASTOISE,  72, JOLTEON,    70, TAUROS,     end
	db  "<RIVAL>@", 68, ARCANINE,   71, NIDOQUEEN,  73, PIDGEOT,    70, BLASTOISE,  72, FLAREON,    70, TAUROS,     end
	db  "<RIVAL>@", 68, ARCANINE,   71, NIDOQUEEN,  73, PIDGEOT,    70, BLASTOISE,  72, VAPOREON,   70, TAUROS,     end

Rival3Data:
; Champion's Room
	db  "<RIVAL>@", 81, ARCANINE,   80, NIDOQUEEN,  82, PIDGEOT,    82, BLASTOISE,  83, JOLTEON,    85, TAUROS,     end
	db  "<RIVAL>@", 81, ARCANINE,   80, NIDOQUEEN,  82, PIDGEOT,    82, BLASTOISE,  83, FLAREON,    85, TAUROS,     end
	db  "<RIVAL>@", 81, ARCANINE,   80, NIDOQUEEN,  82, PIDGEOT,    82, BLASTOISE,  83, VAPOREON,   85, TAUROS,     end
; Champion's Room Rematch
	db  "<RIVAL>@",127, ARCANINE,  129, NIDOQUEEN, 125, PIDGEOT,   130, BLASTOISE, 126, JOLTEON,   128, TAUROS,     end
	db  "<RIVAL>@",125, ARCANINE,  128, NIDOQUEEN, 130, PIDGEOT,   126, BLASTOISE, 129, FLAREON,   127, TAUROS,     end
	db  "<RIVAL>@",129, ARCANINE,  126, NIDOQUEEN, 128, PIDGEOT,   127, BLASTOISE, 130, VAPOREON,  125, TAUROS,     end

BrockData:
	db  "Brock@",   12, GEODUDE,    14, RHYHORN,    15, ONIX,                                                       end ;  1 - Gym
	db  "Brock@",   95, GOLEM,      96, RHYDON,     94, ONIX,       98, AERODACTYL, 97, KABUTOPS,   99, OMASTAR,    end ;  2 - Rematch
	; golem shiny
MistyData:
	db  "Misty@",   25, CLOYSTER,   24, GYARADOS,   26, STARMIE,    25, ARTICUNO,                                   end ;  1 - Gym
	db  "Misty@",   96, STARMIE,    97, LAPRAS,     98, GYARADOS,   95, BLASTOISE,  99, VAPOREON,   94, CLOYSTER,   end ;  2 - Rematch
	; vaporeon shiny
LtSurgeData:
	db  "Lt. Surge@",35, ELECTRODE,  34, JOLTEON,    36, RAICHU,     34, ELECTABUZZ, 35, ZAPDOS,                     end ;  1 - Gym
	db  "Lt. Surge@",95, RAICHU,     98, JOLTEON,    96, ELECTABUZZ, 97, JOLTEON,    99, ELECTRODE,  94, MAGNETON,   end ;  2 - Rematch
	; 1 jolteon shiny
ErikaData:
	db  "Erika@",   45, VILEPLUME,  44, VENUSAUR,   44, TANGELA,    45, VICTREEBEL, 46, EXEGGUTOR,                  end ;  1 - Gym
	db  "Erika@",   97, VICTREEBEL, 95, VILEPLUME,  98, EXEGGUTOR,  94, TANGELA,    99, VENUSAUR,   96, PARASECT,   end ;  2 - Rematch
	; parasect shiny
	; anime: tangela (named angela)
KogaData:
	db  "Koga@",    55, GOLBAT,     54, WEEZING,    54, MUK,        55, TENTACRUEL, 56, ARBOK,                      end ;  1 - Gym
	db  "Koga@",    95, WEEZING,    96, MUK,        94, ARBOK,      98, TENTACRUEL, 97, GOLBAT,     99, GENGAR,     end ;  2 - Rematch
	; gengar shiny
SabrinaData:
	db  "Sabrina@", 60, JYNX,       59, SLOWBRO,    60, HYPNO,      59, ALAKAZAM,   61, MR_MIME,                    end ;  1 - Gym
	db  "Sabrina@", 96, ALAKAZAM,   98, SLOWBRO,    97, HYPNO,      95, MR_MIME,    99, EXEGGUTOR,  94, JYNX,       end ;  2 - Rematch
	; exeggutor shiny
BlaineData:
	db  "Blaine@",  65, FLAREON,    64, MAGMAR,     64, RAPIDASH,   66, ARCANINE,   65, MOLTRES,                    end ;  1 - Gym
	db  "Blaine@",  97, ARCANINE,   98, MAGMAR,     96, FLAREON,    99, CHARIZARD,  95, RAPIDASH,   94, NINETALES,  end ;  2 - Rematch
	; charizard shiny
GiovanniData:
	db  "Giovanni@",48, PERSIAN,    46, DUGTRIO,    47, NIDOKING,   46, NIDOQUEEN,  47, RHYDON,                     end ;  1 - Rocket Hideout B4F
	db  "Giovanni@",54, PERSIAN,    54, DUGTRIO,    56, NIDOKING,   55, NIDOQUEEN,  57, RHYDON,                     end ;  2 - Silph Co. 11F
	db  "Giovanni@",68, PERSIAN,    67, NIDOQUEEN,  69, NIDOKING,   68, RHYDON,     70, MEWTWO,                     end ;  3 - Viridian Gym
	db  "Giovanni@",98, PERSIAN,    96, NIDOQUEEN,  97, NIDOKING,   95, RHYDON,     99, DUGTRIO,    94, KANGASKHAN, end ;  4 - Viridian Gym Rematch
	; kangaskhan shiny

LoreleiData:
	db  "Lorelei@", 77, CLOYSTER,   78, VAPOREON,   76, SLOWBRO,    77, JYNX,       78, LAPRAS,                     end
    db  "Lorelei@",122, CLOYSTER,  116, VAPOREON,  124, SLOWBRO,   120, JYNX,      118, LAPRAS,    121, DEWGONG,    end

BrunoData:
	db  "Bruno@",   78, PRIMEAPE,   77, HITMONCHAN, 77, HITMONLEE,  78, POLIWRATH,  77, MACHAMP,                    end
    db  "Bruno@",  123, PRIMEAPE,  115, HITMONCHAN,125, HITMONLEE, 117, POLIWRATH, 119, MACHAMP,   124, ONIX,       end

AgathaData:
	db  "Agatha@",  79, GENGAR,     78, GOLBAT,     78, GENGAR,     78, ARBOK,      77, GENGAR,                     end
    db  "Agatha@", 120, GENGAR,    118, GOLBAT,    116, GENGAR,    121, ARBOK,     123, GENGAR,    115, VENOMOTH,   end

LanceData:
	db  "Lance@",   80, GYARADOS,   80, CHARIZARD,  79, ELECTABUZZ, 80, SNORLAX,    79, AERODACTYL, 81, DRAGONITE,  end
    db  "Lance@",  119, GYARADOS,  122, CHARIZARD, 120, ELECTABUZZ,124, SNORLAX,   117, AERODACTYL,125, DRAGONITE,  end
