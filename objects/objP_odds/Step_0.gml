/// @desc Behavior

//Carried or Not
if (!carried)
{
	if (justDroped)
	{
		grv = 1;
		hGridPos = round(x/16);
		x = hGridPos*16;
		//if (sprite_index == spr_greenOdd && !pickupSoundPlayed)
		//{
		//	var _audio = choose(snd_dWehow,snd_dWrongPlace);
		//	audio_play_sound(_audio,2,false);
		//	pickupSoundPlayed = true;
		//} else if (sprite_index == spr_redOdd && !pickupSoundPlayed)
		//{
		//	var _audio = choose(snd_hWoh,snd_hWehow,snd_hWrongPlace);
		//	audio_play_sound(_audio,2,false);
		//	pickupSoundPlayed = true;
		//}
		
	} else solid = true;
	vspd += grv;
	if (!place_free(x,y+vspd) || place_meeting(x,y+vspd, obj_oddStand))
	{
		while(place_free(x,y+sign(vspd)) && !place_meeting(x,y+sign(vspd),obj_oddStand))
		{
			y += sign(vspd);
		}
		vspd = 0
		justDroped = false;
		grv = 0.3
		
		//Check for win
		if (position_meeting(x, y+sprite_height*1.1,objP_odds) && position_meeting(x, y+sprite_height*2.5,objP_odds) && !global.gameWon)
		{
			global.gameWon = true;
			audio_play_sound(snd_win, 1, false);
		}
		
	}
	y += vspd;
} 
else
{
	solid = false;
	x = obj_Player.x-sprite_width*0.5;
	y = obj_Player.y-sprite_height*0.5;
}


if ((position_meeting(x+sprite_width*0.5, y+sprite_height*1.5,obj_oddStand) || global.gameWon == true) && !carried)
{
	image_index = 0;
}
else if (carried)
{
	image_index = 2;
}
else
{
	image_index = 1;
}