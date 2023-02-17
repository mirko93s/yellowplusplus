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

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData: ; COMPLETED
	db 14, RATTATA, EKANS, 0                            ;  1 - Route 3
	db 16, SPEAROW, SANDSHREW, 0                        ;  2 - Route 3
	db 16, RATTATA, MACHOP, ZUBAT, 0                    ;  3 - Mt. Moon 1F
	db 20, RATICATE, ARBOK, GOLBAT, 0                   ;  4 - Route 24
	db 23, RATTATA, SPEAROW, 0                          ;  5 - Route 25
	db 23, SLOWPOKE, SHELLDER, 0                        ;  6 - Route 25
	db 23, EKANS, SANDSHREW, 0                          ;  7 - Route 25
	db 25, NIDORINO, 0                                  ;  8 - SS Anne 1F Rooms
	db 33, SANDSLASH, 0                                 ;  9 - Route 9
	db 25, EKANS, KOFFING, 0                            ; 10 - Route 11
	db 26, SANDSHREW, ZUBAT, 0                          ; 11 - Route 11
	db 26, RATTATA, RATICATE, 0                         ; 12 - Route 11
	db 26, NIDORAN_M, NIDORINO, 0                       ; 13 - Route 11

BugCatcherData: ; COMPLETED
	db  9, WEEDLE, CATERPIE, 0                          ;  1 - Viridian Forest
	db 11, KAKUNA, METAPOD, 0                           ;  2 - Viridian Forest
	db 13, BUTTERFREE, BEEDRILL, 0                      ;  3 - Viridian Forest
	db 10, BUTTERFREE, 0                                ;  4 - Viridian Forest
	db 13, PINSIR, 0                                    ;  5 - Route 3
	db 15, CATERPIE, METAPOD, 0                         ;  6 - Route 3
	db 15, ODDISH, PARAS, VENONAT, 0                    ;  7 - Route 3
	db 17, BUTTERFREE, 0                                ;  8 - Mt. Moon 1F
	db 17, BEEDRILL, 0                                  ;  9 - Mt. Moon 1F
	db 20, BUTTERFREE, SCYTHER, 0                       ; 10 - Route 24
	db 25, WEEDLE, CATERPIE, WEEDLE, 0                  ; 11 - Route 6
	db 25, BUTTERFREE, TANGELA, 0                       ; 12 - Route 6
	db 33, BUTTERFREE, BEEDRILL, 0                      ; 13 - Route 9
	db 32, BEEDRILL, BUTTERFREE, VENONAT, 0             ; 14 - Route 9

LassData: ; COMPLETED
	db 10, NIDORAN_M, NIDORAN_F, 0                      ;  1 - Viridian Forest
	db 14, JIGGLYPUFF, JIGGLYPUFF, EEVEE, 0             ;  2 - Route 3
	db 15, JIGGLYPUFF, CLEFAIRY, 0                      ;  3 - Route 3
	db 15, WIGGLYTUFF, CLEFABLE, 0                      ;  4 - Route 3
	db 16, ODDISH, BELLSPROUT, 0                        ;  5 - Mt. Moon 1F
	db 16, CLEFAIRY, 0                                  ;  6 - Mt. Moon 1F
	db 45, PARAS, PARAS, PARASECT, 0                    ;  7 - Route 4
	db 20, NIDORINO, CLEFABLE, 0                        ;  8 - Route 24
	db 20, NIDORINA, WIGGLYTUFF, 0                      ;  9 - Route 24
	db 23, NIDORINO, NIDORINA, 0                        ; 10 - Route 25
	db 23, ODDISH, PIDGEOTTO, 0                         ; 11 - Route 25
	db 25, PORYGON, NIDORINA, 0                         ; 12 - SS Anne 1F Rooms
	db 25, RATTATA, PIKACHU, 0                          ; 13 - SS Anne 2F Rooms
	db 36, NIDOQUEEN, 0                                 ; 14 - Route 8
	db 36, PERSIAN, PIDGEOT, 0                          ; 15 - Route 8
	db 36, DRAGONAIR, NIDOKING, PERSIAN, 0              ; 16 - Route 8
	db 37, CLEFABLE, 0                                  ; 17 - Route 8
	db 37, BELLSPROUT, WEEPINBELL, VICTREEBEL, 0        ; 18 - Celadon Gym
	db 41, VILEPLUME, 0                                 ; 19 - Celadon Gym

SailorData: ; COMPLETED
	db 35, RAICHU, 0                                    ;  1 - Vermilion Gym
	db 25, OMANYTE, KABUTO, 0                           ;  2 - SS Anne Bow
	db 25, MACHOP, TENTACOOL, 0                         ;  3 - SS Anne Bow
	db 25, SHELLDER, TENTACOOL, 0                       ;  4 - SS Anne B1F Rooms
	db 26, HORSEA, SHELLDER, TENTACOOL, 0               ;  5 - SS Anne B1F Rooms
	db 26, TENTACOOL, STARYU, HORSEA, 0                 ;  6 - SS Anne B1F Rooms
	db 25, SQUIRTLE, TENTACOOL, 0                       ;  7 - SS Anne B1F Rooms
	db 25, MACHOP, MANKEY, HITMONCHAN, 0                ;  8 - SS Anne B1F Rooms

JrTrainerMData: ; COMPLETED
	db 14, DIGLETT, SANDSHREW, 0                        ;  1 - Pewter Gym
	db 23, POLIWAG, GOLDEEN, 0                          ;  2 - Route 24
	db 20, PRIMEAPE, MACHOKE, 0                         ;  3 - Route 24
	db 25, PIDGEOTTO, GLOOM, 0                          ;  4 - Route 25 ; luca
	db 25, SPEAROW, DODUO, 0                            ;  5 - Route 6
	db 23, WEEPINBELL, 0                                ;  6 - Route 6
	db 32, RATICATE, DUGTRIO, ARBOK, SANDSLASH, 0       ;  7 - Route 9
	db 53, NIDOKING, 0                                  ;  8 - Route 12

JrTrainerFData: ; COMPLETED
	db 25, GOLDEEN, 0                                   ;  1 - Cerulean Gym
	db 25, CUBONE, 0                                    ;  2 - Route 6
	db 25, PIDGEY, SPEAROW, 0                           ;  3 - Route 6
	db 32, GLOOM, WEEPINBELL, 0                         ;  4 - Route 9
	db 33, PERSIAN, 0                                   ;  5 - Route 9
	db 36, RAICHU, CLEFABLE, 0                          ;  6 - Route 10
	db 38, PERSIAN, PIDGEOT, 0                          ;  7 - Route 10
	db 36, WEEPINBELL, CLEFABLE, 0                      ;  8 - Rock Tunnel 1F
	db 36, VILEPLUME, PERSIAN, 0                        ;  9 - Rock Tunnel 1F
	db 36, PIDGEOT, RATICATE, 0                         ; 10 - Rock Tunnel 1F
	db 37, WIGGLYTUFF, PIDGEOT, 0                       ; 11 - Rock Tunnel B1F
	db 36, GLOOM, IVYSAUR, 0                            ; 12 - Rock Tunnel B1F
	db 42, BULBASAUR, IVYSAUR, VENUSAUR, 0              ; 13 - Celadon Gym
	db 52, PIDGEOT, RAICHU, PERSIAN, 0                  ; 14 - Route 13
	db 52, POLIWRATH, 0                                 ; 15 - Route 13
	db 52, PIDGEOT, PIDGEOT, 0                          ; 16 - Route 13
	db 52, SEAKING, SEADRA, 0                           ; 17 - Route 13
	db 54, VILEPLUME, 0                                 ; 18 - Route 15
	db 54, RAICHU, 0                                    ; 19 - Route 15
	db 54, CLEFABLE, 0                                  ; 20 - Route 15
	db 54, VICTREEBEL, TANGELA, 0                       ; 21 - Route 15
	db 56, TENTACRUEL, SEADRA, DEWGONG, 0               ; 22 - Route 20
	db 56, SEAKING, SEAKING, 0                          ; 23 - Route 20

PokemaniacData: ; COMPLETED
	db 40, RHYHORN, LICKITUNG, 0                        ;  1 - Route 10
	db 37, MAROWAK, SANDSLASH, 0                        ;  2 - Route 10
	db 35, CUBONE, SLOWPOKE, 0                          ;  3 - Rock Tunnel 1F
	db 36, SLOWBRO, MAROWAK, 0                          ;  4 - Rock Tunnel B1F
	db 36, CHARMELEON, MAROWAK, 0                       ;  5 - Rock Tunnel B1F
	db 35, SLOWBRO, 0                                   ;  6 - Rock Tunnel B1F
	db 65, CHARIZARD, LAPRAS, LICKITUNG, 0              ;  7 - Victory Road 2F

SuperNerdData: ; COMPLETED
	db 17, MAGNEMITE, VOLTORB, 0                        ;  1 - Mt. Moon 1F
	db 20, MAGNETON, ELECTRODE, 0                       ;  2 - Mt. Moon B2F
	db 36, ELECTRODE, MAGNETON, ELECTABUZZ, 0           ;  3 - Route 8
	db 36, MUK, 0                                       ;  4 - Route 8
	db 36, WEEZING, 0                                   ;  5 - Route 8
	db 60, NINETALES, 0                                 ;  6 - Cinnabar Gym
	db 61, CHARIZARD, ARCANINE, 0                       ;  7 - Cinnabar Gym
	db 61, RAPIDASH, 0                                  ;  8 - Cinnabar Gym
	db 62, ARCANINE, RAPIDASH, 0                        ;  9 - Cinnabar Gym

HikerData: ; COMPLETED
	db 17, GEODUDE, MACHOP, ONIX, 0                     ;  1 - Mt. Moon 1F
	db 22, MACHOP, GEODUDE, 0                           ;  2 - Route 25
	db 23, GEODUDE, MANKEY, MACHOP, 0                   ;  3 - Route 25
	db 23, GEODUDE, ONIX, 0                             ;  4 - Route 25
	db 34, MACHOKE, MACHOKE, 0                          ;  5 - Route 9
	db 34, GRAVELER, MACHOKE, 0                         ;  6 - Route 9
	db 33, GRAVELER, ONIX, 0                            ;  7 - Route 9
	db 36, MACHOKE, ONIX, 0                             ;  8 - Route 10
	db 36, ONIX, GOLEM, 0                               ;  9 - Route 10
	db 36, MACHAMP, 0                                   ; 10 - Rock Tunnel 1F
	db 36, KABUTO, OMANYTE, 0                           ; 11 - Rock Tunnel 1F
	db 36, GOLEM, 0                                     ; 12 - Rock Tunnel 1F
	db 35, ONIX, GRAVELER, 0                            ; 13 - Rock Tunnel B1F
	db 35, GRAVELER, MACHOKE, 0                         ; 14 - Rock Tunnel B1F
	db 35, AERODACTYL, 0                                ; 15 - Rock Tunnel B1F

BikerData: ; COMPLETED
	db 52, WEEZING, MUK, ARBOK, 0                       ;  1 - Route 13
	db 53, MUK, WEEZING, 0                              ;  2 - Route 14
	db 53, KOFFING, WEEZING, 0                          ;  3 - Route 14
	db 53, GRIMER, MUK, 0                               ;  4 - Route 14
	db 53, RHYHORN, RHYDON, 0                           ;  5 - Route 14
	db 54, WEEZING, MUK, 0                              ;  6 - Route 15
	db 54, MUK, WEEZING, 0                              ;  7 - Route 15
	db 52, MUK, WEEZING, 0                              ;  8 - Route 16
	db 53, DITTO, 0                                     ;  9 - Route 16
	db 52, MUK, MUK, 0                                  ; 10 - Route 16
	db 53, WEEZING, WEEZING, 0                          ; 11 - Route 17
	db 53, MUK, 0                                       ; 12 - Route 17
	db 53, ELECTRODE, MAGNETON, 0                       ; 13 - Route 17
	db 54, GROWLITHE, VULPIX, 0                         ; 14 - Route 17
	db 54, WEEZING, WEEZING, 0                          ; 15 - Route 17

BurglarData: ; COMPLETED
	db 60, ARCANINE, NINETALES, 0                       ;  1 - Cinnabar Gym
	db 61, FLAREON, 0                                   ;  2 - Cinnabar Gym
	db 61, NINETALES, ARCANINE, 0                       ;  3 - Cinnabar Gym
	db 57, CHARIZARD, 0                                 ;  4 - Mansion 2F
	db 58, NINETALES, 0                                 ;  5 - Mansion 3F
	db 58, ARCANINE, RAPIDASH, 0                        ;  6 - Mansion B1F

EngineerData: ; COMPLETED
	db 23, MAGNETON, 0                                  ;  1 - Route 11
	db 21, MAGNETON, RAICHU, 0                          ;  2 - Route 11

UnusedJugglerData:
; none

FisherData: ; COMPLETED
	db 26, GOLDEEN, TENTACOOL, VAPOREON, 0              ;  1 - SS Anne 2F Rooms
	db 25, TENTACOOL, STARYU, SHELLDER, 0               ;  2 - SS Anne B1F Rooms
	db 37, POLIWRATH, SEAKING, 0                        ;  3 - Route 12
	db 38, TENTACRUEL, SEAKING, 0                       ;  4 - Route 12
	db 37, SEAKING, VAPOREON, 0                         ;  5 - Route 12
	db 37, POLIWRATH, SEAKING, SEADRA, 0                ;  6 - Route 12
	db 52, GYARADOS, 0                                  ;  7 - Route 12
	db 55, SEAKING, SEAKING, 0                          ;  8 - Route 21
	db 55, GYARADOS, GYARADOS, GYARADOS, 0              ;  9 - Route 21
	db 56, CLOYSTER, 0                                  ; 10 - Route 21
	db 56, SEAKING, SEAKING, 0                          ; 11 - Route 21

SwimmerData: ; COMPLETED
	db 24, HORSEA, SHELLDER, 0                          ;  1 - Cerulean Gym
	db 54, TENTACRUEL, CLOYSTER, 0                      ;  2 - Route 19
	db 54, SEADRA, STARMIE, 0                           ;  3 - Route 19
	db 54, POLIWRATH, 0                                 ;  4 - Route 19
	db 54, TENTACRUEL, SEADRA, 0                        ;  5 - Route 19
	db 55, SEAKING, 0                                   ;  6 - Route 19
	db 54, SEADRA, 0                                    ;  7 - Route 19
	db 55, TENTACRUEL, 0                                ;  8 - Route 19
	db 55, SHELLDER, CLOYSTER, 0                        ;  9 - Route 20
	db 56, STARMIE, 0                                   ; 10 - Route 20
	db 55, SEADRA, SEADRA, 0                            ; 11 - Route 20
	db 56, SEADRA, TENTACRUEL, 0                        ; 12 - Route 21
	db 56, STARMIE, 0                                   ; 13 - Route 21
	db 55, STARMIE, BLASTOISE, 0                        ; 14 - Route 21
	db 55, POLIWRATH, TENTACRUEL, SEADRA, 0             ; 15 - Route 21

CueBallData: ; COMPLETED
	db 52, MACHAMP, 0                                   ;  1 - Route 16
	db 52, PRIMEAPE, 0                                  ;  2 - Route 16
	db 52, MACHAMP, 0                                   ;  3 - Route 16
	db 53, PRIMEAPE, 0                                  ;  4 - Route 17
	db 53, MACHAMP, 0                                   ;  5 - Route 17
	db 53, HITMONLEE, 0                                 ;  6 - Route 17
	db 53, PRIMEAPE, MACHAMP, 0                         ;  7 - Route 17
	db 53, MACHAMP, PRIMEAPE, 0                         ;  8 - Route 17
	db 56, HITMONCHAN, 0                                ;  9 - Route 21

GamblerData: ; COMPLETED
	db 36, POLIWAG, POLIWHIRL, POLIWRATH, 0             ;  1 - Route 8
	db 36, ARCANINE, NINETALES, 0                       ;  2 - Route 8
	db 26, POLIWHIRL, HORSEA, 0                         ;  3 - Route 11
	db 25, WEEPINBELL, GLOOM, 0                         ;  4 - Route 11
	db 26, VOLTORB, MAGNEMITE, 0                        ;  5 - Route 11
	db 26, GROWLITHE, VULPIX, 0                         ;  6 - Route 11

BeautyData: ; COMPLETED
	db 41, ODDISH, GLOOM, VILEPLUME, 0                  ;  1 - Celadon Gym
	db 42, VICTREEBEL, 0                                ;  2 - Celadon Gym
	db 42, EXEGGCUTE, EXEGGUTOR, 0                      ;  3 - Celadon Gym
	db 52, RATICATE, 0                                  ;  4 - Route 13
	db 52, PERSIAN, 0                                   ;  5 - Route 13
	db 54, PIDGEOT, WIGGLYTUFF, 0                       ;  6 - Route 15
	db 54, VENUSAUR, 0                                  ;  7 - Route 15
	db 54, POLIWRATH, SEAKING, 0                        ;  8 - Route 19
	db 55, SEAKING, SEAKING, 0                          ;  9 - Route 19
	db 55, STARMIE, DEWGONG, 0                          ; 10 - Route 19
	db 55, SEADRA, SEADRA, 0                            ; 11 - Route 20
	db 55, SEAKING, 0                                   ; 12 - Route 20
	db 53, CLOYSTER, SEAKING, 0                         ; 13 - Route 20
	db 55, POLIWRATH, SEAKING, 0                        ; 14 - Route 20

PsychicData: ; COMPLETED
	db 51, ABRA, KADABRA, ALAKAZAM, 0                   ;  1 - Saffron Gym
	db 51, MR_MIME, ALAKAZAM, 0                         ;  2 - Saffron Gym
	db 50, SLOWPOKE, SLOWPOKE, MR_MIME, 0               ;  3 - Saffron Gym
	db 52, SLOWBRO, 0                                   ;  4 - Saffron Gym

RockerData: ; COMPLETED
	db 35, VOLTORB, ELECTRODE, 0                        ;  1 - Vermilion Gym
	db 52, RAICHU, ELECTABUZZ, 0                        ;  2 - Route 12

JugglerData: ; COMPLETED
	db 46, ALAKAZAM, MR_MIME, 0                         ;  1 - Silph Co. 5F
	db 55, GOLBAT, MUK, 0                               ;  2 - Fuchsia Gym
	db 56, MUK, WEEZING, MUK, 0                         ;  3 - Fuchsia Gym
	db 55, GOLBAT, WEEZING, MUK, 0                      ;  4 - Fuchsia Gym
	db 56, MUK, TENTACRUEL, WEEZING, 0                  ;  5 - Fuchsia Gym
	db 63, HYPNO, ALAKAZAM, 0                           ;  6 - Victory Road 2F
	db 64, MR_MIME, 0                                   ;  7 - Victory Road 2F

TamerData: ; COMPLETED
	db 56, NIDOKING, ARBOK, 0                           ;  1 - Fuchsia Gym
	db 56, ARBOK, NIDOKING, ARBOK, 0                    ;  2 - Fuchsia Gym
	db 62, RHYDON, 0                                    ;  3 - Viridian Gym
	db 62, ARBOK, TAUROS, 0                             ;  4 - Viridian Gym
	db 63, PERSIAN, GOLDUCK, 0                          ;  5 - Victory Road 2F

BirdKeeperData: ; COMPLETED
	db 53, PIDGEOT, 0                                   ;  1 - Route 13
	db 53, FEAROW, PIDGEOTTO, PIDGEOT, FEAROW, 0        ;  2 - Route 13
	db 52, PIDGEOT, FEAROW, 0                           ;  3 - Route 13
	db 52, DODRIO, PIDGEOT, 0                           ;  4 - Route 14
	db 52, SPEAROW, FEAROW, 0                           ;  5 - Route 14
	db 53, PIDGEOT, FEAROW, 0                           ;  6 - Route 14
	db 53, DODRIO, FEAROW, 0                            ;  7 - Route 14
	db 53, FARFETCHD, 0                                 ;  8 - Route 14
	db 54, FEAROW, 0                                    ;  9 - Route 14
	db 54, PIDGEOT, FARFETCHD, DODRIO, 0                ; 10 - Route 15
	db 53, DODRIO, DODRIO, 0                            ; 11 - Route 15
	db 54, FEAROW, 0                                    ; 12 - Route 18
	db 54, DODRIO, 0                                    ; 13 - Route 18
	db 53, FEAROW, FEAROW, 0                            ; 14 - Route 18
	db 55, FEAROW, FEAROW, PIDGEOT, 0                   ; 15 - Route 20

BlackbeltData: ; COMPLETED
	db 50, HITMONLEE, HITMONCHAN, 0                     ;  1 - Fighting Dojo Leader
	db 45, PRIMEAPE, 0                                  ;  2 - Fighting Dojo
	db 45, MACHAMP, 0                                   ;  3 - Fighting Dojo
	db 45, PRIMEAPE, 0                                  ;  4 - Fighting Dojo
	db 45, PRIMEAPE, 0                                  ;  5 - Fighting Dojo
	db 61, MACHAMP, 0                                   ;  6 - Viridian Gym
	db 62, MACHAMP, 0                                   ;  7 - Viridian Gym
	db 61, MACHAMP, 0                                   ;  8 - Viridian Gym
	db 63, MACHAMP, MACHAMP, 0                          ;  9 - Victory Road 2F

ScientistData: ; COMPLETED
	db 45, MUK, WEEZING, 0                              ;  1 - Silph Co. 2F
	db 45, ELECTRODE, MAGNETON, 0                       ;  2 - Silph Co. 2F
	db 45, MAGNETON, WEEZING, 0                         ;  3 - Silph Co. 3F
	db 45, ELECTRODE, JOLTEON, 0                        ;  4 - Silph Co. 4F
	db 46, ELECTRODE, MAGNETON, 0                       ;  5 - Silph Co. 5F
	db 46, ELECTRODE, MAGNETON, WEEZING, 0              ;  6 - Silph Co. 6F
	db 46, MAGNETON, MUK, 0                             ;  7 - Silph Co. 7F
	db 47, MUK, ELECTRODE, 0                            ;  8 - Silph Co. 8F
	db 47, JOLTEON, DRAGONITE, 0                        ;  9 - Silph Co. 9F
	db 47, MAGNEMITE, ELECTABUZZ, 0                     ; 10 - Silph Co. 10F
	db 57, WEEZING, ELECTRODE, 0                        ; 11 - Mansion 1F
	db 57, MAGNETON, JOLTEON, 0                         ; 12 - Mansion 3F
	db 58, MAGNETON, ELECTRODE, 0                       ; 13 - Mansion B1F

RocketData: ; COMPLETED
	db 16, SANDSHREW, RATTATA, ZUBAT, 0                 ;  1 - Mt. Moon B2F
	db 17, ZUBAT, EKANS, 0                              ;  2 - Mt. Moon B2F
	db 16, RATTATA, ZUBAT, 0                            ;  3 - Mt. Moon B2F
	db 25, MACHOKE, DROWZEE, 0                          ;  4 - Cerulean City
	db 21, RATICATE, GOLBAT, ARBOK, 0                   ;  5 - Route 24
	db 40, RATICATE, GOLBAT, 0                          ;  6 - Game Corner
	db 40, HYPNO, MACHOKE, 0                            ;  7 - Rocket Hideout B1F
	db 40, RATICATE, RATICATE, 0                        ;  8 - Rocket Hideout B1F
	db 40, WEEZING, MUK, 0                              ;  9 - Rocket Hideout B1F
	db 41, RATICATE, RATICATE, 0                        ; 10 - Rocket Hideout B1F
	db 41, MUK, WEEZING, 0                              ; 11 - Rocket Hideout B1F
	db 41, GOLBAT, RATICATE, GOLBAT, 0                  ; 12 - Rocket Hideout B2F
	db 42, RATICATE, HYPNO, 0                           ; 13 - Rocket Hideout B3F
	db 42, MACHOKE, MACHOKE, 0                          ; 14 - Rocket Hideout B3F
	db 43, WEEZING, GOLBAT, MUK, 0                      ; 15 - Rocket Hideout B4F
	db 45, MAROWAK, GOLBAT, 0                           ; 16 - Silph Co. 2F
	db 45, GOLBAT,RATICATE, GOLBAT, 0                   ; 17 - Silph Co. 2F
	db 45, RATICATE, HYPNO, RATICATE, 0                 ; 18 - Silph Co. 3F
	db 45, MACHAMP, HYPNO, 0                            ; 19 - Silph Co. 4F
	db 45, ARBOK, SANDSLASH, 0                          ; 20 - Silph Co. 4F
	db 46, ARBOK, 0                                     ; 21 - Silph Co. 5F
	db 46, HYPNO, 0                                     ; 22 - Silph Co. 5F
	db 46, MACHOKE, MACHAMP, 0                          ; 23 - Silph Co. 6F
	db 46, GOLBAT, GOLBAT, 0                            ; 24 - Silph Co. 6F
	db 46, RATICATE, ARBOK, WEEZING, GOLBAT, 0          ; 25 - Silph Co. 7F
	db 46, CUBONE, MAROWAK, 0                           ; 26 - Silph Co. 7F
	db 46, SANDSHREW, SANDSLASH, 0                      ; 27 - Silph Co. 7F
	db 47, RATICATE, GOLBAT, 0                          ; 28 - Silph Co. 8F
	db 47, WEEZING, GOLBAT, 0                           ; 29 - Silph Co. 8F
	db 47, HYPNO, MUK, 0                                ; 30 - Silph Co. 9F
	db 47, GOLBAT, HYPNO, 0                             ; 31 - Silph Co. 9F
	db 47, MACHAMP, 0                                   ; 32 - Silph Co. 10F
	db 47, RATICATE, GOLBAT, ARBOK, 0                   ; 33 - Silph Co. 11F
	db 18, EKANS, MEOWTH, KOFFING, 0                    ; 34 - Jessie & James Mt. Moon B2F
	db 44, WEEZING, MEOWTH, ARBOK, 0                    ; 35 - Jessie & James Rocket Hideout B4F
	db 48, MEOWTH, ARBOK, WEEZING, 0                    ; 36 - Jessie & James Pokémon Tower 7F
	db 50, WEEZING, ARBOK, MEOWTH, 0                    ; 37 - Jessie & James Silph Co. 11F

CooltrainerMData: ; COMPLETED
	db 60, SANDSLASH, DUGTRIO, 0                        ;  1 - Viridian Gym
	db 61, RHYDON, 0                                    ;  2 - Viridian Gym
	db 61, NIDORINO, NIDOKING, 0                        ;  3 - Viridian Gym
	db 64, VENUSAUR, BLASTOISE, CHARIZARD, 0            ;  4 - Victory Road 1F
	db 63, EXEGGUTOR, CLOYSTER, ARCANINE, 0             ;  5 - Victory Road 3F
	db 63, KINGLER, TENTACRUEL, BLASTOISE, 0            ;  6 - Victory Road 3F

CooltrainerFData: ; COMPLETED
	db 41, VICTREEBEL, VILEPLUME, VENUSAUR, 0           ;  1 - Celadon Gym
	db 64, PERSIAN, NINETALES, 0                        ;  2 - Victory Road 1F
	db 63, VENOMOTH, VILEPLUME, VICTREEBEL, 0           ;  3 - Victory Road 3F
	db 63, PARASECT, DEWGONG, CHANSEY, 0                ;  4 - Victory Road 3F

GentlemanData: ; COMPLETED
	db 35, MAGNEMITE, MAGNETON, 0                       ;  1 - Vermilion Gym
	db 26, GROWLITHE, PONYTA, CHARMANDER, 0             ;  2 - SS Anne 1F Rooms
	db 25, NIDORINO, NIDORINA, 0                        ;  3 - SS Anne 1F Rooms
	db 35, RAICHU, 0                                    ;  4 - SS Anne 2F Rooms
	db 25, GROWLITHE, PONYTA, 0                         ;  5 - SS Anne 2F Rooms

ChannelerData: ; COMPLETED
	db 38, GASTLY, 0                                    ;  1 - Pokémon Tower 3F
	db 39, GASTLY, 0                                    ;  2 - Pokémon Tower 3F
	db 38, GASTLY, 0                                    ;  3 - Pokémon Tower 3F
	db 39, GASTLY, 0                                    ;  4 - Pokémon Tower 4F
	db 39, GASTLY, HAUNTER, 0                           ;  5 - Pokémon Tower 4F
	db 38, HAUNTER, 0                                   ;  6 - Pokémon Tower 4F
	db 39, HAUNTER, 0                                   ;  7 - Pokémon Tower 5F
	db 39, HAUNTER, 0                                   ;  8 - Pokémon Tower 5F
	db 40, HAUNTER, 0                                   ;  9 - Pokémon Tower 5F
	db 40, HAUNTER, 0                                   ; 10 - Pokémon Tower 5F
	db 40, GASTLY, HAUNTER, GENGAR, 0                   ; 11 - Pokémon Tower 6F
	db 39, GENGAR, 0                                    ; 12 - Pokémon Tower 6F
	db 40, GENGAR, 0                                    ; 13 - Pokémon Tower 6F
	db 51, HAUNTER, GENGAR, 0                           ; 14 - Saffron Gym
	db 52, GENGAR, 0                                    ; 15 - Saffron Gym
	db 53, GASTLY, HAUNTER, GENGAR, 0                   ; 16 - Saffron Gym

ProfOakData: ; Unused ;todo
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, BLASTOISE, 70, GYARADOS, 0
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, VENUSAUR, 70, GYARADOS, 0
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, CHARIZARD, 70, GYARADOS, 0

ChiefData:
; none

Rival1Data: ; COMPLETED
	db 5, EEVEE, 0
; Route 22
	db $FF, 8, RATTATA, 9, SPEAROW, 8, PIDGEY, 10, EEVEE, 0
; Cerulean City
	db $FF, 21, PIDGEOTTO, 20, KADABRA, 21, RATICATE, 22, EEVEE, 0

Rival2Data: ; COMPLETED
; SS Anne 2F
	db $FF, 33, DODUO, 31, GRAVELER, 32, PIDGEOTTO, 32, KADABRA, 33, EEVEE, 0
; Pokémon Tower 2F
	db $FF, 45, PIDGEOT, 43, GOLEM, 42, ALAKAZAM, 43, SANDSLASH, 45, JOLTEON, 0
	db $FF, 45, PIDGEOT, 43, GOLEM, 42, ALAKAZAM, 43, SANDSLASH, 45, FLAREON, 0
	db $FF, 45, PIDGEOT, 43, GOLEM, 42, ALAKAZAM, 43, SANDSLASH, 45, VAPOREON, 0
; Silph Co. 7F
	db $FF, 52, SANDSLASH, 53, DODRIO, 51, ALAKAZAM, 50, ARCANINE, 50, STARMIE, 55, JOLTEON, 0
	db $FF, 52, SANDSLASH, 53, DODRIO, 51, ALAKAZAM, 50, EXEGGUTOR, 50, STARMIE, 55, FLAREON, 0
	db $FF, 52, SANDSLASH, 53, DODRIO, 51, ALAKAZAM, 50, EXEGGUTOR, 50, ARCANINE, 55, VAPOREON, 0
; Route 22
	db $FF, 68, RHYDON, 71, ARCANINE, 73, TAUROS, 70, GYARADOS, 70, ALAKAZAM, 72, JOLTEON, 0
	db $FF, 68, RHYDON, 71, EXEGGUTOR, 73, TAUROS, 70, GYARADOS, 70, ALAKAZAM, 72, FLAREON, 0
	db $FF, 68, RHYDON, 71, EXEGGUTOR, 73, TAUROS, 70, ARCANINE, 70, ALAKAZAM, 72, VAPOREON, 0

Rival3Data: ; COMPLETED
	db $FF, 80, TAUROS, 79, ALAKAZAM, 81, ARCANINE, 78, GYARADOS,  82, JOLTEON,  80, MEWTWO, 0
	db $FF, 80, TAUROS, 79, ALAKAZAM, 81, EXEGGUTOR, 78, GYARADOS,  82, FLAREON,  80, MEWTWO, 0
	db $FF, 80, TAUROS, 79, ALAKAZAM, 81, EXEGGUTOR, 78, ARCANINE, 82, VAPOREON, 80, MEWTWO, 0

BrockData:
	db $FF, 12, AERODACTYL, 13, OMASTAR, 15, KABUTOPS, 0

MistyData:
	db $FF, 25, VAPOREON, 25, POLIWRATH, 25, DEWGONG, 26, STARMIE, 25, LAPRAS, 0

LtSurgeData:
	db $FF, 35, ELECTRODE, 34, MAGNETON, 35, JOLTEON, 34, ELECTABUZZ, 36, RAICHU, 0

ErikaData:
	db $FF, 45, VILEPLUME, 44, VENUSAUR, 44, TANGELA, 45, VICTREEBEL, 46, EXEGGUTOR, 0

KogaData:
	db $FF, 60, VENOMOTH, 59, WEEZING, 60, NIDOKING, 59, TENTACRUEL, 61, GENGAR, 0

SabrinaData:
	db $FF, 55, JYNX, 54, SLOWBRO, 54, HYPNO, 55, ALAKAZAM, 56, MR_MIME, 0

BlaineData:
	db $FF, 65, CHARIZARD, 64, RAPIDASH, 64, FLAREON, 65, ARCANINE, 66, MAGMAR, 0

GiovanniData:
	db $FF, 47, PERSIAN, 46, DUGTRIO, 47, GENGAR, 46, TAUROS, 47, RHYDON, 0		; Rocket Hideout B4F
	db $FF, 55, PERSIAN, 54, DUGTRIO, 55, GENGAR, 55, TAUROS, 55, RHYDON, 0		; Silph Co. 11F
	db $FF, 66, PERSIAN, 67, DUGTRIO, 67, GENGAR, 68, TAUROS, 67, RHYDON, 0		; Viridian Gym

LoreleiData:
	db $FF, 77, CLOYSTER, 78, VAPOREON, 76, SLOWBRO, 77, JYNX, 78, LAPRAS, 0

BrunoData:
	db $FF, 78, ONIX, 77, HITMONCHAN, 77, HITMONLEE, 78, PRIMEAPE, 77, MACHAMP, 0

AgathaData:
	db $FF, 79, GENGAR, 78, GOLBAT, 78, GENGAR, 78, ARBOK, 77, GENGAR, 0

LanceData:
	db $FF, 80, GYARADOS, 80, CHARIZARD, 79, ELECTABUZZ, 80, SNORLAX, 79, AERODACTYL, 80, DRAGONITE, 0
