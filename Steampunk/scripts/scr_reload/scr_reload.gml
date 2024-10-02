function scr_reload() {
	if not alarm_get(5) > 0 {
		alarm[5] = ranged_reload;
		in_reload = true;
		
		// Start of attack
		if (sprite_index != spr_playerReloadTemp) {
			sprite_index = spr_playerReloadTemp;
			image_index = 0;
		}
	
		// Set sprite to face left or right
		if lengthdir_x(1, point_direction(x, y, mouse_x, mouse_y)) < 0 {
			image_xscale = -1 * abs(image_xscale);
		} else { image_xscale = 1 * abs(image_xscale); }
	}
}