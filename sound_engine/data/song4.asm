; Example song 5: Test 2

Sound4_Ch1:
	stereo 15, 15
	duty 3
	setEnvelope 11, 2
.loop
	setSpeed 5
	setLength 2
	notedata D#, 2
	notedata D#, 2
	notedata D_, 2
	notedata D_, 2
	notedata C#, 2
	notedata C#, 2
	notedata D_, 2
	notedata D_, 2
	setLength 1
	notedata D#, 3
	notedata D#, 3
	notedata D_, 3
	notedata D_, 3
	notedata C#, 3
	notedata C#, 3
	notedata D_, 3
	notedata D_, 3
	loopChannel .loop
	
Sound4_Ch2:
	stereo 15, 15
	duty 3
	setEnvelope 11, 2
	finepitch -1
.loop
	setSpeed 5
	setLength 1
	notedata D#, 2
	loopChannel .loop