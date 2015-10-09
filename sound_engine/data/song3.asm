; Example song 4: Test 1

Sound3_Ch1:
	setSpeed 6
	duty 0
	setEnvelope 9, 4
	setLength 1
.loop
	notedata C_, 2
	notedata C_, 3
	notedata D#, 2
	notedata C_, 3
	notedata G_, 2
	notedata C_, 3
	notedata D#, 2
	notedata C_, 3
	loopChannel .loop
Sound3_Ch2:
	endChannel
Sound3_Ch3:
	setSpeed 6
	wave 1, 8
	setLength 1
.loop
	notedata C_, 2
	halfvol2
	loopChannel .loop