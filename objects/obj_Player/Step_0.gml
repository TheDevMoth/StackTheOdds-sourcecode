/// @desc Control and Collisions

btn_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
btn_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
btn_jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
btn_act = keyboard_check_pressed(vk_space);

var moveDi = btn_right - btn_left;

if (carringOdd && mask_index != spr_playerStill_wOdd)
{
	if (!place_free(x+2,y)){
		while(!place_free(x+2,y))
		{
			x -= 1;
		}
	}
	if (!place_free(x-2,y))
	{
		while(!place_free(x-2,y))
		{
			x += 1;
		}
	}
	mask_index = spr_playerStill_wOdd;
} else if (!carringOdd)  mask_index = spr_playerStill;

if (carringOdd)
{	
	wMulti = 0.8
	var _objName = object_get_name(carriedOddId.object_index);
	if (_objName == "obj_rock")
	{
		jMulti = 0.9;
	}
} else 
{
	wMulti = 1; 
	jMulti = 1;
}

hspd = movespd*moveDi*wMulti;
if (vspd < 0) vspd += grv else vspd += grv*0.75

//Jumping
if (!place_free(x,y+1) && (btn_jump)) || afterDrop
{
	vspd = -jumpspd*jMulti;
	if (!afterDrop) audio_play_sound(snd_jump, 1, false);
	afterDrop = false;
	
}

//Horozontal Movement
if(!place_free(x+hspd,y))
{
	while(place_free(x+sign(hspd),y))
	{
		x += sign(hspd);
	}
	hspd = 0
}

x += hspd

//Vertical Movment
if(!place_free(x,y+vspd))
{
	while(place_free(x,y+sign(vspd)))
	{
		y += sign(vspd);
	}
	vspd = 0
}

y += vspd

//Animation
if (place_free(x,y+1))
{
	sprite_index = spr_playerAir;
	image_speed = 0;
	if (vspd < 0) 
	{
		image_index = 0;
	} else {
		image_speed = 1;
		if (Animation_end(sprite_index,image_index))
		{
			image_speed = 0;
		}
	}
	
} else if (hspd != 0){
	image_speed = 1;
	sprite_index = spr_playerWalk;
} else {
	image_speed = 1;
	sprite_index = spr_playerStill;
}

if (hspd != 0)
{
	sideFaced = sign(hspd);
	image_xscale = sideFaced;
}

//Holding Odds
if (position_meeting(x+sprite_width,y-0.25*sprite_height,objP_odds))
{
	oddClose = true;
	oddPos = -1;
	objType = objP_odds;
} 
else if (position_meeting(x+sprite_width,y-0.25*sprite_height,obj_rock))
{
	oddClose = true;
	oddPos = -1;
	objType = obj_rock;
}
else if (position_meeting(x+sprite_width,y+0.25*sprite_height,objP_odds))
{
	oddClose = true;
	oddPos = 1
	objType = objP_odds;
} 
else if (position_meeting(x+sprite_width,y+0.25*sprite_height,obj_rock))
{
	oddClose = true;
	oddPos = 1;
	objType = obj_rock;
}
else oddClose = false;


if (!global.gameWon && btn_act && oddClose && !carringOdd)
{
	carringOdd = true;
	carriedOddId = instance_position(x+sprite_width,y+0.25*sprite_height*oddPos, objType);
	with(carriedOddId)
	{
		carried = true;
	}
}
else if (btn_act && carringOdd && place_free(x,y-16))
{
	y -= 8;
	with(carriedOddId)
	{
		carried = false;
		justDroped = true;
	}
	carringOdd = false;
	afterDrop = true;
	audio_play_sound(snd_drop, 1, false);
}

