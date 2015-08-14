; Song data

SoundPointers::
	dw Sound0 	; test song:: ocean loader 4
	dw Sound1	; test song:: a something
	dw Sound2	; test song:: pokemon intro
	
Sound0:
	db 4		; 3 channels
	dw Sound0_Ch1
	dw Sound0_Ch2
	dw Sound0_Ch3
	dw Sound0_Ch4
	
Sound1:
	db 2		; 2 channels
	dw Sound1_Ch1
	dw Sound1_Ch2
	
Sound2:
	db 3		; 4 channels
	dw Sound2_Ch1
	dw Sound2_Ch2
	dw Sound2_Ch3

Sound2_Ch1:
	db stereo,	$FF
	db duty,	3
	db setEnvelope, $B1
	db finepitch,	1
	note rs, 0, 8*5
	callch .sub
	db setEnvelope, $B4
	note D_, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note D#, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note D_, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $A0
	note A#, 1, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note D_, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $29
	note G_, 2, 4*5
	db setEnvelope, $B0
	note A_, 2, 8*5
	note A_, 1, 8*5
	db setEnvelope, $B7
	note F_, 2, 8*5
	db setEnvelope, $4F
	note F_, 1, 8*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note D_, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note D#, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note F_, 2, 4*5
	db setEnvelope, $B1
	callch .sub
	db setEnvelope, $B4
	note G_, 2, 4*5
	db setEnvelope, $B0
	note F#, 2, 16*5
	db setEnvelope, $B1
	note D_, 2, 4*5
	db endSong
.sub
	db setLength, 2*5-1
	notedata A_, 1
	notedata A_, 1
	db toggleManual, endSub
	
Sound2_Ch2:
	db duty,	3
	db setEnvelope, $C2
	note rs, 0, 8*5
	callch .sub
	db setEnvelope, $C5
	note A_, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note A#, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note A_, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C7
	note C#, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note A_, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C7
	note C#, 3, 4*5
	note D_, 3, 8*5
	note D_, 2, 8*5
	note C_, 3, 8*5
	note C_, 2, 8*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note A_, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note A#, 2, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note C_, 3, 4*5
	db setEnvelope, $C2
	callch .sub
	db setEnvelope, $C5
	note C#, 3, 4*5
	db setEnvelope, $2F
	note D_, 3, 16*5
	db setEnvelope, $C1
	note D_, 4, 2*5
	db endSong
.sub
	db setLength, 2*5-1
	notedata D_, 2
	notedata D_, 2
	db toggleManual, endSub
Sound2_Ch3:
	db wave, $22
	note rs, 0, 8*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note F#, 3, 4*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note A#, 3, 4*5
	note A_, 3, 8*5
	note D_, 3, 8*5
	note A#, 3, 8*5
	note D_, 3, 8*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note A_, 3, 4*5
	callch .sub
	note A#, 3, 4*5
	callch .sub
	note A#, 3, 4*5
	note A_, 3, 16*5
	note D_, 3, 1*5
	db endSong
.sub
	db setLength, 5-1
	notedata D_, 3
	notedata rs, 0
	notedata D_, 3
	notedata rs, 0
	db toggleManual, endSub
	
Sound2_Ch4:
	db setLength, 2-1
	db setEnvelope, $61
	db noisetype, $22
	db reptnote
	db reptnote
	db reptnote
	db reptnote
	db setEnvelope, $71
	db reptnote
	db setEnvelope, $61
	db reptnote
	db setEnvelope, $71
	db reptnote
	db setEnvelope, $61
	db reptnote
	db setEnvelope, $71
	db reptnote
	db setEnvelope, $61
	db reptnote
	db setEnvelope, $71
	db reptnote
	db reptnote
	db reptnote
	db reptnote
	db setEnvelope, $91
	db reptnote
	db setLength, (4*2)-1
	db reptnote
	db reptnote
	db setLength, 2-1
	db setEnvelope, $61
	db reptnote
	db reptnote
	db reptnote
	db reptnote
	db endSong
	
Sound1_Ch1:
	db setEnvelope, $F2
	db duty,	1
.loop
	db setLength,	$6 - 1
	notedata C_, 2
	notedata C_, 2
	notedata C_, 3
	notedata C_, 3
	notedata C_, 2
	notedata C_, 2
	db toggleManual
	note C_, 3, $c
	db loopSong
	dw .loop
	
Sound1_Ch2:
	db finepitch,	$-2
	db setEnvelope, $F2
	db duty,	1
.loop
	db setLength,	$6 - 1
	notedata C_, 2
	notedata C_, 2
	notedata C_, 3
	notedata C_, 3
	notedata C_, 2
	notedata C_, 2
	db toggleManual
	note C_, 3, $C
	db loopSong
	dw .loop
	
Sound0_Ch1:
	db stereo,	$FF
	db finepitch,	$-1
	db setEnvelope,	$C2
	db duty,	1
.loop
	db transpose, 0
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db transpose, -2
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db transpose, -4
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db loopSong
	dw .loop
.sub
	note C_, 1, $3 * 7
	note C_, 1, $1 * 7
	note C_, 2, $2 * 7
	note C_, 1, $2 * 7
	note C_, 1, $1 * 7
	note C_, 1, $1 * 7
	note C_, 2, $1 * 7
	note C_, 1, $2 * 7
	note C_, 1, $1 * 7
	note A#, 0, $1 * 7
	note A#, 0, $1 * 7
	db endSub
	
Sound0_Ch2:
	db setEnvelope,	$F7
	db finepitch,	$1
	db duty,	1
.loop
	note rs, 0, $2 * 7
	note C_, 3, $2 * 7
	note D#, 3, $2 * 7
	note F_, 3, $2 * 7
	note G_, 3, $2 * 7
	note F_, 3, $2 * 7
	note D#, 3, $4 * 7
	note D_, 3, $2 * 7
	note D#, 3, $4 * 7
	note D_, 3, $6 * 7
	note A#, 2, $4 * 7
	note D_, 3, $6 * 7
	note D#, 3, $6 * 7
	note D_, 3, $4 * 7
	note D_, 3, $1 * 7
	note D#, 3, $1 * 7
	note D_, 3, $a * 7
	note A#, 2, $4 * 7
	
	note C_, 3, $6 * 7
	note A#, 2, $6 * 7
	note G#, 2, $4 * 7
	
	note C_, 3, $6 * 7
	note C#, 3, $6 * 7
	note D#, 3, $4 * 7
	db loopSong
	dw .loop
	
Sound0_Ch3:
	db wave, $21
.loop
	db transpose, 0
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db transpose, -2
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db transpose, -4
	db callChannel
	dw .sub
	db callChannel
	dw .sub
	db loopSong
	dw .loop
.sub
	db wave, $20
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	db wave, $21
	note C_, 4, $1 * 7 - 2
	note rs, 0, $3 * 7 - 5
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	db wave, $20
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	db wave, $21
	note C_, 4, $1 * 7 - 2
	note rs, 0, $3 * 7 - 5
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	note C_, 4, $1 * 7 - 2
	note rs, 0, 2
	db endSub
	
Sound0_Ch4:
.loop
	db toggleManual
	db rest, $4 * 7 - 1
	db setEnvelope, $F0
	db setLength, $1
	db noisetype, $37
	db toggleManual
	db setEnvelope, $f1
	db noisetype, $24, $b
	db toggleManual
	db rest, $2 * 7 - 1
	db loopSong
	dw .loop