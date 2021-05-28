/// @desc Behavior

//Carried or Not
if (!carried)
{
	if (justDroped)
	{
		grv = 1;
		hGridPos = round(x/16);
		x = hGridPos*16;
		if (!dropSoundPlayed)
		{
			var _audio = choose(snd_rock0);
			audio_play_sound(_audio,2,false);
			dropSoundPlayed = true;
		}
		
	} else solid = true;
	vspd += grv;
	if (!place_free(x,y+vspd))
	{
		while (place_free(x,y+sign(vspd)))
		{
			y += sign(vspd);
		}
		vspd = 0
		justDroped = false;
		grv = 0.3
		dropSoundPlayed = false;
		pickupSoundPlayed = false;
		
	}
	y += vspd;
} 
else
{
	if (!pickupSoundPlayed)
	{
		var _audio = choose(snd_rock0);
		audio_play_sound(_audio,2,false);
		pickupSoundPlayed = true;
	}
	solid = false;
	x = obj_Player.x-sprite_width*0.5;
	y = obj_Player.y-sprite_height*0.5;
}