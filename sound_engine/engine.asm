; ZoomTen's GameBoy sound driver
; version 1.0

UpdateMusic:			; this is the main sound driver
				; updates channel data every frame
	ld a, [seIsPlaying]
	and a			; if 0 (stopped)
	jr z, .stopallsounds
	ld a, [seNumChannels]	; load number of channels
	push af
	call UpdateCh1		; update pulse 1
	pop af
	dec a
	ret z			; return if 1 channel
	push af
	call UpdateCh2		; update pulse 2
	pop af
	dec a
	ret z			; return if 2 channels
	push af
	call UpdateCh3		; update wave
	pop af
	dec a
	ret z			; return if 3 channels
	push af
	call UpdateCh4		; update noise
	pop af			; don't screw up the call stack
	ret
.stopallsounds
	xor a
	ld [rNR12], a
	ld [rNR22], a
	ld [rNR32], a
	ld [rNR42], a
	ret
	
NotesCommonPitches:		; note pitches
				; actually copied over from Antonio's GBT player
	dw    $ffff	  ; rs  00
	dw   44,  156,  262,  363,  457,  547,  631,  710,  786,  854,  923,  986 ; 01-0c
	dw 1046, 1102, 1155, 1205, 1253, 1297, 1339, 1379, 1417, 1452, 1486, 1517 ; 0d-18
	dw 1546, 1575, 1602, 1627, 1650, 1673, 1694, 1714, 1732, 1750, 1767, 1783 ; 19-24
	dw 1798, 1812, 1825, 1837, 1849, 1860, 1871, 1881, 1890, 1899, 1907, 1915 ; 25-30
	dw 1923, 1930, 1936, 1943, 1949, 1954, 1959, 1964, 1969, 1974, 1978, 1982 ; 31-3c
	dw 1985, 1988, 1992, 1995, 1998, 2001, 2004, 2006, 2009, 2011, 2013, 2015 ; 3d-48
	
Waveforms:			; wave channel waveforms
	dw .w0	;0
	dw .w1	;1
	dw .w2	;2
	dw .w3	;3
	dw .w4	;4
	dw .w5	;5
	dw .w6	;6
	dw .w0	;7
	dw .w0	;8
	dw .w0	;9
	dw .w0	;a
	dw .w0	;b
	dw .w0	;c
	dw .w0	;d
	dw .w0	;e
	dw .w0	;f
.w0			; saw wave
	db $00,$11,$22,$33,$44,$55,$66,$77,$88,$99,$aa,$bb,$cc,$dd,$ee,$ff
.w1			; thingamabob
	db $00,$10,$11,$22,$20,$33,$30,$44,$40,$55,$50,$66,$60,$77,$70,$78
.w2			; pokemon sine wave ver 1
	db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11
.w3			; pokemon sine wave ver 2
	db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11
.w4			; pokemon sine wave ver 3
	db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10
.w5			; pokemon sine wave ver 4
	db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31
.w6			; pokemon saw wave
	db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10
	
UpdateCh1:				; where all the magic happens :P
; if delay != 0
; don't update music
	ld a, [seCh1Delay]
	and a
	jr nz, .cont
; load music pointers to hl
	ld a, [seCh1CurPointer]
	ld l, a
	ld a, [seCh1CurPointer+1]
	ld h, a
.readcommands
; parse command bytes
	ld a, [hl]
	cp callChannel
	jp z, .pushChannelptr
	cp endSub
	jp z, .popChannelptr
	cp toggleManual
	jp z, .domanual
	cp setLength
	jp z, .setlength
	cp transpose
	jp z, .transpose
	cp stereo
	jr z, .dostereo
	cp finepitch
	jr z, .finepitch
	cp loopSong
	jp z, .loopsong
	cp endSong
	jr z, .disablesound
	cp duty
	jr z, .updateduty
	cp setEnvelope
	jr z, .setenvelope
; notes $00 - $48
	cp $49
	jr c, .playnote
	jr .end
.cont
; instead decrement the delay
	ld a, [seCh1Delay]
	dec a
	ld [seCh1Delay], a
	ret
.end
; update music pointer in RAM
	ld a, l
	ld [seCh1CurPointer], a
	ld a, h
	ld [seCh1CurPointer+1], a
	ret
.disablesound
; disables all sounds
	xor a
	ld [rNR12], a
	jr .end
.finepitch
; basic command format.
; applies a fine pitch
	inc hl			; read next byte
	ld a, [hl]
	ld [seCh1FinePitch], a	; put variable
	inc hl
	jr .readcommands	; parse the next byte
				; (so we don't sacrifice a frame :P)
.dostereo
; this is a global command, meaning it affects all channels
	inc hl
	ld a, [hl]
	ld [rNR51], a		; change output channels
	inc hl
	jr .readcommands
.updateduty
; changes pulse instrument
; 0=12.5%, 1=25%, 2=50%, 3=75%
	inc hl
	ld a, [hl]
	rla			; duty is set in bits 6-7
	rla			; so we move stuff
	rla
	rla
	rla
	rla
	ld [rNR11], a		; apply duty
	inc hl
	jr .readcommands
.setenvelope
; first nibble  = starting volume
; second nibble = envelope (0-7 down, 8-F up)
	inc hl
	ld a, [hl]
	ld [rNR12], a
	ld [seCh1CurEnvelope], a
	inc hl
	jr .readcommands
.playnote
; plays a note
	ld a, [hl]
	ld [seCh1CurNote], a		; used for debug
	and a
	jr z, .notranspose		; if rest note
	ld b, a
	ld a, [seCh1Transpose]		; transpose
	add b
.notranspose
; get note
	push hl
	ld hl, NotesCommonPitches
	ld c, a
	xor a
	ld b, a				; bc = note offset
	add hl, bc
	add hl, bc
	ld a, [seCh1FinePitch]		; load fine pitch
	ld b, a
	ld a, [hli]			; get frequency's low byte
	sub b				; apply fine pitch
	ld [rNR13], a
	ld a, [hl]			; get frequency's high byte
	set 7, a			; set "sound restart" flag
	ld [rNR14], a
	pop hl
; get delay
	ld a, [seCh1NoteLength]		; check if note length defined
	and a
	jp nz, .setautolength
	inc hl
	ld a, [hl]
	ld [seCh1Delay], a
	inc hl
	jr .end				; save music pointer to RAM
.loopsong
	inc hl
; save address pointed by the next 2 bytes to RAM,
; replacing the current byte
	ld a, [hli]
	ld [seCh1CurPointer], a
	ld a, [hl]
	ld [seCh1CurPointer+1], a
	jp UpdateCh1		; start back from the top
.domanual
; set manual length mode by clearing the note length
	xor a
	ld [seCh1NoteLength], a
	inc hl
	jp .readcommands
.setlength
; set auto length mode
	inc hl
	ld a, [hl]
	ld [seCh1NoteLength], a
	inc hl
	jp .readcommands
.transpose
; set transpose
	inc hl
	ld a, [hl]
	ld [seCh1Transpose], a
	inc hl
	jp .readcommands
.setautolength
; transfer auto length
	ld a, [seCh1NoteLength]
	ld [seCh1Delay], a
	inc hl
	jp .end
.pushChannelptr
; saves channel pointer and reads call pointer
	inc hl
	inc hl
	inc hl			; move to next instruction
	ld a, h
	ld [seCh1SavedPointer+1], a
	ld a, l
	ld [seCh1SavedPointer], a
	dec hl
	dec hl
; save address pointed by the next 2 bytes to RAM,
; replacing the current byte
	ld a, [hli]
	ld [seCh1CurPointer], a
	ld a, [hl]
	ld [seCh1CurPointer+1], a
	jp UpdateCh1		; start back from the top
.popChannelptr
; restores channel pointer
	ld a, [seCh1SavedPointer]
	ld [seCh1CurPointer], a
	ld a, [seCh1SavedPointer+1]
	ld [seCh1CurPointer+1], a
	jp UpdateCh1		; start back from the top
	
	
	
; From this point it's basically copies of above
; just with slightly different code >_>
; Update pulse 2 channel...
UpdateCh2:
	ld a, [seCh2Delay]
	and a
	jr nz, .cont
	ld a, [seCh2CurPointer]
	ld l, a
	ld a, [seCh2CurPointer+1]
	ld h, a
.readcommands
	ld a, [hl]
	cp callChannel
	jp z, .pushChannelptr
	cp endSub
	jp z, .popChannelptr
	cp toggleManual
	jp z, .domanual
	cp setLength
	jp z, .setlength
	cp transpose
	jp z, .transpose
	cp stereo
	jr z, .dostereo
	cp finepitch
	jr z, .finepitch
	cp loopSong
	jp z, .loopsong
	cp endSong
	jr z, .disablesound
	cp duty
	jr z, .updateduty
	cp setEnvelope
	jr z, .setenvelope
	cp $49
	jr c, .playnote
	jr .end
.cont
	ld a, [seCh2Delay]
	dec a
	ld [seCh2Delay], a
	ret
.end
	ld a, l
	ld [seCh2CurPointer], a
	ld a, h
	ld [seCh2CurPointer+1], a
	ret
.disablesound
	xor a
	ld [rNR22], a
	jr .end
.finepitch
	inc hl
	ld a, [hl]
	ld [seCh2FinePitch], a
	inc hl
	jr .readcommands
.dostereo
	inc hl
	ld a, [hl]
	ld [rNR51], a
	inc hl
	jr .readcommands
.updateduty
	inc hl
	ld a, [hl]
	rla
	rla
	rla
	rla
	rla
	rla
	ld [rNR21], a
	inc hl
	jr .readcommands
.setenvelope
	inc hl
	ld a, [hl]
	ld [rNR22], a
	ld [seCh2CurEnvelope], a
	inc hl
	jr .readcommands
.playnote
	ld a, [hl]
	ld [seCh2CurNote], a
	and a
	jr z, .notranspose
	ld b, a
	ld a, [seCh2Transpose]		; transpose
	add b
.notranspose
	push hl
	ld hl, NotesCommonPitches
	ld c, a
	xor a
	ld b, a
	add hl, bc
	add hl, bc
	ld a, [seCh2FinePitch]
	ld b, a
	ld a, [hli]
	sub b
	ld [rNR23], a
	ld a, [hl]
	set 7, a
	ld [rNR24], a
	pop hl
	ld a, [seCh2NoteLength]		; check if note length defined
	and a
	jp nz, .setautolength
	inc hl
	ld a, [hl]
	ld [seCh2Delay], a
	inc hl
	jr .end
.loopsong
	inc hl
	ld a, [hli]
	ld [seCh2CurPointer], a
	ld a, [hl]
	ld [seCh2CurPointer+1], a
	jp UpdateCh2
.domanual
	xor a
	ld [seCh2NoteLength], a
	inc hl
	jp .readcommands
.setlength
	inc hl
	ld a, [hl]
	ld [seCh2NoteLength], a
	inc hl
	jp .readcommands
.transpose
	inc hl
	ld a, [hl]
	ld [seCh2Transpose], a
	inc hl
	jp .readcommands
.setautolength
	ld a, [seCh2NoteLength]
	ld [seCh2Delay], a
	inc hl
	jp .end
.pushChannelptr
	inc hl
	inc hl
	inc hl
	ld a, h
	ld [seCh2SavedPointer+1], a
	ld a, l
	ld [seCh2SavedPointer], a
	dec hl
	dec hl
	ld a, [hli]
	ld [seCh2CurPointer], a
	ld a, [hl]
	ld [seCh2CurPointer+1], a
	jp UpdateCh2
.popChannelptr
	ld a, [seCh2SavedPointer]
	ld [seCh2CurPointer], a
	ld a, [seCh2SavedPointer+1]
	ld [seCh2CurPointer+1], a
	jp UpdateCh2

	
	
; Update wave channel...
UpdateCh3:
	ld a, [seCh3Delay]
	and a
	jr nz, .cont
	ld a, [seCh3CurPointer]
	ld l, a
	ld a, [seCh3CurPointer+1]
	ld h, a
.readcommands
	ld a, [hl]
	cp callChannel
	jp z, .pushChannelptr
	cp endSub
	jp z, .popChannelptr
	cp toggleManual
	jp z, .domanual
	cp setLength
	jp z, .setlength
	cp transpose
	jp z, .transpose
	cp stereo
	jr z, .dostereo
	cp finepitch
	jr z, .finepitch
	cp loopSong
	jp z, .loopsong
	cp endSong
	jr z, .disablesound
	cp wave
	jr z, .updatewave
	; command $4A is unused
	cp $49
	jr c, .playnote
	jr .end
.cont
	ld a, [seCh3Delay]
	dec a
	ld [seCh3Delay], a
	ret
.end
	ld a, l
	ld [seCh3CurPointer], a
	ld a, h
	ld [seCh3CurPointer+1], a
	ret
.disablesound
	xor a
	ld [rNR32], a
	jr .end
.finepitch
	inc hl
	ld a, [hl]
	ld [seCh3FinePitch], a
	inc hl
	jr .readcommands
.dostereo
	inc hl
	ld a, [hl]
	ld [rNR51], a
	inc hl
	jr .readcommands
.updatewave
	inc hl
	ld a, [hl]
	and %00001111
	ld c, a
	xor a
	ld b, a
	push hl
	ld hl, Waveforms
	add bc
	add bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld l, e
	ld h, d
	ld c, $10
	xor a
	ld [rNR30], a
	ld hl, $ff30
.copywave
	ld a, [de]
	ld [hli],a
	inc de
	dec c
	jr nz, .copywave
	ld a, $80
	ld [rNR30], a
	pop hl
	ld a, [hl]
	and %00110000
	ld [rNR32], a
	ld [seCh3CurEnvelope], a
	inc hl
	jp .readcommands
.playnote
	ld a, [hl]
	ld [seCh3CurNote], a
	and a
	jr z, .notranspose
	ld b, a
	ld a, [seCh3Transpose]		; transpose
	add b
.notranspose
	push hl
	ld hl, NotesCommonPitches
	ld c, a
	xor a
	ld b, a
	add hl, bc
	add hl, bc
	ld a, [seCh3FinePitch]
	ld b, a
	ld a, [hli]
	sub b
	ld [rNR33], a
	ld a, [hl]
	set 7, a
	ld [rNR34], a
	pop hl
	ld a, [seCh3NoteLength]		; check if note length defined
	and a
	jp nz, .setautolength
	inc hl
	ld a, [hl]
	ld [seCh3Delay], a
	inc hl
	jp .end
.loopsong
	inc hl
	ld a, [hli]
	ld [seCh3CurPointer], a
	ld a, [hl]
	ld [seCh3CurPointer+1], a
	jp UpdateCh3
.domanual
	xor a
	ld [seCh3NoteLength], a
	inc hl
	jp .readcommands
.setlength
	inc hl
	ld a, [hl]
	ld [seCh3NoteLength], a
	inc hl
	jp .readcommands
.transpose
	inc hl
	ld a, [hl]
	ld [seCh3Transpose], a
	inc hl
	jp .readcommands
.setautolength
	ld a, [seCh3NoteLength]
	ld [seCh3Delay], a
	inc hl
	jp .end
.pushChannelptr
	inc hl
	inc hl
	inc hl
	ld a, h
	ld [seCh3SavedPointer+1], a
	ld a, l
	ld [seCh3SavedPointer], a
	dec hl
	dec hl
	ld a, [hli]
	ld [seCh3CurPointer], a
	ld a, [hl]
	ld [seCh3CurPointer+1], a
	jp UpdateCh3
.popChannelptr
	ld a, [seCh3SavedPointer]
	ld [seCh3CurPointer], a
	ld a, [seCh3SavedPointer+1]
	ld [seCh3CurPointer+1], a
	jp UpdateCh3
	
	
	
; Update noise channel...
UpdateCh4:
	ld a, [seCh4Delay]
	and a
	jr nz, .cont
	ld a, [seCh4CurPointer]
	ld l, a
	ld a, [seCh4CurPointer+1]
	ld h, a
.readcommands
	ld a, [hl]
	cp reptnote
	jp z, .rept
	cp callChannel
	jp z, .pushChannelptr
	cp endSub
	jp z, .popChannelptr
	cp toggleManual
	jp z, .domanual
	cp setLength
	jp z, .setlength
	cp stereo
	jr z, .dostereo
	cp loopSong
	jp z, .loopsong
	cp endSong
	jr z, .disablesound
	cp noisetype
	jr z, .setnoisetype
	cp setEnvelope
	jr z, .setenvelope
	cp rest
	jr z, .rest
	jr .end
.cont
	ld a, [seCh4Delay]
	dec a
	ld [seCh4Delay], a
	ret
.end
	ld a, l
	ld [seCh4CurPointer], a
	ld a, h
	ld [seCh4CurPointer+1], a
	ret
.disablesound
	xor a
	ld [rNR42], a
	jr .end
.dostereo
	inc hl
	ld a, [hl]
	ld [rNR51], a
	inc hl
	jr .readcommands
.setenvelope
	inc hl
	ld a, [hl]
	ld [rNR42], a
	ld [seCh4CurEnvelope], a
	inc hl
	jr .readcommands
.rest
	xor a
	ld [rNR42], a
	ld a, [seCh4NoteLength]		; check if note length defined
	and a
	jp nz, .setautolength
	inc hl
	ld a, [hl]
	ld [seCh4Delay], a
	inc hl
	jr .end
.setnoisetype
	ld a, [seCh4CurEnvelope]
	ld [rNR42], a
	inc hl
	ld a, [hl]
	ld [rNR43], a
	ld [seCh4CurNote], a
	ld a, $80
	ld [rNR44], a
	ld a, [seCh4NoteLength]		; check if note length defined
	and a
	jp nz, .setautolength
	inc hl
	ld a, [hl]
	ld [seCh4Delay], a
	inc hl
	jr .end
.loopsong
	inc hl
	ld a, [hli]
	ld [seCh4CurPointer], a
	ld a, [hl]
	ld [seCh4CurPointer+1], a
	jp UpdateCh4
.domanual
	xor a
	ld [seCh4NoteLength], a
	inc hl
	jp .readcommands
.setlength
	inc hl
	ld a, [hl]
	ld [seCh4NoteLength], a
	inc hl
	jp .readcommands
.setautolength
	ld a, [seCh4NoteLength]
	ld [seCh4Delay], a
	inc hl
	jp .end
.pushChannelptr
	inc hl
	inc hl
	inc hl
	ld a, h
	ld [seCh4SavedPointer+1], a
	ld a, l
	ld [seCh4SavedPointer], a
	dec hl
	dec hl
	ld a, [hli]
	ld [seCh4CurPointer], a
	ld a, [hl]
	ld [seCh4CurPointer+1], a
	jp UpdateCh4
.popChannelptr
	ld a, [seCh4SavedPointer]
	ld [seCh4CurPointer], a
	ld a, [seCh4SavedPointer+1]
	ld [seCh4CurPointer+1], a
	jp UpdateCh4
.rept
	ld a, [seCh4CurNote]
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	ld a, [seCh4NoteLength]
	ld [seCh4Delay], a
	inc hl
	jp .end