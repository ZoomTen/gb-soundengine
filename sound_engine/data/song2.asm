; Example song 3: Pokemon R/B/Y - Intro Battle (3 channel demo)

Sound2_Ch1::
	stereo 15, 15
	duty 3
	setEnvelope 11, 1
	finepitch 2
	note rs, 0, 8*5
	callChannel .sub
	setEnvelope 11, 4
	note D_, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note D#, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note D_, 2, 4*5
	setEnvelope 11, 1 
	callChannel .sub
	setEnvelope 10, 0
	note A#, 1, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note D_, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 2, 9
	note G_, 2, 4*5
	setEnvelope 11, 0
	note A_, 2, 8*5
	note A_, 1, 8*5
	setEnvelope 11, 7
	note F_, 2, 8*5
	setEnvelope 4, 15
	note F_, 1, 8*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note D_, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note D#, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note F_, 2, 4*5
	setEnvelope 11, 1
	callChannel .sub
	setEnvelope 11, 4
	note G_, 2, 4*5
	setEnvelope 11, 0
	note F#, 2, 16*5
	setEnvelope 11, 1
	note D_, 2, 4*5
	endChannel
.sub
	setLength 2*5
	notedata A_, 1
	notedata A_, 1
	setManual
	endSub
	
Sound2_Ch2::
	duty 3
	setEnvelope 12, 2
	note rs, 0, 8*5
	callChannel .sub
	setEnvelope 12, 5
	note A_, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note A#, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note A_, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 7
	note C#, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note A_, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 7
	note C#, 3, 4*5
	note D_, 3, 8*5
	note D_, 2, 8*5
	note C_, 3, 8*5
	note C_, 2, 8*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note A_, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note A#, 2, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note C_, 3, 4*5
	setEnvelope 12, 2
	callChannel .sub
	setEnvelope 12, 5
	note C#, 3, 4*5
	setEnvelope 2, 15
	note D_, 3, 16*5
	setEnvelope 12, 1
	note D_, 4, 2*5
	endChannel
.sub
	setLength 2*5
	notedata D_, 2
	notedata D_, 2
	setManual
	endSub
	
Sound2_Ch3::
	wave 1, 2
	note rs, 0, 8*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note F#, 3, 4*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note A#, 3, 4*5
	note A_, 3, 8*5
	note D_, 3, 8*5
	note A#, 3, 8*5
	note D_, 3, 8*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note A_, 3, 4*5
	callChannel .sub
	note A#, 3, 4*5
	callChannel .sub
	note A#, 3, 4*5
	note A_, 3, 16*5
	note D_, 3, 1*5
	endChannel
.sub
	setLength 5
	notedata D_, 3
	notedata rs, 0
	notedata D_, 3
	notedata rs, 0
	setManual
	endSub