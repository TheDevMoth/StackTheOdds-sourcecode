draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(txtFont);

if (mouse_check_button(mb_left) && isMouseOver && buttonClickable){
	draw_sprite_ext(sprite, 2+buttonColorMulti, x, y, 2, 2 , 0, c_white, 1);
} else if (isMouseOver && buttonClickable) {
	draw_sprite_ext(sprite, 1+buttonColorMulti, x, y, 2, 2 , 0, c_white, 1);
} else {
	draw_sprite_ext(sprite, 0+buttonColorMulti, x, y, 2, 2 , 0, c_white, 1);	
}

draw_set_color(txtColor);
draw_text(x, y, txtString);


