; overworld sprites
; SpriteSheetPointerTable indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE                    ; $00
	const SPRITE_RED                     ; $01
	const SPRITE_BLUE                    ; $02
	const SPRITE_OAK                     ; $03
	const SPRITE_YOUNGSTER               ; $04
	const SPRITE_MONSTER                 ; $05 ;;;;;; THIS
	const SPRITE_COOLTRAINER_F           ; $06
	const SPRITE_COOLTRAINER_M           ; $07
	const SPRITE_LITTLE_GIRL             ; $08
	const SPRITE_BIRD                    ; $09 ;;;;;; THIS
	const SPRITE_MIDDLE_AGED_MAN         ; $0a
	const SPRITE_GAMBLER                 ; $0b
	const SPRITE_SUPER_NERD              ; $0c
	const SPRITE_GIRL                    ; $0d
	const SPRITE_HIKER                   ; $0e
	const SPRITE_BEAUTY                  ; $0f
	const SPRITE_GENTLEMAN               ; $10
	const SPRITE_DAISY                   ; $11
	const SPRITE_BIKER                   ; $12
	const SPRITE_SAILOR                  ; $13
	const SPRITE_COOK                    ; $14
	const SPRITE_BIKE_SHOP_CLERK         ; $15
	const SPRITE_MR_FUJI                 ; $16
	const SPRITE_GIOVANNI                ; $17
	const SPRITE_ROCKET                  ; $18
	const SPRITE_CHANNELER               ; $19
	const SPRITE_WAITER                  ; $1a
	const SPRITE_ERIKA                   ; $1b
	const SPRITE_MIDDLE_AGED_WOMAN       ; $1c
	const SPRITE_BRUNETTE_GIRL           ; $1d
	const SPRITE_LANCE                   ; $1e
	const SPRITE_BROCK            		 ; $1f
	const SPRITE_SCIENTIST               ; $20
	const SPRITE_ROCKER                  ; $21
	const SPRITE_SWIMMER                 ; $22
	const SPRITE_SAFARI_ZONE_WORKER      ; $23
	const SPRITE_GYM_GUIDE               ; $24
	const SPRITE_GRAMPS                  ; $25
	const SPRITE_CLERK                   ; $26
	const SPRITE_FISHING_GURU            ; $27
	const SPRITE_GRANNY                  ; $28
	const SPRITE_NURSE                   ; $29
	const SPRITE_LINK_RECEPTIONIST       ; $2a
	const SPRITE_SILPH_PRESIDENT         ; $2b
	const SPRITE_SILPH_WORKER            ; $2c
	const SPRITE_WARDEN                  ; $2d
	const SPRITE_CAPTAIN                 ; $2e
	const SPRITE_FISHER                  ; $2f
	const SPRITE_KOGA                    ; $30
	const SPRITE_GUARD                   ; $31
	const SPRITE_MISTY            		 ; $32
	const SPRITE_MOM                     ; $33
	const SPRITE_BALDING_GUY             ; $34
	const SPRITE_LITTLE_BOY              ; $35
	const SPRITE_LTSURGE            	 ; $36
	const SPRITE_GAMEBOY_KID             ; $37
	const SPRITE_FAIRY                   ; $38 ;;;;;; THIS
	const SPRITE_AGATHA                  ; $39
	const SPRITE_BRUNO                   ; $3a
	const SPRITE_LORELEI                 ; $3b
	const SPRITE_SEEL                    ; $3c ;;;;;; THIS
	const SPRITE_PIKACHU                 ; $3d ;;;;;; THIS
	const SPRITE_OFFICER_JENNY           ; $3e
	const SPRITE_SANDSHREW               ; $3f
	const SPRITE_ODDISH                  ; $40
	const SPRITE_BULBASAUR               ; $41
	const SPRITE_JIGGLYPUFF              ; $42
	const SPRITE_CLEFAIRY                ; $43
	const SPRITE_CHANSEY                 ; $44
	const SPRITE_JESSIE                  ; $45
	const SPRITE_JAMES                   ; $46
	const SPRITE_ARTICUNO ; seafom island
	const SPRITE_MOLTRES ; victory road
	const SPRITE_ZAPDOS ; power plany
	const SPRITE_MEWTWO ; cerulean cave
	const SPRITE_MEW ; mew event under the truck
	const SPRITE_KABUTO ; used for bill in bill's house
	const SPRITE_POLIWRATH ; celadon city
	const SPRITE_MEOWTH ; celadon mansion 1f
	const SPRITE_NIDORANF ; celadon mansion 1f
	; clefairy in celadon mansion 1f uses sprite_fairy
	; SPRITE_FAIRY is just SPRITE_CLEFAIRY but with walk frames added can we just use the clefairy one and remove fairy?
	const SPRITE_DODUO ; copycat house in saffron city
	const SPRITE_KANGASKHAN ; fuchsia city
	const SPRITE_SLOWPOKE ; fuchsia city
	const SPRITE_LAPRAS ; fuchsia city
	; fuchsia city has a fossil which is kabuto or omanyte, depending on which one we took at mt moon
	const SPRITE_CUBONE ; cubone house in lavender town
	const SPRITE_PSYDUCK ; mr fuji house in lavender town
	const SPRITE_NIDORINO ; mr fuji house in lavender town
	const SPRITE_NIDORANM ; nidoran house in pewter city
	const SPRITE_MACHOKE ; ss anne b1f
	const SPRITE_MACHOP ; vermilion city
	const SPRITE_FEAROW ; fly house in route 16
	const SPRITE_PIDGEOT ; saffron city
	const SPRITE_PIDGEY ; pidgey houses in saffron city and vermilion city
	const SPRITE_SPEAROW ; viridian nickname house
	const SPRITE_SEEL2 ; pokemon fan club in vermilion city, SPRITE_SEEL is still used for surfing
    DEF FIRST_STILL_SPRITE EQU const_value
	const SPRITE_VOLTORB ; fuchsia city
	const SPRITE_ELECTRODE ; cerulean city
    const SPRITE_WIGGLYTUFF ; ss anne 1f
	const SPRITE_POKE_BALL               ; $47
	const SPRITE_FOSSIL                  ; $48
	const SPRITE_BOULDER                 ; $49
	const SPRITE_PAPER                   ; $4a
	const SPRITE_POKEDEX                 ; $4b
	const SPRITE_CLIPBOARD               ; $4c
	const SPRITE_SNORLAX                 ; $4d
	const SPRITE_BLAINE        			 ; $4e
	const SPRITE_OLD_AMBER               ; $4f
	const SPRITE_SABRINA 				 ; $50
	const SPRITE_UNUSED_GAMBLER_ASLEEP_2 ; $51
	const SPRITE_GAMBLER_ASLEEP          ; $52
DEF NUM_SPRITES EQU const_value - 1
