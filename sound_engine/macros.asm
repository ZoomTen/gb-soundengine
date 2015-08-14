note:	MACRO
	; note, octave, delay
	db (\1 + $c * (\2))
	db \3-1
	ENDM
notedata:	MACRO
	; note, octave
	db (\1 + $c * (\2))
	ENDM
	
callch:	MACRO
	db callChannel
	dw \1
	ENDM