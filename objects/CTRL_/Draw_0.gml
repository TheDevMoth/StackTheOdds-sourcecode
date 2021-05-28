/// @desc Drawing text on screen
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_onScreen);
draw_set_color(c_white);

switch(room)
{
	case rm_start:
		draw_set_font(fnt_title);
		draw_text(room_width/2, room_height/10, "STACK THE ODDS");
		draw_set_font(fnt_onScreen);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text_transformed(4, room_height-3, "GAME BY MOHAMMED ABUSHAWARIB", 0.5, 0.5, 0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
	break;
	
	case rm_level1:
		if (!timerOver0)
		{
			draw_text(room_width/2, room_height/8, "THESE ARE THE ODDS");
			
		} else if (global.gameWon){
			draw_text(room_width/2, room_height/8, "OK NOW TRY TO JUMP OVER THEM");
			if (timerOver1 || wait(3))
			{
				draw_text(room_width/2, room_height/8+15, "YOU CAN'T TOGETHER THEY ARE ");
				draw_text_transformed(room_width/2, room_height/8+40, "INSURMOUNTABLE", 1.5, 1.5, 0);
				timerOver1 = true;
				if (wait(8))
				{
					global.gameWon = false;
					room_goto(rm_level2);
				}
			}
		} else {
			draw_text(room_width/2, room_height/8, "TRY AND STACK THEM (SPACE)");
		}
	break;
	
	case rm_level2:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/8, "LET'S SEE IF YOU'VE GOT IT");
		} else {
			draw_text(room_width/2, room_height/8, "YOU DO GOT IT, THAT'S HOT");
			if (timerOver2 || wait(6)){
				draw_text(room_width/2, room_height/8, "\n\nJUST LIKE YOUR MAMA");
				timerOver2 = true;
				if (wait(1.3))
				{
					global.gameWon = false;
					room_goto(rm_level3);
				}
			}
		}
	break;
	
	case rm_level3:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/8, "SHOW ME DAT DOUBLE JUMP");
		} else {
			draw_text(room_width/2, room_height/3, "THE ELIETS DON'T WANT YOU TO KNOW THIS\n\nBUT THERE IS A TRIPLE JUMP");
			if (wait(10))
			{
				global.gameWon = false;
				room_goto(rm_level4);
			}
		}
	break;
	
	case rm_level4:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/8, "OK THIS IS THE FIRST REAL PUZZLE\nIF WE CAN CALL IT THAT");
		} else {
			draw_text(room_width/2, room_height/3, "SEE I WOULDN'T EVEN CALL IT A PUZZLE");
			if (wait(6))
			{
				global.gameWon = false;
				room_goto(rm_level5);
			}
		}
	break;
		
	case rm_level5:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/10, "OK I MADE IT A BIT HARDER, TRY IT NOW");
			if (timerOver5 || wait(30))
			{
				draw_text(room_width/2, room_height/10, "\n\nTHAT IS WHAT SHE SAID!");
				timerOver5 = true;
			}
		} else {
			draw_text(room_width/2, room_height/8, "YOU WON! I DID NOT EXPECT IT TO BE THIS EASY");
			if (timerOver3 || wait(6)){
				draw_text(room_width/2, room_height/8, "\n\nESPECIALLY FOR YOU");
				timerOver3 = true;
				if (wait(2))
				{
					global.gameWon = false;
					room_goto(rm_level6);
				}
			}
		}
	break;
	
	case rm_level6:
		if (!global.gameWon)
		{
			draw_text_transformed(room_width/2, room_height/8-4, "REMEMBER YOU CAN RESTART THE ROOM.\nI BET YOU'RE THINKING\n\"I SHOULD'VE READ THE CONTROLS\"", 0.7, 0.7, 0);
		} else {
			draw_text(room_width/2, room_height/8, "OK THAT WAS PRETTY FUN");
			if (wait(6))
			{
				global.gameWon = false;
				room_goto(rm_level7);
			}
		}
	break;
	
	case rm_level7:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/8, "LET'S DO IT AGAIN!");
		} else {
			draw_text(room_width/2, room_height/8, "WOOOOO! NINJA! AGAIN!");
			if (timerOver4 || wait(3)){
				draw_text(room_width/2, room_height/2, "\n\nNAH JUST KIDDING...");
				timerOver4 = true;
				if (wait(15))
				{
					global.gameWon = false;
					room_goto(rm_level8);
				}
			}
		}
	break;
	
	case rm_level8:
		if (!global.gameWon)
		{
			draw_text(room_width/2, room_height/8, "ALRIGHT, BACK TO PUZZLES");
		} else {
			draw_text(room_width/2, room_height/3, "AM I THAT BAD AT MAKING PUZZLES?");
			if (wait(5))
			{
				global.gameWon = false;
				room_goto(rm_level9);
			}
		}
	break;
	
	case room0:
		if (global.gameWon)
		{
			draw_text(room_width*0.5, room_height*0.5,"YEET!");
		}
	break;
}


//if (!global.gameWon)
//		{
//			draw_text(room_width/2, room_height/8, "");
//		} else {
//			draw_text(room_width/2, room_height/3, "");
//			if (wait())
//			{
//				global.gameWon = false;
//				room_goto(rm_level);
//			}
//		}