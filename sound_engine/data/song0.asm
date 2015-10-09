; Example song 1: Ocean Loader 4 by Jonathan Dunn

Sound0_Ch1::
	stereo 15, 15
	finepitch $-1
	setEnvelope 12, 2
	duty 1
.loop
	transpose 0
	callChannel .sub
	callChannel .sub
	transpose -2
	callChannel .sub
	callChannel .sub
	transpose -4
	callChannel .sub
	callChannel .sub
	loopChannel .loop
.sub
	note C_, 1, ($3 * 7)-1
	note C_, 1, ($1 * 7)-1
	note C_, 2, ($2 * 7)-1
	note C_, 1, ($2 * 7)-1
	note C_, 1, ($1 * 7)-1
	note C_, 1, ($1 * 7)-1
	note C_, 2, ($1 * 7)-1
	note C_, 1, ($2 * 7)-1
	note C_, 1, ($1 * 7)-1
	note A#, 0, ($1 * 7)-1
	note A#, 0, ($1 * 7)-1
	endSub
	
Sound0_Ch2::
	setSpeed 0
	setEnvelope 15, 7
	finepitch $1
	duty 1
.loop
	note rs, 0, ($2 * 7)-1
	note C_, 3, ($2 * 7)-1
	note D#, 3, ($2 * 7)-1
	note F_, 3, ($2 * 7)-1
	note G_, 3, ($2 * 7)-1
	note F_, 3, ($2 * 7)-1
	note D#, 3, ($4 * 7)-1
	note D_, 3, ($2 * 7)-1
	note D#, 3, ($4 * 7)-1
	note D_, 3, ($6 * 7)-1
	note A#, 2, ($4 * 7)-1
	note D_, 3, ($6 * 7)-1
	note D#, 3, ($6 * 7)-1
	note D_, 3, ($4 * 7)-1
	note D_, 3, ($1 * 7)-1
	note D#, 3, ($1 * 7)-1
	note D_, 3, ($a * 7)-1
	note A#, 2, ($4 * 7)-1
	note C_, 3, ($6 * 7)-1
	note A#, 2, ($6 * 7)-1
	note G#, 2, ($4 * 7)-1
	note C_, 3, ($6 * 7)-1
	note C#, 3, ($6 * 7)-1
	note D#, 3, ($4 * 7)-1
	loopChannel .loop
	
Sound0_Ch3::
	setSpeed 0
.loop
	transpose 0
	callChannel .sub
	callChannel .sub
	transpose -2
	callChannel .sub
	callChannel .sub
	transpose -4
	callChannel .sub
	callChannel .sub
	loopChannel .loop
.sub
	wave full, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	wave half, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, ($3 * 7)-1 - 5
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	wave quarter, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	wave full, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	wave half, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, ($3 * 7)-1 - 5
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	wave quarter, 0
	note C_, 4, ($1 * 7)-1 - 2
	note rs, 0, 1
	endSub
	
Sound0_Ch4::
	setSpeed 0
.loop
	setManual
	rest ($4 * 7)-1
	setEnvelope 15, 0
	setLength 1
	noisedata $37
	setManual
	setEnvelope 15, 1
	noise $24, $b
	setManual
	rest ($2 * 7)-1
	loopChannel .loop