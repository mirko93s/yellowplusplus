_AIBattleWithdrawText::
	text_ram wTrainerName
	text '@'
	text_ram wCurTrainerName
	text ""
	line "withdrew"
	cont '@'
	text_ram wEnemyMonNick
	text "!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text " @"
	text_ram wCurTrainerName
	text_start
	line "used @"
	text_ram wcd6d
	text_start
	cont "on @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_BoxFullDebugText::
	text "The Box is full!"
	done

_BoxWillBeClearedText::
	text "The Box will be"
	line "cleared."
	done

_TradeWentToText::
	text_ram wStringBuffer
	text " went"
	line "to @"
	text_ram wLinkEnemyTrainerName
	text '.'
	done

_TradeForText::
	text "For <PLAYER>'s"
	line '@'
	text_ram wStringBuffer
	text ","
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text " sends"
	line '@'
	text_ram wcd6d
	text '.'
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " waves"
	line "farewell as"
	done

_TradeTransferredText::
	text_ram wcd6d
	text " is"
	line "transferred."
	done

_TradeTakeCareText::
	text "Take good care of"
	line '@'
	text_ram wcd6d
	text '.'
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " will"
	line "trade @"
	text_ram wcd6d
	text_start
	done

_TradeforText::
	text "for <PLAYER>'s"
	line '@'
	text_ram wStringBuffer
	text '.'
	done

_PlaySlotMachineText::
	text "A slot machine!"
	line "Want to play?"
	done

_OutOfCoinsSlotMachineText::
	text "Darn!"
	line "Ran out of coins!"
	done

_BetHowManySlotMachineText::
	text "Bet how many"
	line "coins?"
	done

_StartSlotMachineText::
	text "Start!"
	done

_NotEnoughCoinsSlotMachineText::
	text "Not enough"
	line "coins!"
	prompt

_OneMoreGoSlotMachineText::
	text "One more "
	line "go?"
	done

_LinedUpText::
	text " lined up!"
	line "Scored @"
	text_ram wStringBuffer
	text " coins!"
	done

_NotThisTimeText::
	text "Not this time!"
	prompt

_YeahText::
	text "Yeah!@"
	text_end

_DexSeenOwnedText::
	text "#dex   Seen:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text_start
	line "         Owned:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text_end

_DexRatingText::
	text "#dex Rating:"
	done

_GymStatueText1::
	text_ram wGymCityName
	text_start
	line "#mon Gym"
	cont "Leader: @"
	text_ram wGymLeaderName
	text_start

	para "Winning Trainers:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text_ram wGymCityName
	text_start
	line "#mon Gym"
	cont "Leader: @"
	text_ram wGymLeaderName
	text_start

	para "Winning Trainers:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "#mon Centers"
	line "heal your tired,"
	cont "hurt or fainted"
	cont "#mon!"
	done

_PewterCityPokecenterGuyText::
	text "Yawn!"

	para "When Jigglypuff"
	line "sings, #mon"
	cont "get drowsy..."

	para "...Me too..."
	line "Snore..."
	done

_CeruleanPokecenterGuyText::
	text "Bill has lots of"
	line "#mon!"

	para "He collects rare"
	line "ones too!"
	done

_LavenderPokecenterGuyText::
	text "Cubones wear"
	line "skulls, right?"

	para "People will pay a"
	line "lot for one!"
	done

_MtMoonPokecenterBenchGuyText::
	text "If you have too"
	line "many #mon, you"
	cont "should store them"
	cont "via PC!"
	done

_RockTunnelPokecenterGuyText::
	text "I heard that"
	line "Ghosts haunt"
	cont "Lavender Town!"
	done

_UnusedBenchGuyText1::
	text "I wish I could"
	line "catch #mon."
	done

_UnusedBenchGuyText2::
	text "I'm tired from"
	line "all the fun..."
	done

_UnusedBenchGuyText3::
	text "Silph's manager"
	line "is hiding in the"
	cont "Safari Zone."
	done

_VermilionPokecenterGuyText::
	text "It is true that a"
	line "higher level"
	cont "#mon will be"
	cont "more powerful..."

	para "But, all #mon"
	line "will have weak"
	cont "points against"
	cont "specific types."

	para "So, there is no"
	line "universally"
	cont "strong #mon."
	done

_CeladonCityPokecenterGuyText::
	text "If I had a Bike,"
	line "I would go to"
	cont "Cycling Road!"
	done

_FuchsiaCityPokecenterGuyText::
	text "If you're studying "
	line "#mon, visit"
	cont "the Safari Zone."

	para "It has all sorts"
	line "of rare #mon."
	done

_CinnabarPokecenterGuyText::
	text "#mon can still"
	line "learn techniques"
	cont "after canceling"
	cont "evolution."

	para "Evolution can wait"
	line "until new moves"
	cont "have been learned."
	done

_SaffronCityPokecenterGuyText1::
	text "It would be great"
	line "if the Elite Four"
	cont "came and stomped"
	cont "Team Rocket!"
	done

_SaffronCityPokecenterGuyText2::
	text "Team Rocket took"
	line "off! We can go"
	cont "out safely again!"
	cont "That's great!"
	done

_CeladonCityHotelText::
	text "My sis brought me"
	line "on this vacation!"
	done

_BookcaseText::
	text "Crammed full of"
	line "#mon books!"
	done

_NewBicycleText::
	text "A shiny new"
	line "Bicycle!"
	done

_PushStartText::
	text "Push Start to"
	line "open the Menu!"
	done

_SaveOptionText::
	text "The Save option is"
	line "on the Menu"
	cont "screen."
	done

_StrengthsAndWeaknessesText::
	text "All #mon types"
	line "have strong and"
	cont "weak points"
	cont "against others."
	done

_TimesUpText::
	text "PA: Ding-dong!"

	para "Time's up!"
	prompt

_GameOverText::
	text "PA: Your Safari"
	line "Game is over!"
	done

_CinnabarGymQuizDummyIntroText::
	text "#mon Quiz!"

	para "Get it right and"
	line "the door opens to"
	cont "the next room!"

	para "Get it wrong and"
	line "face a trainer!"

	para "If you want to"
	line "conserve your"
	cont "#mon for the"
	cont "Gym Leader..."

	para "Then get it right!"
	line "Here we go!"
	prompt

_CinnabarGymQuizIntroText::
	text "#mon Quiz!"

	para "Get it right and"
	line "the door opens to"
	cont "the next room!"

	para "Get it wrong and"
	line "face the trainer"
	cont "blocking the way!"

	para "If you want to"
	line "conserve your"
	cont "#mon for the"
	cont "Gym Leader..."

	para "Then get it right!"
	line "Here we go!"
	para ""
	done

_CinnabarGymQuizShortIntroText::
	text "#mon Quiz!"

	line "Test your skill!"
	para ""
	done

_CinnabarQuizQuestionsText1::
	text "Caterpie evolves"
	line "into Butterfree?"
	done

_CinnabarQuizQuestionsText2::
	text "There are 9"
	line "certified #mon"
	cont "League Badges?"
	done

_CinnabarQuizQuestionsText3::
	text "Poliwag evolves 3"
	line "times?"
	done

_CinnabarQuizQuestionsText4::
	text "Are thunder moves"
	line "effective against"
	cont "ground element-"
	cont "type #mon?"
	done

_CinnabarQuizQuestionsText5::
	text "#mon of the"
	line "same kind and"
	cont "level are not"
	cont "identical?"
	done

_CinnabarQuizQuestionsText6::
	text "TM28 contains"
	line "Tombstoner?"
	done

_CinnabarGymQuizCorrectText::
	text "You're absolutely"
	line "correct!"

	para "Go on through!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "Sorry! Bad call!"
	prompt

_MagazinesText::
	text "#mon magazines!"

	para "#mon notebooks!"

	para "#mon graphs!"
	done

_BillsHouseMonitorText::
	text "Teleporter is"
	line "displayed on the"
	cont "PC monitor."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> initiated"
	line "Teleporter's Cell"
	cont "Separator!@"
	text_end

_BillsHousePokemonListText1::
	text "Bill's favorite"
	line "#mon list!"
	prompt

_BillsHousePokemonListText2::
	text "Which #mon do"
	line "you want to see?"
	done

_OakLabEmailText::
	text "There's an e-mail"
	line "message here!"

	para "..."

	para "Calling all"
	line "#mon trainers!"

	para "The elite trainers"
	line "of #mon League"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#mon and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#mon League HQ"
	line "Indigo Plateau"

	para "PS: Prof. Oak,"
	line "please visit us!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "A Coin Case is"
	line "required!"
	done

_GameCornerNoCoinsText::
	text "You don't have"
	line "any coins!"
	done

_GameCornerOutOfOrderText::
	text "Out Of Order"
	line "This is broken."
	done

_GameCornerOutToLunchText::
	text "Out To Lunch"
	line "This is reserved."
	done

_GameCornerSomeonesKeysText::
	text "Someone's keys!"
	line "They'll be back."
	done

_JustAMomentText::
	text "Just a moment."
	done

TMNotebookText::
	text "It's a pamphlet"
	line "on TMs."

	para "..."

	para "There are 50 TMs"
	line "in all."

	para "There are also 5"
	line "HMs that can be"
	cont "used repeatedly."

	para "Silph Co.@"
	text_end

_TurnPageText::
	text "Turn the page?"
	done

_ViridianSchoolNotebookText5::
	text "Girl: Hey! Don't"
	line "look at my notes!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Looked at the"
	line "notebook!"

	para "First page..."

	para "# Balls are"
	line "used to catch"
	cont "#mon."

	para "Up to 6 #mon"
	line "can be carried."

	para "People who raise"
	line "and make #mon"
	cont "fight are called"
	cont "#mon trainers."
	prompt

_ViridianSchoolNotebookText2::
	text "Second page..."

	para "A healthy #mon"
	line "may be hard to"
	cont "catch, so weaken"
	cont "it first!"

	para "Poison, burns and"
	line "other damage are"
	cont "effective!"
	prompt

_ViridianSchoolNotebookText3::
	text "Third page..."

	para "#mon trainers"
	line "seek others to"
	cont "engage in #mon"
	cont "fights."

	para "Battles are"
	line "constantly fought"
	cont "at #mon Gyms."
	prompt

_ViridianSchoolNotebookText4::
	text "Fourth page..."

	para "The goal for"
	line "#mon trainers"
	cont "is to beat the "
	cont "top 8 #mon"
	cont "Gym Leaders."

	para "Do so to earn the"
	line "right to face..."

	para "The Elite Four of"
	line "#mon League!"
	prompt

_EnemiesOnEverySideText::
	text "Enemies on every"
	line "side!"
	done

_WhatGoesAroundComesAroundText::
	text "What goes around"
	line "comes around!"
	done

_FightingDojoText::
	text "Fighting Dojo"
	done

_IndigoPlateauHQText::
	text "Indigo Plateau"
	line "#mon League HQ"
	done

_RedBedroomSNESText::
	text "<PLAYER> is"
	line "playing the SNES!"
	cont "...Okay!"
	cont "It's time to go!"
	done

_Route15UpstairsBinocularsText::
	text "Looked into the"
	line "binoculars..."

	para "A large, shining"
	line "bird is flying"
	cont "toward the sea."
	done

_AerodactylFossilText::
	text "Aerodactyl Fossil"
	line "A primitive and"
	cont "rare #mon."
	done

_KabutopsFossilText::
	text "Kabutops Fossil"
	line "A primitive and"
	cont "rare #mon."
	done

_FanClubPicture1Text::
	text "My cute Rapidash."
	done

_FanClubPicture2Text::
	text "My beloved Fearow."
	done

_LinkCableHelpText1::
	text "Trainer Tips"

	para "Using a Game Link"
	line "Cable"
	prompt

_LinkCableHelpText2::
	text "Which heading do"
	line "you want to read?"
	done

_LinkCableInfoText1::
	text "When you have"
	line "linked your Game"
	cont "Boy with another"
	cont "Game Boy, talk to"
	cont "the attendant on"
	cont "the right in any"
	cont "#mon Center."
	prompt

_LinkCableInfoText2::
	text "Colosseum lets"
	line "you play against"
	cont "a friend."
	prompt

_LinkCableInfoText3::
	text "Trade Center is"
	line "used for trading"
	cont "#mon."
	prompt

_ViridianSchoolBlackboardText1::
	text "The blackboard"
	line "describes #mon"
	cont "Status changes"
	cont "during battles."
	prompt

_ViridianSchoolBlackboardText2::
	text "Which heading do"
	line "you want to read?"
	done

_ViridianBlackboardSleepText::
	text "A #mon can't"
	line "attack if it's"
	cont "asleep!"

	para "#mon will stay"
	line "asleep even after"
	cont "battles."

	para "Use Awakening to"
	line "wake them up!"
	prompt

_ViridianBlackboardPoisonText::
	text "When poisoned, a"
	line "#mon's health"
	cont "steadily drops."

	para "Poison lingers"
	line "after battles."

	para "Use an Antidote"
	line "to cure poison!"
	prompt

_ViridianBlackboardPrlzText::
	text "Paralysis could"
	line "make #mon"
	cont "moves misfire!"

	para "Paralysis remains"
	line "after battles."

	para "Use Parlyz Heal"
	line "for treatment!"
	prompt

_ViridianBlackboardBurnText::
	text "A burn reduces"
	line "power and speed."
	cont "It also causes"
	cont "ongoing damage."

	para "Burns remain"
	line "after battles."

	para "Use Burn Heal to"
	line "cure a burn!"
	prompt

_ViridianBlackboardFrozenText::
	text "If frozen, a"
	line "#mon becomes"
	cont "totally immobile!"

	para "It stays frozen"
	line "even after the"
	cont "battle ends."

	para "Use Ice Heal to"
	line "thaw out #mon!"
	prompt

_VermilionGymTrashText::
	text "Nope, there's"
	line "only trash here."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! There's a"
	line "switch under the"
	cont "trash!"
	cont "Turn it on!"

	para "The 1st electric"
	line "lock opened!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hey! There's"
	line "another switch"
	cont "under the trash!"
	cont "Turn it on!"
	prompt

_VermilionGymTrashSuccessText3::
	text "The 2nd electric"
	line "lock opened!"

	para "The motorized door"
	line "opened!@"
	text_end

_VermilionGymTrashFailText::
	text "Nope! There's"
	line "only trash here."
	cont "Hey! The electric"
	cont "locks were reset!@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> found"
	line '@'
	text_ram wcd6d
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "But, <PLAYER> has"
	line "no more room for"
	cont "other items!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> found"
	line '@'
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> found"
	line '@'
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "Oops! Dropped"
	line "some coins!"
	done

_IndigoPlateauStatuesText1::
	text "Indigo Plateau"
	prompt

_IndigoPlateauStatuesText2::
	text "The ultimate goal"
	line "of trainers!"
	cont "#mon League HQ"
	done

_IndigoPlateauStatuesText3::
	text "The highest"
	line "#mon authority"
	cont "#mon League HQ"
	done

_PokemonBooksText::
	text "Crammed full of"
	line "#mon books!"
	done

_DiglettSculptureText::
	text "It's a sculpture"
	line "of Diglett."
	done

_ElevatorText::
	text "This is an"
	line "elevator."
	done

_TownMapText::
	text "A Town Map.@"
	text_end

_PokemonStuffText::
	text "Wow! Tons of"
	line "#mon stuff!"
	done

_OutOfSafariBallsText::
	text "PA: Ding-dong!"

	para "You are out of"
	line "Safari Balls!"
	prompt

_WildRanText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "ran!"
	prompt

_EnemyRanText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "ran!"
	prompt

_HurtByPoisonText::
	text "<USER>'s"
	line "hurt by poison!"
	prompt

_HurtByBurnText::
	text "<USER>'s"
	line "hurt by the burn!"
	prompt

_HurtByLeechSeedText::
	text "Leech Seed saps"
	line "<USER>!"
	prompt

_EnemyMonFaintedText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "fainted!"
	prompt

_MoneyForWinningText::
	text "<PLAYER> got ¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "for winning!"
	prompt

_TrainerDefeatedText::
	text_ram wTrainerName
	text " @"
	text_ram wCurTrainerName
	text ""
	line "was defeated!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "fainted!"
	prompt

_UseNextMonText::
	text "Use next #mon?"
	done

_Rival1WinText::
	text "<RIVAL>: Yeah! Am"
	line "I great or what?"
	prompt

_PlayerBlackedOutText2::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> blacked"
	line "out!"
	prompt

_LinkBattleLostText::
	text "<PLAYER> lost to"
	line '@'
	text_ram wTrainerName
	text "!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text " @"
	text_ram wCurTrainerName
	text ""
	line "is about to use"
	cont '@'
	text_ram wEnemyMonNick
	text "!"

	para "Will <PLAYER>"
	line "change #mon?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text " @"
	text_ram wCurTrainerName
	text ""
	line "sent out"
	cont '@'
	text_ram wEnemyMonNick
	text "!"
	done

_NoWillText::
	text "There's no will"
	line "to fight!"
	prompt

_CantEscapeText::
	text "Can't escape!"
	prompt

_NoRunningText::
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

_GotAwayText::
	text "Got away safely!"
	prompt

_RunAwayText::
	text "Hurry, get away!"
	prompt

_ItemsCantBeUsedHereText::
	text "Items can't be"
	line "used here."
	prompt

_ItemsCantBeUsedInHardModeText::
	text "Items can't be"
	line "used in hard mode"
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text " is"
	line "already out!"
	prompt

_MoveNoPPText::
	text "No PP left for"
	line "this move!"
	prompt

_MoveDisabledText::
	text "The move is"
	line "disabled!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " has no"
	line "moves left!"
	done

_MultiHitText::
	text "Hit the enemy"
	line '@'
	text_decimal wPlayerNumHits,1,1
	text " times!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " is too"
	line "scared to move!"
	prompt

_GetOutText::
	text "GHOST: Get out..."
	line "Get out..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "is fast asleep!"
	prompt

_WokeUpText::
	text "<USER>"
	line "woke up!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "is frozen solid!"
	prompt

_FullyParalyzedText::
	text "<USER>'s"
	line "fully paralyzed!"
	prompt

_FlinchedText::
	text "<USER>"
	line "flinched!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "must recharge!"
	prompt

_DisabledNoMoreText::
	text "<USER>'s"
	line "disabled no more!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "is confused!"
	prompt

_HurtItselfText::
	text "It hurt itself in"
	line "its confusion!"
	prompt

_ConfusedNoMoreText::
	text "<USER>'s"
	line "confused no more!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "is saving energy!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "unleashed energy!"
	prompt

_ThrashingAboutText::
	text "<USER>'s"
	line "thrashing about!"
	done

_AttackContinuesText::
	text "<USER>'s"
	line "attack continues!"
	done

_CantMoveText::
	text "<USER>"
	line "can't move!"
	prompt

_MoveIsDisabledText::
	text "<USER>'s"
	line '@'
	text_ram wcd6d
	text " is"
	cont "disabled!"
	prompt

_MonName1Text::
	text "<USER>@"
	text_end

_Used1Text::
	text_start
	line "used @"
	text_end

_Used2Text::
	text_start
	line "used @"
	text_end

_InsteadText::
	text "instead,"
	cont '@'
	text_end

_MoveNameText::
	text_ram wStringBuffer
	text '@'

_ExclamationPoint1Text::
	text "!"
	done

_ExclamationPoint2Text::
	text "!"
	done

_ExclamationPoint3Text::
	text "!"
	done

_ExclamationPoint4Text::
	text "!"
	done

_ExclamationPoint5Text::
	text "!"
	done

_AttackMissedText::
	text "<USER>'s"
	line "attack missed!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt

_UnaffectedText::
	text "<TARGET>'s"
	line "unaffected!"
	prompt

_DoesntAffectMonText::
	text "It doesn't affect"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Critical hit!"
	prompt

_OHKOText::
	text "One-hit KO!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text " is"
	line "loafing around."
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text " began"
	line "to nap!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text " won't"
	line "obey!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text " turned"
	line "away!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "ignored orders!"
	prompt

_SubstituteTookDamageText::
	text "The Substitute"
	line "took damage for"
	cont "<TARGET>!"
	prompt

_SubstituteBrokeText::
	text "<TARGET>'s"
	line "Substitute broke!"
	prompt

_BuildingRageText::
	text "<USER>'s"
	line "Rage is building!"
	prompt

_MirrorMoveFailedText::
	text "The Mirror Move"
	next "failed!"
	prompt

_HitXTimesText::
	text "Hit @"
	text_decimal wEnemyNumHits, 1, 1
	text " times!"
	prompt

_GainedText::
	text_ram wcd6d
	text " gained"
	line '@'
	text_end

_WithExpAllText::
	text "with Exp. All,"
	cont '@'
	text_end

_BoostedText::
	text "a boosted"
	cont '@'
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " Exp. Points!"
	prompt

_GrewLevelText::
	text_ram wcd6d
	text " grew"
	line "to level @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_SuperEffectiveText::
	text "It's super"
	line "effective!"
	prompt

_NotVeryEffectiveText::
	text "It's not very"
	line "effective..."
	prompt

_SafariZoneEatingText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is eating!"
	prompt

_SafariZoneAngryText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is angry!"
	prompt

_WildMonAppearedText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

_HookedMonAttackedText::
	text "The hooked"
	line '@'
	text_ram wEnemyMonNick
	text_start
	cont "attacked!"
	prompt

_BoyGirlText::
    text "Play as a boy"
    line "or as a girl?"
    done

_MirkoIntroText::
	text "Hackrom created"
	line "by mirko93s :)"
	para "Enjoy your"
	line "adventure!"
	prompt
	
_MirkoIntroText2::
	text "That definitely"
	line "wasn't a bug!"
	para "It's a feature."
	line ".-."
	prompt

_NuzlockeDupeClauseText::
	text "Do you want to use"
	line "the optional"
	para "dupe clause for"
	line "Nuzlocke mode?"
	prompt

_SeedRandomizerText::
	text "Do you want to"
	line "enter a seed to"
	cont "randomize wild"
	cont "Pokemon?"

	para "Same seed, same"
	line "results, always."

	para "Great for Soul"
	line "Link Nuzlockes:"
	cont "same Pokemon in"
	cont "the same areas"
	cont "for all players."
	prompt

_WildMonCatchableText::
	text '@'
	text_ram wEnemyMonNick
	text_start
	line "is catchable!"
	prompt

_NuzlockeNoPrizeText::
	text "Sorry, prizes are" 
	line "unavailable.@"
	text_end
