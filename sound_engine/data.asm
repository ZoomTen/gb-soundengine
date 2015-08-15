; Song pointers
SoundPointers::
	dw Sound0 	; test song - ocean loader 4
	dw Sound1	; test song - super pitfall!
	dw Sound2	; test song - pokemon intro test
	
Sound0:
	db 4		; 4 channels
	dw Sound0_Ch1
	dw Sound0_Ch2
	dw Sound0_Ch3
	dw Sound0_Ch4
	
Sound1:
	db 4		; 4 channels
	dw Sound1_Ch1
	dw Sound1_Ch2
	dw Sound1_Ch3
	dw Sound1_Ch4
	
Sound2:
	db 3		; 3 channels
	dw Sound2_Ch1
	dw Sound2_Ch2
	dw Sound2_Ch3

; Song data
INCLUDE "sound_engine/data/song0.asm"
INCLUDE "sound_engine/data/song1.asm"
INCLUDE "sound_engine/data/song2.asm"