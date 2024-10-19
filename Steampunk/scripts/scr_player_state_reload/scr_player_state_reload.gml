function scr_player_state_reload() {
	show_debug_message("in reload state");
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
		
	// Start of reload
	if (sprite_index != spr_playerReloadTemp) {
		sprite_index = spr_playerReloadTemp;
		image_index = 0;
	}
	
	// Set sprite to face left or right
	if lengthdir_x(1, point_direction(x, y, mouse_x, mouse_y)) < 0 {
		image_xscale = -1 * abs(image_xscale);
	} else { image_xscale = 1 * abs(image_xscale); }
	
	if not alarm_get(5) > 0 {
		alarm[5] = ranged_reload;
		in_reload = true;
		var _scrap_struct = { num_scrap : 1 }
		instance_create_depth(x, y, 4, obj_scrap_remove, _scrap_struct);
		obj_player.num_scrap--;
		audio_play_sound(snd_reload,10,false)
	}
}