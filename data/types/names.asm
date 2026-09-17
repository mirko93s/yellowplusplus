TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Typeless
	dw .Bug
	dw .Ghost

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	assert_table_length NUM_TYPES

.Normal:   db "Normal@"
.Fighting: db "Fighting@"
.Flying:   db "Flying@"
.Poison:   db "Poison@"
.Fire:     db "Fire@"
.Water:    db "Water@"
.Grass:    db "Grass@"
.Electric: db "Electric@"
.Psychic:  db "Psychic@"
.Ice:      db "Ice@"
.Ground:   db "Ground@"
.Rock:     db "Rock@"
.Typeless: db "???@" ; used for struggle so it is typeless
.Bug:      db "Bug@"
.Ghost:    db "Ghost@"
.Dragon:   db "Dragon@"

TypeNamesShort:
	table_width 2, TypeNamesShort

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Typeless
	dw .Bug
	dw .Ghost

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	assert_table_length NUM_TYPES

.Normal:   db "Norm@"
.Fighting: db "Fght@"
.Flying:   db "Flyn@"
.Poison:   db "Psn@"
.Fire:     db "Fire@"
.Water:    db "Watr@"
.Grass:    db "Grss@"
.Electric: db "Elec@"
.Psychic:  db "Psyc@"
.Ice:      db "Ice@"
.Ground:   db "Grnd@"
.Rock:     db "Rock@"
.Typeless: db "????@" ; used for struggle so it is typeless
.Bug:      db "Bug@"
.Ghost:    db "Ghst@"
.Dragon:   db "Drgn@"
