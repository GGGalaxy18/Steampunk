/// @description 

if (showing_dialog) {
	var _text_x = 30;
	var _text_y = 18;
	var _height = 32;
	var _border = 5;
	var _padding = 16;
	
	_height = string_height(current_dialog.message);
	
	if (sprite_get_height(current_dialog.sprite) > _height) {
		_height = sprite_get_height(current_dialog.sprite);
	}
	
	_height += _padding * 2;
	_text_x = sprite_get_width(current_dialog.sprite) + (_padding * 2);
	
	draw_set_alpha(alpha);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), _height, false);
	
	draw_set_color(c_white);
	draw_rectangle(_border, _border, display_get_gui_width() - _border, _height - _border, false);
	
	draw_set_color(c_black);
	draw_rectangle((_border*2), (_border*2), display_get_gui_width() - (_border*2), _height - (_border*2), false);
	
	if (current_dialog.sprite != -1) {
		draw_sprite(current_dialog.sprite, 0, _border * 3, _border * 3);
	}
	
	draw_set_color(c_white);
	draw_text_ext(_text_x, _text_y, current_dialog.message, 16, display_get_gui_width() - 192);
	
	alpha = lerp(alpha, 1, 0.06);
}