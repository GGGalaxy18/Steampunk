function scr_player_state_free(){
	
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
	
	// Idle sprite management (W sprites are flipped)
	if (xdir == 0) and (ydir == 0) {
		if (xdir < 0) {						// Facing _____ West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
			if (ydir < 0) {					// Facing North West
				// set NE sprite
				sprite_index = spr_player_ne;
			} else if (ydir > 0) {			// Facing South West
				// set SW sprite
				sprite_index = spr_player_se;
			} else {						// Facing West
				// set E sprite
				sprite_index = spr_player_e;
			}
		} else if (xdir > 0) {				// Facing _____ East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
			if (ydir < 0) {					// Facing North East
				// set NE sprite
				sprite_index = spr_player_ne;
			} else if (ydir > 0) {			// Facing South East
				// set SE sprite
				sprite_index = spr_player_se;
			} else {						// Facing East
				// set E sprite
				sprite_index = spr_player_e;
			}
		} else {							// Facing North, South, or nowhere
			if (ydir < 0) {					// Facing North
				// set N sprite
				sprite_index = spr_player_n;
			} else if (ydir > 0) {			// Facing South
				// set S sprite
				sprite_index = spr_player_idle_s;
			} else {						// Facing nowhere (shouldn't be reached)
				// set idle sprite
				sprite_index = spr_player_idle_s;
			}
		}
	} else {	// Walking sprite management (W sprites are flipped)
		if (xdir < 0) {						// Facing _____ West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
			if (ydir < 0) {					// Facing North West
				// set NE sprite
				sprite_index = spr_player_walk_ne;
			} else if (ydir > 0) {			// Facing South West
				// set SE sprite
				sprite_index = spr_player_walk_se;
			} else {						// Facing West
				// set E sprite
				sprite_index = spr_player_walk_e;
			}
		} else if (xdir > 0) {				// Facing _____ East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
			if (ydir < 0) {					// Facing North East
				// set NE sprite
				sprite_index = spr_player_walk_ne;
			} else if (ydir > 0) {			// Facing South East
				// set SE sprite
				sprite_index = spr_player_walk_se;
			} else {						// Facing East
				// set E sprite
				sprite_index = spr_player_walk_e;
			}
		} else {							// Facing North, South, or nowhere
			if (ydir < 0) {					// Facing North
				// set N sprite
				sprite_index = spr_player_walk_n;
			} else if (ydir > 0) {			// Facing South
				// set S sprite
				sprite_index = spr_player_walk_s;
			}
		}
	}
	
	// Heal
	if keyboard_check(ord("H")) {
		heal_timer++;
		if heal_timer == 30 and num_scrap >= 10 {
			hp = hp_max;
			var _scrap_struct = { num_scrap : 10 }
			instance_create_depth(x, y, 4, obj_scrap_remove, _scrap_struct);
			num_scrap -= 10;
		}
	} else heal_timer = 0;
	
	// Reload
	if reload and current_magazine < max_magazine and num_scrap > 0 {
		state = PLAYERSTATE.RELOAD;
		scr_player_state_reload();
	}
	
	// Dash mechanic
	if dash {
		state = PLAYERSTATE.DASH;
		scr_player_state_dash();
	}
	
	// Melee attack mechanic
	if melee_attack {
		state = PLAYERSTATE.ATTACK_SLASH;
		scr_player_state_attack_slash();
	}
	
	// Shooting attack mechanic
	if ranged_attack {
		state = PLAYERSTATE.ATTACK_SHOOT;
		scr_player_state_attack_shoot();
	}
}