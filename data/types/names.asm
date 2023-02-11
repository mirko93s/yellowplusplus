TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
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

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@" ; unused only appears with some missingnos
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Dragon:   db "DRAGON@"

TypeNamesShort:
	table_width 2, TypeNamesShort

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
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
.Bird:     db "Bird@" ; unused only appears with some missingnos
.Bug:      db "Bug@"
.Ghost:    db "Ghst@"
.Dragon:   db "Drgn@"
