function scr_player_state_reload() {
	
	// Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = set_iso_direction(point_direction(0, 0, xdir, ydir));	// Sets direction of player
		var _x = lengthdir_x(move_speed, direction);
		var _y = lengthdir_y(move_speed, direction);
		with (obj_boundary_collision) {
			if (check_walkable(x + _x, y + _y)) {	// TODO: Check sprite width for collision too
				other.x += _x;
				other.y += _y;
				set_player_z();
			}
		}
	}
	
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