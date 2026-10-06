DEF BAG_ITEM_CAPACITY EQU 25
DEF BALL_ITEM_CAPACITY EQU 10
DEF MAX_ITEM_STACK EQU 255
DEF NUM_BAG_KEY_ITEMS EQU 20
DEF BAG_VISIBLE_ROWS EQU 11
DEF BAG_UI_TILE_BASE EQU $62
DEF BAG_UI_TILE_COUNT EQU 22
DEF PAL_BG_BAG_FRAME EQU 5
DEF PAL_BG_BAG_ACCENT EQU 6

DEF SHOP_VISIBLE_ROWS EQU 11
DEF SHOP_UI_TILE_BASE EQU $60
DEF SHOP_UI_TILE_COUNT EQU 16
DEF SHOP_UI_CURSOR EQU $6d
DEF SHOP_UI_THUMB EQU $66
DEF PAL_BG_SHOP_ACCENT EQU 6

	const_def
	const ITEMS_POCKET
	const BALLS_POCKET
	const KEY_POCKET
	const TMHM_POCKET
DEF NUM_BAG_POCKETS EQU const_value

	const_def
	const BAG_CONTEXT_FIELD
	const BAG_CONTEXT_BATTLE
	const BAG_CONTEXT_SELL
	const BAG_CONTEXT_DEPOSIT
DEF PC_ITEM_CAPACITY  EQU 50

; Saved cheat flags (wCheatFlags). EXP and money use wCheatMultipliers.
	const_def
	const CHEAT_SHINY
	const CHEAT_CATCH
	const CHEAT_PP
	const CHEAT_HP
	const CHEAT_OHKO
	const CHEAT_CRITICAL
	const CHEAT_ACCURACY
	const CHEAT_WALLS
	const CHEAT_ITEMS
	const CHEAT_ENCOUNTERS
	const CHEAT_STATUS
	const CHEAT_UNLOCKED
	const CHEAT_PERFECT_DVS
	const CHEAT_LEARN_ANY
	const CHEAT_SAFARI
	const CHEAT_SUPER_EFFECTIVE
DEF CHEAT_SCOPED EQU $40
DEF CHEAT_WILD_LEVEL_SETTING EQU $82
DEF CHEAT_WILD_SPECIES_SETTING EQU $83
DEF SETTINGS_PAGE_SIZE EQU 12
DEF CHEAT_DATA_MAGIC EQU $c7
DEF CHEAT_DATA_VERSION EQU 2

; text box IDs
	const_def 1
	const MESSAGE_BOX                       ; $01
	const_skip                              ; $02
	const MENU_TEMPLATE_03                  ; $03 unused
	const FIELD_MOVE_MON_MENU               ; $04
	const JP_MOCHIMONO_MENU_TEMPLATE        ; $05
	const USE_INFO_TOSS_MENU_TEMPLATE            ; $06
	const MENU_TEMPLATE_07                  ; $07 unused
	const JP_SAVE_MESSAGE_MENU_TEMPLATE     ; $08
	const JP_SPEED_OPTIONS_MENU_TEMPLATE    ; $09
	const_skip                              ; $0a
	const BATTLE_MENU_TEMPLATE              ; $0b
	const SWITCH_STATS_CANCEL_MENU_TEMPLATE ; $0c
	const LIST_MENU_BOX                     ; $0d
	const BUY_SELL_QUIT_MENU_TEMPLATE       ; $0e
	const MONEY_BOX_TEMPLATE                ; $0f
	const MENU_TEMPLATE_10                  ; $10 unused
	const MON_SPRITE_POPUP                  ; $11
	const JP_AH_MENU_TEMPLATE               ; $12
	const MONEY_BOX                         ; $13
	const TWO_OPTION_MENU                   ; $14
	const BUY_SELL_QUIT_MENU                ; $15
	const_skip                              ; $16
	const_skip                              ; $17
	const_skip                              ; $18
	const_skip                              ; $19
	const JP_POKEDEX_MENU_TEMPLATE          ; $1a
	const SAFARI_BATTLE_MENU_TEMPLATE       ; $1b

; two option menu constants
; TwoOptionMenuStrings indexes (see data/yes_no_menu_strings.asm)
	const_def
	const YES_NO_MENU       ; 0
	const NORTH_WEST_MENU   ; 1
	const SOUTH_EAST_MENU   ; 2
	const WIDE_YES_NO_MENU  ; 3
	const NORTH_EAST_MENU   ; 4
	const TRADE_CANCEL_MENU ; 5
	const HEAL_CANCEL_MENU  ; 6
	const NO_YES_MENU       ; 7
DEF NUM_TWO_OPTION_MENUS EQU const_value

; menu exit method constants for list menus and the buy/sell/quit menu
DEF CHOSE_MENU_ITEM   EQU 1 ; pressed A
DEF CANCELLED_MENU    EQU 2 ; pressed B

; menu exit method constants for two-option menus
DEF CHOSE_FIRST_ITEM  EQU 1
DEF CHOSE_SECOND_ITEM EQU 2

; move mon constants
	const_def
	const BOX_TO_PARTY     ; 0
	const PARTY_TO_BOX     ; 1
	const DAYCARE_TO_PARTY ; 2
	const PARTY_TO_DAYCARE ; 3

; party menu types
; PartyMenuMessagePointers indexes (see engine/menus/party_menu.asm)
	const_def
	const NORMAL_PARTY_MENU    ; $00
	const USE_ITEM_PARTY_MENU  ; $01
	const BATTLE_PARTY_MENU    ; $02
	const TMHM_PARTY_MENU      ; $03
	const SWAP_MONS_PARTY_MENU ; $04
	const EVO_STONE_PARTY_MENU ; $05
; party menu message IDs
; PartyMenuItemUseMessagePointers indexes (see engine/menus/party_menu.asm)
	const_next $F0
DEF FIRST_PARTY_MENU_TEXT_ID EQU const_value
	const ANTIDOTE_MSG         ; $F0
	const BURN_HEAL_MSG        ; $F1
	const ICE_HEAL_MSG         ; $F2
	const AWAKENING_MSG        ; $F3
	const PARALYZ_HEAL_MSG     ; $F4
	const POTION_MSG           ; $F5
	const FULL_HEAL_MSG        ; $F6
	const REVIVE_MSG           ; $F7
	const RARE_CANDY_MSG       ; $F8

; naming screen types
	const_def
	const NAME_PLAYER_SCREEN ; 0
	const NAME_RIVAL_SCREEN  ; 1
	const NAME_MON_SCREEN    ; 2
	const NAME_SEED_SCREEN   ; 3
