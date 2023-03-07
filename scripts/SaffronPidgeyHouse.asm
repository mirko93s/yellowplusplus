SaffronPidgeyHouse_Script:
	jp EnableAutoTextBoxDrawing

SaffronPidgeyHouse_TextPointers:
	dw SaffronHouse1Text1
	dw SaffronHouse1Text2
	dw SaffronHouse1Text3
	dw SaffronHouse1Text4
	dw MoveDeleterText ; text 5
	dw MoveRelearnerText ; text 6

SaffronHouse1Text1:
	text_far _SaffronHouse1Text1
	text_end

SaffronHouse1Text2:
	text_far _SaffronHouse1Text2
	text_asm
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronHouse1Text3:
	text_far _SaffronHouse1Text3
	text_end

SaffronHouse1Text4:
	text_far _SaffronHouse1Text4
	text_end

MoveDeleterText:
	text_far MoveDeleterText1
	db "@"

MoveRelearnerText:
	text_far MoveRelearnerText1
	db "@"