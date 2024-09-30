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
	
	// Sprite management (W sprites are flipped)
	if (xdir < 0) {						// Facing _____ West
		image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
		if (ydir < 0) {					// Facing North West
			// set NW sprite
		} else if (ydir > 0) {			// Facing South West
			// set SW sprite
			sprite_index = spr_player_se;
		} else {						// Facing West
			// set W sprite
		}
	} else if (xdir > 0) {				// Facing _____ East
		image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
		if (ydir < 0) {					// Facing North East
			// set NE sprite
		} else if (ydir > 0) {			// Facing South East
			// set SE sprite
			sprite_index = spr_player_se;
		} else {						// Facing East
			// set E sprite
		}
	} else {							// Facing North, South, or nowhere
		if (ydir < 0) {					// Facing North
			// set N sprite
			sprite_index = spr_player_n;
		} else if (ydir > 0) {			// Facing South
			// set S sprite
			sprite_index = spr_player_s;
		} else {						// Facing nowhere
			// set idle sprite
		}
	}

	// Dash mechanic
	if dash {
		state = PLAYERSTATE.DASH;
		scr_player_state_dash();
	}
	
	// Melee attack mechanic
	if attack {
		state = PLAYERSTATE.ATTACK_SLASH;
		scr_player_state_attack_slash();
	}
		
}