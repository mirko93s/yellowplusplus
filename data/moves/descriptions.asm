; Gen 1 move descriptions from pret/pokecrystal, data/moves/descriptions.asm.
; https://github.com/pret/pokecrystal/blob/master/data/moves/descriptions.asm
MoveDescriptions:
	table_width 2, MoveDescriptions
	dw PoundDescription
	dw KarateChopDescription
	dw DoubleslapDescription
	dw CometPunchDescription
	dw MegaPunchDescription
	dw PayDayDescription
	dw FirePunchDescription
	dw IcePunchDescription
	dw ThunderpunchDescription
	dw ScratchDescription
	dw VicegripDescription
	dw GuillotineDescription
	dw RazorWindDescription
	dw SwordsDanceDescription
	dw CutDescription
	dw GustDescription
	dw WingAttackDescription
	dw WhirlwindDescription
	dw FlyDescription
	dw BindDescription
	dw SlamDescription
	dw VineWhipDescription
	dw StompDescription
	dw DoubleKickDescription
	dw MegaKickDescription
	dw JumpKickDescription
	dw RollingKickDescription
	dw SandAttackDescription
	dw HeadbuttDescription
	dw HornAttackDescription
	dw FuryAttackDescription
	dw HornDrillDescription
	dw TackleDescription
	dw BodySlamDescription
	dw WrapDescription
	dw TakeDownDescription
	dw ThrashDescription
	dw DoubleEdgeDescription
	dw TailWhipDescription
	dw PoisonStingDescription
	dw TwineedleDescription
	dw PinMissileDescription
	dw LeerDescription
	dw BiteDescription
	dw GrowlDescription
	dw RoarDescription
	dw SingDescription
	dw SupersonicDescription
	dw SonicboomDescription
	dw DisableDescription
	dw AcidDescription
	dw EmberDescription
	dw FlamethrowerDescription
	dw MistDescription
	dw WaterGunDescription
	dw HydroPumpDescription
	dw SurfDescription
	dw IceBeamDescription
	dw BlizzardDescription
	dw PsybeamDescription
	dw BubblebeamDescription
	dw AuroraBeamDescription
	dw HyperBeamDescription
	dw PeckDescription
	dw DrillPeckDescription
	dw SubmissionDescription
	dw LowKickDescription
	dw CounterDescription
	dw SeismicTossDescription
	dw StrengthDescription
	dw AbsorbDescription
	dw MegaDrainDescription
	dw LeechSeedDescription
	dw GrowthDescription
	dw RazorLeafDescription
	dw SolarbeamDescription
	dw PoisonpowderDescription
	dw StunSporeDescription
	dw SleepPowderDescription
	dw PetalDanceDescription
	dw StringShotDescription
	dw DragonRageDescription
	dw FireSpinDescription
	dw ThundershockDescription
	dw ThunderboltDescription
	dw ThunderWaveDescription
	dw ThunderDescription
	dw RockThrowDescription
	dw EarthquakeDescription
	dw FissureDescription
	dw DigDescription
	dw ToxicDescription
	dw ConfusionDescription
	dw PsychicMDescription
	dw HypnosisDescription
	dw MeditateDescription
	dw AgilityDescription
	dw QuickAttackDescription
	dw RageDescription
	dw TeleportDescription
	dw NightShadeDescription
	dw MimicDescription
	dw ScreechDescription
	dw DoubleTeamDescription
	dw RecoverDescription
	dw HardenDescription
	dw MinimizeDescription
	dw SmokescreenDescription
	dw ConfuseRayDescription
	dw WithdrawDescription
	dw DefenseCurlDescription
	dw BarrierDescription
	dw LightScreenDescription
	dw HazeDescription
	dw ReflectDescription
	dw FocusEnergyDescription
	dw BideDescription
	dw MetronomeDescription
	dw MirrorMoveDescription
	dw SelfdestructDescription
	dw EggBombDescription
	dw LickDescription
	dw SmogDescription
	dw SludgeDescription
	dw BoneClubDescription
	dw FireBlastDescription
	dw WaterfallDescription
	dw ClampDescription
	dw SwiftDescription
	dw SkullBashDescription
	dw SpikeCannonDescription
	dw ConstrictDescription
	dw AmnesiaDescription
	dw KinesisDescription
	dw SoftboiledDescription
	dw HiJumpKickDescription
	dw GlareDescription
	dw DreamEaterDescription
	dw PoisonGasDescription
	dw BarrageDescription
	dw LeechLifeDescription
	dw LovelyKissDescription
	dw SkyAttackDescription
	dw TransformDescription
	dw BubbleDescription
	dw DizzyPunchDescription
	dw SporeDescription
	dw FlashDescription
	dw PsywaveDescription
	dw SplashDescription
	dw AcidArmorDescription
	dw CrabhammerDescription
	dw ExplosionDescription
	dw FurySwipesDescription
	dw BonemerangDescription
	dw RestDescription
	dw RockSlideDescription
	dw HyperFangDescription
	dw SharpenDescription
	dw ConversionDescription
	dw TriAttackDescription
	dw SuperFangDescription
	dw SlashDescription
	dw SubstituteDescription
	dw StruggleDescription
	assert_table_length NUM_ATTACKS

PoundDescription:
	db   "Pounds with fore-"
	next "legs or tail.@"

KarateChopDescription:
	db   "Has a high criti-"
	next "cal hit ratio.@"

DoubleslapDescription:
	db   "Repeatedly slaps"
	next "2-5 times.@"

CometPunchDescription:
	db   "Repeatedly punches"
	next "2-5 times.@"

MegaPunchDescription:
	db   "A powerful punch"
	next "thrown very hard.@"
PayDayDescription:
	db   "Throws coins. Gets"
	next "them back later.@"

FirePunchDescription:
	db   "A fiery punch. May"
	next "cause a burn.@"

IcePunchDescription:
	db   "An icy punch. May"
	next "cause freezing.@"

ThunderpunchDescription:
	db   "An electric punch."
	next "It may paralyze.@"

ScratchDescription:
	db   "Scratches with"
	next "sharp claws.@"

VicegripDescription:
	db   "Grips with power-"
	next "ful pincers.@"

GuillotineDescription:
	db   "A one-hit KO,"
	next "pincer attack.@"
RazorWindDescription:
	db   "1st turn: Prepare"
	next "2nd turn: Attack@"

SwordsDanceDescription:
	db   "A dance that in-"
	next "creases ATTACK.@"

CutDescription:
	db   "Cuts using claws,"
	next "scythes, etc.@"

GustDescription:
	db   "Whips up a strong"
	next "gust of wind.@"

WingAttackDescription:
	db   "Strikes the target"
	next "with wings.@"

WhirlwindDescription:
	db   "Blows away the foe"
	next "and ends battle.@"

FlyDescription:
	db   "1st turn: Fly"
	next "2nd turn: Attack@"
BindDescription:
	db   "Binds the target"
	next "for 2-5 turns.@"

SlamDescription:
	db   "Slams the foe with"
	next "a tail, vine, etc.@"

VineWhipDescription:
	db   "Whips the foe with"
	next "slender vines.@"

StompDescription:
	db   "An attack that may"
	next "cause flinching.@"

DoubleKickDescription:
	db   "A double kicking"
	next "attack.@"

MegaKickDescription:
	db   "A powerful kicking"
	next "attack.@"

JumpKickDescription:
	db   "May miss, damaging"
	next "the user.@"
RollingKickDescription:
	db   "A fast, spinning"
	next "kick.@"

SandAttackDescription:
	db   "Reduces accuracy"
	next "by throwing sand.@"

HeadbuttDescription:
	db   "An attack that may"
	next "make foe flinch.@"

HornAttackDescription:
	db   "An attack using a"
	next "horn to jab.@"

FuryAttackDescription:
	db   "Jabs the target"
	next "2-5 times.@"

HornDrillDescription:
	db   "A one-hit KO,"
	next "drill attack.@"

TackleDescription:
	db   "A full-body charge"
	next "attack.@"
BodySlamDescription:
	db   "An attack that may"
	next "cause paralysis.@"

WrapDescription:
	db   "Squeezes the foe"
	next "for 2-5 turns.@"

TakeDownDescription:
	db   "A tackle that also"
	next "hurts the user.@"

ThrashDescription:
	db   "Works 2-3 turns"
	next "and confuses user.@"

DoubleEdgeDescription:
	db   "A tackle that also"
	next "hurts the user.@"

TailWhipDescription:
	db   "Lowers the foe's"
	next "DEFENSE.@"

PoisonStingDescription:
	db   "An attack that may"
	next "poison the target.@"
TwineedleDescription:
	db   "Jabs the foe twice"
	next "using stingers.@"

PinMissileDescription:
	db   "Fires pins that"
	next "strike 2-5 times.@"

LeerDescription:
	db   "Reduces the foe's"
	next "DEFENSE.@"

BiteDescription:
	db   "An attack that may"
	next "cause flinching.@"

GrowlDescription:
	db   "Reduces the foe's"
	next "ATTACK.@"

RoarDescription:
	db   "Scares wild foes"
	next "to end battle.@"

SingDescription:
	db   "May cause the foe"
	next "to fall asleep.@"
SupersonicDescription:
	db   "Sound waves that"
	next "cause confusion.@"

SonicboomDescription:
	db   "Always inflicts"
	next "20HP damage.@"

DisableDescription:
	db   "Disables the foe's"
	next "most recent move.@"

AcidDescription:
	db   "An attack that may"
	next "lower DEFENSE.@"

EmberDescription:
	db   "An attack that may"
	next "inflict a burn.@"

FlamethrowerDescription:
	db   "An attack that may"
	next "inflict a burn.@"

MistDescription:
	db   "Prevents stat"
	next "reduction.@"
WaterGunDescription:
	db   "Squirts water to"
	next "attack.@"

HydroPumpDescription:
	db   "A powerful water-"
	next "type attack.@"

SurfDescription:
	db   "A strong water-"
	next "type attack.@"

IceBeamDescription:
	db   "An attack that may"
	next "freeze the foe.@"

BlizzardDescription:
	db   "An attack that may"
	next "freeze the foe.@"

PsybeamDescription:
	db   "An attack that may"
	next "confuse the foe.@"

BubblebeamDescription:
	db   "An attack that may"
	next "lower SPEED.@"
AuroraBeamDescription:
	db   "An attack that may"
	next "lower ATTACK.@"

HyperBeamDescription:
	db   "1st turn: Attack"
	next "2nd turn: Rest@"

PeckDescription:
	db   "Jabs the foe with"
	next "a beak, etc.@"

DrillPeckDescription:
	db   "A strong, spin-"
	next "ning-peck attack.@"

SubmissionDescription:
	db   "An attack that al-"
	next "so hurts the user.@"

LowKickDescription:
	db   "An attack that may"
	next "cause flinching.@"

CounterDescription:
	db   "Returns a physical"
	next "blow double.@"
SeismicTossDescription:
	db   "The user's level"
	next "equals damage HP.@"

StrengthDescription:
	db   "A powerful physi-"
	next "cal attack.@"

AbsorbDescription:
	db   "Steals 1/2 of the"
	next "damage inflicted.@"

MegaDrainDescription:
	db   "Steals 1/2 of the"
	next "damage inflicted.@"

LeechSeedDescription:
	db   "Steals HP from the"
	next "foe on every turn.@"

GrowthDescription:
	db   "Raises the SPCL."
	next "ATK rating.@"

RazorLeafDescription:
	db   "Has a high criti-"
	next "cal hit ratio.@"
SolarbeamDescription:
	db   "1st turn: Prepare"
	next "2nd turn: Attack@"

PoisonpowderDescription:
	db   "A move that may"
	next "poison the foe.@"

StunSporeDescription:
	db   "A move that may"
	next "paralyze the foe.@"

SleepPowderDescription:
	db   "May cause the foe"
	next "to fall asleep.@"

PetalDanceDescription:
	db   "Works 2-3 turns"
	next "and confuses user.@"

StringShotDescription:
	db   "A move that lowers"
	next "the foe's SPEED.@"
DragonRageDescription:
	db   "Always inflicts"
	next "40HP damage.@"

FireSpinDescription:
	db   "Traps foe in fire"
	next "for 2-5 turns.@"

ThundershockDescription:
	db   "An attack that may"
	next "cause paralysis.@"

ThunderboltDescription:
	db   "An attack that may"
	next "cause paralysis.@"

ThunderWaveDescription:
	db   "A move that may"
	next "cause paralysis.@"

ThunderDescription:
	db   "An attack that may"
	next "cause paralysis.@"
RockThrowDescription:
	db   "Drops rocks on the"
	next "enemy.@"

EarthquakeDescription:
	db   "Tough but useless"
	next "vs. flying foes.@"

FissureDescription:
	db   "A ground-type,"
	next "one-hit KO attack.@"

DigDescription:
	db   "1st turn: Burrow"
	next "2nd turn: Attack@"

ToxicDescription:
	db   "A poison move with"
	next "increasing damage.@"

ConfusionDescription:
	db   "An attack that may"
	next "cause confusion.@"

PsychicMDescription:
	db   "An attack that may"
	next "lower SPCL.DEF.@"
HypnosisDescription:
	db   "May put the foe to"
	next "sleep.@"

MeditateDescription:
	db   "Raises the user's"
	next "ATTACK.@"

AgilityDescription:
	db   "Sharply increases"
	next "the user's SPEED.@"

QuickAttackDescription:
	db   "Lets the user get"
	next "in the first hit.@"

RageDescription:
	db   "Raises ATTACK if"
	next "the user is hit.@"

TeleportDescription:
	db   "A move for fleeing"
	next "from battle.@"

NightShadeDescription:
	db   "The user's level"
	next "equals damage HP.@"
MimicDescription:
	db   "Copies a move used"
	next "by the foe.@"

ScreechDescription:
	db   "Sharply reduces"
	next "the foe's DEFENSE.@"

DoubleTeamDescription:
	db   "Heightens evasive-"
	next "ness.@"

RecoverDescription:
	db   "Restores HP by 1/2"
	next "the max HP.@"

HardenDescription:
	db   "Raises the user's"
	next "DEFENSE.@"

MinimizeDescription:
	db   "Heightens evasive-"
	next "ness.@"

SmokescreenDescription:
	db   "Lowers the foe's"
	next "accuracy.@"
ConfuseRayDescription:
	db   "A move that causes"
	next "confusion.@"

WithdrawDescription:
	db   "Heightens the"
	next "user's DEFENSE.@"

DefenseCurlDescription:
	db   "Heightens the"
	next "user's DEFENSE.@"

BarrierDescription:
	db   "Sharply increases"
	next "user's DEFENSE.@"

LightScreenDescription:
	db   "Ups SPCL.DEF with"
	next "a wall of light.@"

HazeDescription:
	db   "Eliminates all"
	next "stat changes.@"

ReflectDescription:
	db   "Raises DEFENSE"
	next "with a barrier.@"
FocusEnergyDescription:
	db   "Raises the criti-"
	next "cal hit ratio.@"

BideDescription:
	db   "Waits 2-3 turns,"
	next "hits back double.@"

MetronomeDescription:
	db   "Randomly uses any"
	next "POKéMON move.@"

MirrorMoveDescription:
	db   "Counters with the"
	next "same move.@"

SelfdestructDescription:
	db   "Powerful but makes"
	next "the user faint.@"

EggBombDescription:
	db   "Eggs are hurled at"
	next "the foe.@"

LickDescription:
	db   "An attack that may"
	next "cause paralysis.@"
SmogDescription:
	db   "An attack that may"
	next "poison the foe.@"

SludgeDescription:
	db   "An attack that may"
	next "poison the foe.@"

BoneClubDescription:
	db   "An attack that may"
	next "cause flinching.@"

FireBlastDescription:
	db   "An attack that"
	next "may cause a burn.@"

WaterfallDescription:
	db   "An aquatic charge"
	next "attack.@"

ClampDescription:
	db   "Traps the foe for"
	next "2-5 turns.@"

SwiftDescription:
	db   "An attack that"
	next "never misses.@"
SkullBashDescription:
	db   "1st turn: Prepare"
	next "2nd turn: Attack@"

SpikeCannonDescription:
	db   "Fires spikes to"
	next "hit 2-5 times.@"

ConstrictDescription:
	db   "An attack that may"
	next "lower SPEED.@"

AmnesiaDescription:
	db   "Sharply raises the"
	next "user's SPCL.DEF.@"

KinesisDescription:
	db   "Reduces the foe's"
	next "accuracy.@"

SoftboiledDescription:
	db   "Restores HP by 1/2"
	next "the user's max HP.@"

HiJumpKickDescription:
	db   "May miss and hurt"
	next "the user.@"
GlareDescription:
	db   "A move that may"
	next "cause paralysis.@"

DreamEaterDescription:
	db   "Steals HP from a"
	next "sleeping victim.@"

PoisonGasDescription:
	db   "A move that may"
	next "poison the foe.@"

BarrageDescription:
	db   "Throws orbs to hit"
	next "2-5 times.@"

LeechLifeDescription:
	db   "Steals 1/2 of the"
	next "damage inflicted.@"

LovelyKissDescription:
	db   "May cause the foe"
	next "to fall asleep.@"

SkyAttackDescription:
	db   "1st turn: Prepare"
	next "2nd turn: Attack@"
TransformDescription:
	db   "The user assumes"
	next "the foe's guise.@"

BubbleDescription:
	db   "An attack that may"
	next "reduce SPEED.@"

DizzyPunchDescription:
	db   "An attack that may"
	next "cause confusion.@"

SporeDescription:
	db   "A move that"
	next "induces sleep.@"

FlashDescription:
	db   "Blinds the foe to"
	next "reduce accuracy.@"

PsywaveDescription:
	db   "An attack with"
	next "variable power.@"

SplashDescription:
	db   "Has no effect"
	next "whatsoever.@"
AcidArmorDescription:
	db   "Sharply raises the"
	next "user's DEFENSE.@"

CrabhammerDescription:
	db   "Has a high criti-"
	next "cal hit ratio.@"

ExplosionDescription:
	db   "Very powerful but"
	next "makes user faint.@"

FurySwipesDescription:
	db   "Quickly scratches"
	next "2-5 times.@"

BonemerangDescription:
	db   "An attack that"
	next "strikes twice.@"

RestDescription:
	db   "Sleep for 2 turns"
	next "to fully recover.@"
RockSlideDescription:
	db   "An attack that may"
	next "cause flinching.@"

HyperFangDescription:
	db   "An attack that may"
	next "cause flinching.@"

SharpenDescription:
	db   "A move that raises"
	next "the user's ATTACK.@"

ConversionDescription:
	db   "Change user's type"
	next "to a move's type.@"

TriAttackDescription:
	db   "Fires three kinds"
	next "of beams at once.@"

SuperFangDescription:
	db   "Cuts the foe's HP"
	next "by 1/2.@"
SlashDescription:
	db   "Has a high criti-"
	next "cal hit ratio.@"

SubstituteDescription:
	db   "Makes a decoy with"
	next "1/4 user's max HP.@"

StruggleDescription:
	db   "Used only if all"
	next "PP are exhausted.@"
