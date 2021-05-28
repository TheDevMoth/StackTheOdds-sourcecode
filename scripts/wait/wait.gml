/// @func wait(seconds)
/// @param {real} seconds
function wait() {

	var _time = 1000*argument[0]
	if (!global.waitTimerStarted)
	{
		time = current_time;
		global.waitTimerStarted = true;
		return false;
	}

	if (current_time >= time+_time)
	{
		global.waitTimerStarted = false;
		return true;
	} else return false;


}
