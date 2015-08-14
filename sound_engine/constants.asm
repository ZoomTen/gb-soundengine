; Sound engine constants
endSong		EQU	$FF	; Ends the song, no parameters.

				; (NOT IMPLEMENTED YET)
;reptSong	EQU	$FE	; Repeats a part of the song n times, 1-byte parameter.
				; Param 1: times to repeat section
				
loopSong	EQU	$FD	; Loop the song from pointer, 2-byte parameter.
				; Param 1 & 2: little-endian pointer to loop point
				
finepitch	EQU	$FC	; Set channel's fine pitch, 1-byte parameter.
				; Param 1: fine pitch
				
noisetype	EQU	$FB	; Set noise type, 2-byte parameter.
				; Param 1: Noise type, I'm not quite sure how this works.
				; Param 2: depends if the auto/manual flag is set.
				
duty		EQU	$FB	; Set pulse 1 & 2's square duty, 1-byte parameter.
				; 0 = 12,5%
				; 1 = 25%
				; 2 = 50%
				; 3 = 75% (inverse 25% cycle)
				
wave		EQU	$FB	; Set channel 3's wave instrument, 1-byte parameter.
				; High nibble = volume of wave instrument (doesn't seem to work...)
				; Low  nibble = wave instrument number
				
setEnvelope	EQU	$FA	; Set pulse 1 & 2's envelope, 1-byte parameter
				; High nibble = starting volume
				
				; Low  nibble = volume modifier (0-7 decay, 8-F attack)
stereo		EQU	$F9	; Set global stereo effect, 1-byte parameter
				; High nibble = left volume
				; Low  nibble = right volume
				
toggleManual	EQU	$F8	; Toggles manual length mode, no parameters
setLength	EQU	$F7	; Sets note length and toggles auto-length mode, 1-byte parameter.
				; Param 1: note length
				
transpose	EQU	$F6	; Sets note transpose, 1-byte parameter
				; Param 1: transpose
				
callChannel	EQU	$F5	; Plays a section from a channel, then resumes playback. 2-byte parameter.
				; Param 1 & 2: little-endian pointer to branch
				
endSub		EQU	$F4	; Ends section played from callChannel, no parameters.

rest		EQU	$F3	; Inserts rest. Used in noise channel.
				; No parameters if auto length mode is set, else 1-byte parameter for delay.

reptnote	EQU	$F2	; Repeats note with the same length. (only works in auto!) No parameters.
				; ONLY WORKS IN NOISE CHANNEL
				
rs		EQU	$00
C_		EQU	$01
C#		EQU	$02
D_		EQU	$03
D#		EQU	$04
E_		EQU	$05
F_		EQU	$06
F#		EQU	$07
G_		EQU	$08
G#		EQU	$09
A_		EQU	$0A
A#		EQU	$0B
B_		EQU	$0C