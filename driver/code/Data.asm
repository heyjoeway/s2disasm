; ===========================================================================
; ---------------------------------------------------------------------------
; Flags section. None of this is required, but I added it here to
; make it easier to debug built ROMS! If you would like easier
; assistance from Natsumi, please keep this section intact!
; ---------------------------------------------------------------------------
	dc.b "AMPS-AS-1.1 "		; ident str

	if FEATURE_UNDERWATER
		dc.b "UW"		; underwater mode enabled
	endif

	if FEATURE_MODULATION
		dc.b "MO"		; modulation enabled
	endif

	if FEATURE_DACFMVOLENV
		dc.b "VE"		; FM & DAC volume envelope enabled
	endif

	if FEATURE_MODENV
		dc.b "ME"		; modulation envelope enabled
	endif

	if FEATURE_PORTAMENTO
		dc.b "PM"		; portamento enabled
	endif

	if FEATURE_BACKUP
		dc.b "BA"		; backup enabled
	endif

; ===========================================================================
; ---------------------------------------------------------------------------
; Define music and SFX
; ---------------------------------------------------------------------------

;	opt oz-				; disable zero-offset optimization
	if safe=0
	;	nolist			; if in safe mode, list data section.
	endif

__mus :=	MusOff

MusicIndex:
	ptrMusic EHZ, $42, CPZ, $00, ARZ, $00, CNZ, $98, HTZ, $22, MCZ, $2A
	ptrMusic OOZ, $10, MTZ, $00, SCZ, $85, WFZ, $58, DEZ, $80, HPZ, $00
	ptrMusic EHZ2P, $85, CNZ2P, $23, MCZ2P, $00
	ptrMusic SS, $00, Options, $79, Results2P, $98, Invincibility, $00
	ptrMusic SuperSonic, $00, Boss, $00, FinalBoss, $37, Drowning, $80
	ptrMusic Title, $33, GotThroughAct, $56, Emerald, $2B, ExtraLife, $33
	ptrMusic GameOver, $0E, Continue, $25, Ending, $69, Credits, $10

MusCount =	__mus-MusOff		; number of installed music tracks
SFXoff =	__mus			; first SFX ID

__sfx :=	SFXoff

SoundIndex:
	ptrSFX	0, RingRight, RingLeft, RingLoss, Splash, Break
	ptrSFX	0, Jump, Roll, Skid, Bubble, Drown, SpikeHit, Death
	ptrSFX	0, Spindash, Dash, AirDing, Shield, BossHit, Flipper
	ptrSFX	0, Starpost, Spring, Signpost, Signpost2P, Register
	ptrSFX	0, Collapse, Smash, Switch, Explode, Zapper, LidPop
	ptrSFX	0, Elevator, Bumper, TinyBumper, LargeBumper, Stomp
	ptrSFX	0, LaunchSpring, SlotMachine, Gloop, GloopDrop, Door
	ptrSFX	0, LavaBall, Flame, Fire, ArrowFire, ArrowStick, Saw
	ptrSFX	0, SpikeMove, SpikeSwitch, SpikeRing, PushBlock, Beep
	ptrSFX	0, Rumble, Rumble2, DrawBridgeMove, DrawBridgeDown
	ptrSFX	0, Sparkle, Transform, Helicopter, TrackLift, Leaves
	ptrSFX	0, Lazer, LargeLazer, LazerFloor, PlatformKnock, Swap
	ptrSFX	0, OilSlide, MechaSonic, Error, EnterSS, Continue

; unused sfx
	ptrSFX	0, Chain, Bonus, BigRing, ActionBlock, Diamonds
	ptrSFX	0, QuickDoor, Electricity, Unk2B, Unk38, Unk51, Unk52

SFXcount =	__sfx-SFXoff		; number of intalled sound effects
; ===========================================================================
; ---------------------------------------------------------------------------
; Define samples
; ---------------------------------------------------------------------------

__samp :=	$80
SampleList:
	sample $0000, Stop, Stop		; 80 - Stop sample (DO NOT EDIT)
	sample $0100, Kick, Stop		; 81 - Kick
	sample $0100, Snare, Stop		; 82 - Snare
	sample $0100, Clap, Stop		; 83 - Clap
	sample $0100, Scratch, Stop		; 84 - Scratch

	sample $0100, Timpani, Stop, HiTimpani	; 85 - High Timpani
	sample $00EE, Timpani, Stop, MidTimpani	; 86 - Mid Timpani
	sample $00D4, Timpani, Stop		; 87 - Mid Timpani
	sample $00D0, Timpani, Stop, LowTimpani	; 88 - Low Timpani
	sample $00CC, Timpani, Stop, FloorTimpani; 89 - Floor Timpani

	sample $0180, Tom, Stop, HiTom		; 8A - High Tom
	sample $0140, Tom, Stop, MidTom		; 8B - Mid Tom
	sample $0100, Tom, Stop, LowTom		; 8C - Low Tom
	sample $00E0, Tom, Stop, FloorTom	; 8D - Floor Tom

	sample $0100, Bongo, Stop, HiBongo	; 8E - High Bongo
	sample $00D0, Bongo, Stop, MidBongo	; 8F - Mid Bongo
	sample $00A0, Bongo, Stop, LowBongo	; 90 - Low Bongo
	sample $0080, Bongo, Stop, FloorBongo	; 91 - Floor Bongo
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

__venv :=	$01
VolEnvs:
	volenv 01, 02, 03, 04, 05, 06, 07, 08
	volenv 09, 0A, 0B, 0C, 0D
VolEnvs_End:
; ---------------------------------------------------------------------------

vd01:		dc.b $00, $00, $00, $08, $08, $08, $10, $10
		dc.b $10, $18, $18, $18, $20, $20, $20, $28
		dc.b $28, $28, $30, $30, $30, $38, eHold

vd02:		dc.b $00, $10, $20, $30, $40, $7F, eHold

vd03:		dc.b $00, $00, $08, $08, $10, $10, $18, $18
		dc.b $20, $20, $28, $28, $30, $30, $38, $38
		dc.b eHold

vd04:		dc.b $00, $00, $10, $18, $20, $20, $28, $28
		dc.b $28, $30, eHold

vd05:		dc.b $00, $00, $00, $00, $00, $00, $00, $00
		dc.b $00, $00, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $10, $10, $10, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $18, $18, $18, $18, $18
		dc.b $20, eHold

vd06:		dc.b $18, $18, $18, $10, $10, $10, $10, $08
		dc.b $08, $08, $00, $00, $00, $00, eHold

vd07:		dc.b $00, $00, $00, $00, $00, $00, $08, $08
		dc.b $08, $08, $08, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $20, $20, $20, $28, $28
		dc.b $28, $30, $38, eHold

vd08:		dc.b $00, $00, $00, $00, $00, $08, $08, $08
		dc.b $08, $08, $10, $10, $10, $10, $10, $10
		dc.b $18, $18, $18, $18, $18, $20, $20, $20
		dc.b $20, $20, $28, $28, $28, $28, $28, $30
		dc.b $30, $30, $30, $30, $38, $38, $38, eHold

vd09:		dc.b $00, $08, $10, $18, $20, $28, $30, $38
		dc.b $40, $48, $50, $58, $60, $68, $70, $78
		dc.b eHold

vd0A:		dc.b $00, $00, $00, $00, $00, $00, $00, $00
		dc.b $00, $00, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $10, $10, $10, $10, $10, $10, $10, $10
		dc.b $10, $10, $18, $18, $18, $18, $18, $18
		dc.b $18, $18, $18, $18, $20, eHold

vd0B:		dc.b $20, $20, $20, $18, $18, $18, $10, $10
		dc.b $10, $08, $08, $08, $08, $08, $08, $08
		dc.b $10, $10, $10, $10, $10, $18, $18, $18
		dc.b $18, $18, $20, eHold

vd0C:		dc.b $20, $20, $18, $18, $10, $10, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $10, $10, $10, $10, $10, $10
		dc.b $10, $10, $10, $10, $10, $10, $10, $10
		dc.b $10, $10, $10, $10, $10, $10, $18, $18
		dc.b $18, $18, $18, $18, $18, $18, $18, $18
		dc.b $18, $18, $18, $18, $18, $18, $18, $18
		dc.b $18, $18, $20, $20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $28, $28
		dc.b $28, $28, $28, $28, $28, $28, $28, $28
		dc.b $28, $28, $28, $28, $28, $28, $28, $28
		dc.b $28, $28, $30, $30, $30, $30, $30, $30
		dc.b $30, $30, $30, $30, $30, $30, $30, $30
		dc.b $30, $30, $30, $30, $30, $30, $38, eHold

vd0D:		dc.b $70, $68, $60, $58, $50, $48, $40, $38
		dc.b $30, $28, $20, $18, $10, $08, $00, eHold
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

		even
__menv :=	$01

ModEnvs:
ModEnvs_End:
; ---------------------------------------------------------------------------

	if FEATURE_MODENV

	endif

; ===========================================================================
; ---------------------------------------------------------------------------
; Include music, sound effects and voice table
; ---------------------------------------------------------------------------

	include "driver/Voices.asm"	; include universal Voice bank


; include SFX and music
sfxaddr:	incSFX
musaddr:	incMus
musend:
; ===========================================================================
; ---------------------------------------------------------------------------
; Include samples and filters
; ---------------------------------------------------------------------------

		align	$8000		; must be aligned to bank... By the way, these are also set in Z80.asm. Be sure to check it out also.
fLog:		binclude "driver/filters/Logarithmic.dat"; logarithmic filter (no filter)
;fLinear:	binclude "driver/filters/Linear.dat"	; linear filter (no filter)

dacaddr:	asdata Z80E_Read*(MaxPitch/$100), $00
SWF_Stop:	asdata $8000-(2*Z80E_Read*(MaxPitch/$100)), $80
SWFR_Stop:	asdata Z80E_Read*(MaxPitch/$100), $00

	incSWF	Kick, Snare, Clap, Tom, Timpani, Bongo
	incSWF	Scratch
	even
;	list				; continue source listing
; ===========================================================================