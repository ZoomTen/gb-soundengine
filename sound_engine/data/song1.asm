; Example song 2: Super Pitfall - Main Theme (PC-88 + FC version)

Sound1_Ch1::
	stereo 15, 15
	setEnvelope 11, 3
	finepitch 2
	duty 1
.intro
	setLength (2 * 6)-1
	notedata C#, 3
	notedata C#, 3
	notedata C#, 3
	setLength (4 * 6)-1
	notedata C#, 3
	notedata C#, 3
	notedata D#, 3
	notedata D#, 3
	setLength (2 * 6)-1
	notedata D#, 3
	notedata C_, 3
	notedata D#, 3
	notedata C_, 3
	notedata D#, 3
	notedata C#, 3
	notedata C#, 3
	notedata C#, 3
	setLength (4 * 6)-1
	notedata C#, 3
	notedata C#, 3
	notedata D#, 3
	notedata D#, 3
	setLength (2 * 6)-1
	notedata D#, 3
	setManual
	note C_, 3, 6-1
	note rs, 0, (5 * 6)-1
.loop
	callChannel .sub0
	note C#, 3, (6 * 6)-1
	callChannel .sub1
	transpose 1
	callChannel .sub1
	transpose 0
	note rs, 0, (4 * 6)-1
	setLength (2 * 6)-1
	notedata G#, 3
	notedata G#, 3
	notedata G#, 3
	callChannel .sub0
	note C#, 3, (4 * 6)-1
	note C#, 3, (6 * 6)-1
	note G#, 2, (2 * 6)-1
	note A#, 2, (4 * 6)-1
	setLength (2 * 6)-1
	notedata C#, 3
	notedata C#, 3
	notedata C#, 3
	setManual
	note C#, 3, (10 * 6)-1
	loopChannel .loop

.sub0
	setLength (4 * 6)-1
	notedata rs, 0
	notedata C#, 3
	notedata G#, 2
	notedata F#, 2
	setLength (2 * 6)-1
	notedata F_, 2
	notedata F_, 2
	notedata F_, 2
	setManual
	note F_, 2, (10 * 6)-1
	endSub
.sub1
	setLength 6-1
	notedata C_, 3
	notedata C#, 3
	setManual
	note D_, 3, (6 * 6)-1
	endSub
	
Sound1_Ch2::
	setEnvelope 14, 5
	duty	3
.intro
	setLength (2 * 6)-1
	notedata F_, 3
	notedata F_, 3
	notedata F_, 3
	setLength (4 * 6)-1
	notedata G#, 3
	notedata F_, 3
	notedata F#, 3
	notedata F#, 3
	setLength (2 * 6)-1
	notedata G_, 3
	notedata G#, 3
	notedata F#, 3
	notedata G#, 3
	notedata G_, 3
	notedata F_, 3
	notedata F_, 3
	notedata F_, 3
	setLength (4 * 6)-1
	notedata G#, 3
	notedata F_, 3
	notedata F#, 3
	notedata F#, 3
	setLength (2 * 6)-1
	notedata F#, 3
	setManual
	note D#, 3, 6-1
	note rs, 0, 6-1
	note G#, 3, (2 * 6)-1
	note G#, 2, (2 * 6)-1
.loop
	callChannel .sub
	note F#, 3, (6 * 6)-1
	setLength 6-1
	notedata F_, 3
	notedata F#, 3
	setManual
	note G_, 3, (10 * 6)-1
	setLength (6 * 2)-1
	notedata G#, 3
	notedata D#, 3
	notedata C_, 3
	setManual
	note G#, 2, (8 * 6)-1
	callChannel .sub
	note F#, 3, (4 * 6)-1
	setLength (6 * 2)-1
	notedata A#, 2
	notedata B_, 2
	notedata C_, 3
	setManual
	note D#, 3, (6 * 6)-1
	note F_, 3, (16 * 6)-1
	loopChannel .loop
.sub
	note F_, 3, (10 * 6)-1
	setLength (6 * 2)-1
	notedata E_, 3
	notedata F_, 3
	notedata G#, 3
	setManual
	note C#, 3, (16 * 6)-1
	endSub
	
Sound1_Ch3::
.intro
	wave 1, 7
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note G#, 2, (3 * 6)-1
	note rs, 0, 6-1
	note C#, 3, (3 * 6)-1
	note rs, 0, 6-1
	note D#, 3, (3 * 6)-1
	note rs, 0, 6-1
	note D#, 3, (3 * 6)-1
	note rs, 0, 6-1
	setLength (2 * 6)-1
	notedata D#, 3
	notedata C_, 3
	notedata D#, 3
	notedata C_, 3
	notedata D#, 3
	setManual
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note G#, 2, (3 * 6)-1
	note rs, 0, 6-1
	note C#, 3, (3 * 6)-1
	note rs, 0, 6-1
	note D#, 3, (3 * 6)-1
	note rs, 0, 6-1
	note D#, 3, (3 * 6)-1
	note rs, 0, 6-1
	setLength (2 * 6)-1
	notedata D#, 3
	setManual
	note C_, 3, 6-1
	note rs, 0, (5 * 6)-1
.loop
	wave 1, 7
	note C#, 3, (2 * 6)-1
	note rs, 0, (4 * 6)-1
	setLength (2 * 6)-1
	notedata C#, 3
	notedata rs, 0
	notedata G#, 2
	notedata A#, 2
	notedata C#, 3
	setManual
	note rs, 0, (4 * 6)-1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note G#, 2, (4 * 6)-1
	setLength (2 * 6)-1
	notedata rs, 0
	notedata F#, 2
	notedata A#, 2
	notedata rs, 0
	notedata F#, 2
	notedata G_, 2
	notedata B_, 2
	notedata rs, 0
	notedata G_, 2
	notedata G#, 2
	notedata C_, 3
	notedata rs, 0
	notedata C_, 3
	notedata rs, 0
	notedata D#, 3
	notedata G#, 2
	notedata rs, 0
	setManual
	
	note C#, 3, (2 * 6)-1
	note rs, 0, (4 * 6)-1
	setLength (2 * 6)-1
	notedata C#, 3
	notedata rs, 0
	notedata G#, 2
	notedata A#, 2
	notedata C#, 3
	setManual
	note rs, 0, (4 * 6)-1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note C#, 3, 6 + 4 - 1
	note rs, 0, 6 - 4 - 1
	note G#, 2, (4 * 6)-1
	setLength (2 * 6)-1
	notedata rs, 0
	notedata F#, 2
	notedata A#, 2
	notedata rs, 0
	notedata F#, 2
	notedata G_, 2
	notedata B_, 2
	notedata rs, 0
	notedata G_, 2
	notedata C#, 3
	notedata G#, 2
	notedata C_, 3
	setManual
	note C#, 3, (4 * 6)-1
	note rs, 0, (6 * 6)-1
	loopChannel .loop
	
Sound1_Ch4::
	rest (16 * 6)-1
	rest (16 * 6)-1
	rest (16 * 6)-1
	rest (14 * 6)-1
.loop
	setEnvelope 9, 1
	setLength (4 * 6)-1
	noisedata $20
	setLength (2 * 6)-1
	reptnote
	setLength (4 * 6)-1
	reptnote
	setEnvelope 8, 1
	setLength (2 * 6)-1
	reptnote
	reptnote
	reptnote
	setLength (4 * 6)-1
	reptnote
	setLength (2 * 6)-1
	reptnote
	reptnote
	reptnote
	setEnvelope 10,3
	noisedata $21
	setManual
	setEnvelope 12, 1
	noise $24, 6-1
	setEnvelope 11, 1
	noise $24, (3 * 6)-1

	setEnvelope 9, 1
	setLength (4 * 6)-1
	noisedata $20
	setEnvelope 8, 1
	setLength (2 * 6)-1
	reptnote
	setLength (6 * 6)-1
	reptnote
	setLength (2 * 6)-1
	reptnote
	reptnote
	reptnote
	reptnote
	reptnote
	reptnote
	setEnvelope 9, 1
	noisedata $21
	setEnvelope 8, 1
	reptnote
	setManual
	noise $21, (4* 6)-1
	
	setEnvelope 9, 1
	setLength (4 * 6)-1
	noisedata $20
	setLength (2 * 6)-1
	reptnote
	setLength (4 * 6)-1
	reptnote
	setEnvelope 8, 1
	setLength (2 * 6)-1
	reptnote
	reptnote
	reptnote
	setLength (4 * 6)-1
	reptnote
	setLength (2 * 6)-1
	reptnote
	reptnote
	reptnote
	setEnvelope 10, 3
	noisedata $21
	setManual
	setEnvelope 12, 1
	noise $24, 6-1
	setEnvelope 11, 1
	noise $24, (3 * 6)-1
	
	setManual
	setEnvelope 8, 1
	noise $20, (4 * 6)-1
	setEnvelope 9, 1
	noise $20, (2 * 6)-1
	noise $20, (6 * 6)-1
	setEnvelope 8, 1
	noise $20, (2 * 6)-1
	noise $20, (2 * 6)-1
	noise $20, (2 * 6)-1
	noise $20, (4 * 6)-1
	noise $20, (2 * 6)-1
	noise $21, (2 * 6)-1
	noise $21, (2 * 6)-1
	noise $21, (4 * 6)-1
	loopChannel .loop