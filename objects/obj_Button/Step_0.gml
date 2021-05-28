#region isMouseOver
if (mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom){
	isMouseOver = true;
} else {
	isMouseOver = false;
}
#endregion

#region Requirments for the button to be Clickable
if (needsVariablesSet){
	buttonClickable = false;
	if (setOfVariablesNeeded == "Frontground Shown") && global.frontgroundShown{
		buttonClickable = true;
	} else if (setOfVariablesNeeded == "Frontground Hiden") && !global.frontgroundShown {
		buttonClickable = true;
	} 
}
#endregion

#region Set of functions
if (buttonClickable) && (isMouseOver && mouse_check_button_released(mb_left)){
	if (buttonFunction == "Go To Room"){
		room_goto(roomToGo);
		audio_play_sound(snd_btn, 1, false);
		
	} else if (buttonFunction == "Go To Next Room"){
		room_goto_next();
		audio_play_sound(snd_btn, 1, false);
		
	} else if (buttonFunction == "Restart Game"){
		audio_play_sound(snd_btn, 1, false);
		game_restart();
		
	} else if (buttonFunction == "Quit Game"){
		game_end();
	
	} else if (buttonFunction == "Show Controls"){
		global.frontgroundShown = true;
		layer_set_visible("Frontground", true);
		layer_set_visible("FrontgroundBtn", true);
		audio_play_sound(snd_btn, 1, false);
		
	}else if (buttonFunction == "Hide Controls"){
		global.frontgroundShown = false;
		layer_set_visible("Frontground", false);
		layer_set_visible("FrontgroundBtn", false);
		audio_play_sound(snd_btn, 1, false);
	}
}
#endregion
	  
	 
	 
#region Extra commands  
	#region Fade out
	/*
	  else if (buttonFunction == "Start Game"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			obj_Button.startDisappearing = true;
		}
	} 

	if (startDisappearing){
		drawAlpha -= 0.016;
		buttonClickable = false;
		if (drawAlpha <= 0){
			drawAlpha = 0;
		}
		draw_set_alpha(drawAlpha);
		if (drawAlpha == 0){
			startDisappearing = false;
			alarm[0] = room_speed;
		}
	} 
	*/
	#endregion
#endregion