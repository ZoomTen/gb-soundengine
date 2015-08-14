gbsstart	EQU	$400

INCLUDE	"sound_engine/macros.asm"
INCLUDE	"sound_engine/constants.asm"
INCLUDE "hardware_constants.inc"

SECTION "WRAM", WRAM0
INCLUDE	"sound_engine/wram.asm"

SECTION "GBS Header", ROM0[$0]
	db "GBS"	; identifier
	db 1		; GBS spec version
	db 3		; number of songs
	db 1		; first song
	dw Start	; load address
	dw Start	; init address
	dw Play		; play address
	dw $DFFF	; stack address
	db 0		; timer modulo; unused
	db 0		; timer control; unused
SECTION "GBS Title", ROM0[$10]
	db "My GBS Soundtrack"	; title
	
SECTION "GBS Author", ROM0[$30]
	db "ZoomTen Games"	; composer
	
SECTION "GBS Copyright", ROM0[$50]
	db "2015 ZoomTen"	; copyright

SECTION "Actual Code", ROM0[$470]
Start:
INCLUDE "sound_engine/interfaces.asm"
Play:
INCLUDE "sound_engine/engine.asm"
INCLUDE "sound_engine/data.asm"