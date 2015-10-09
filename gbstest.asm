INCLUDE	"sound_engine/macros.asm"
INCLUDE	"sound_engine/constants.asm"
INCLUDE "hardware_constants.inc"
INCLUDE	"sound_engine/wram.asm"

SECTION "GBS Header", ROM0[$0]
	db "GBS"	; identifier
	db 1		; GBS spec version
	db 7		; number of songs
	db 1		; first song
	dw Start	; load address
	dw Start	; init address
	dw Play		; play address
	dw $DFFF	; stack address
	db 0		; timer modulo; unused
	db 0		; timer control; unused
	
SECTION "GBS Title", ROM0[$10]
	db "Sound Engine Test"	; title
	
SECTION "GBS Author", ROM0[$30]
	db "ZoomTen Games"	; composer
	
SECTION "GBS Copyright", ROM0[$50]
	db "2015 ZoomTen"	; copyright

SECTION "Actual Code", ROM0[$470]	; load/init/play has to be $400 - $7fff
					; according to specs
Start:
INCLUDE "sound_engine/interfaces.asm"
Play:
INCLUDE "sound_engine/engine.asm"
INCLUDE "sound_engine/data.asm"