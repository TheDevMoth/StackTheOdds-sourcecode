/// @desc 
if (global.frontgroundShown && room = rm_start)
{
	draw_set_font(fnt_onScreen_sm);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(room_width/16, room_height/6, "LEFT & RIGH ARROWS / A&D TO MOVE.\nUP ARROW / W TO JUMP.\nSPACE TO PICK & DROP ODDS.\nR TO RESTART THE ROOM", 15, 9999);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
}