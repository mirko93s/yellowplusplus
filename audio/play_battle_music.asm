PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	call StopAllMusic
	call DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	jr c, .wildBattle
	cp OPP_LORELEI
	jr z, .elite4Battle
	cp OPP_BRUNO
	jr z, .elite4Battle
	cp OPP_AGATHA
	jr z, .elite4Battle
	cp OPP_LANCE
	jr z, .elite4Battle
	cp OPP_RIVAL3
	jr nz, .normalTrainerBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.elite4Battle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.normalTrainerBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic
