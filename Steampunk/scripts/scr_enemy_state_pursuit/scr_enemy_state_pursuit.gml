function scr_enemy_state_pursuit() {
	var _orig_x = x;
	var _orig_y = y;
	if (point_distance(obj_player.x, obj_player.y, x, y) > 20) {
		speed = 0;
		with (col_id) {
			mp_potential_step_object(obj_player.x, obj_player.y, other.chase_speed, obj_boundary);
			speed = 0;
			other.x = x;
			other.y = y;
		}
	}
	
	direction = point_direction(_orig_x, _orig_y, x, y);
	xdir = lengthdir_x(1, direction);
	ydir = lengthdir_y(1, direction);
	
	if (xdir == 0) and (ydir == 0) and sprite_index != spr_enemyTemp {
		sprite_index = spr_enemyTemp;
	}
		
	// Sprite management (W sprites are flipped)
	if (xdir < 0) {						// Facing _____ West
		image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
		if (ydir < 0) {					// Facing North West
			// set NW sprite
		} else if (ydir > 0) {			// Facing South West
			// set SW sprite
		} else {						// Facing West
			// set W sprite
		}
	} else if (xdir > 0) {				// Facing _____ East
		image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
		if (ydir < 0) {					// Facing North East
			// set NE sprite
		} else if (ydir > 0) {			// Facing South East
			// set SE sprite
		} else {						// Facing East
			// set E sprite
		}
	} else {							// Facing North, South, or nowhere
		if (ydir < 0) {					// Facing North
			// set N sprite
		} else if (ydir > 0) {			// Facing South
			// set S sprite
		} else {						// Facing nowhere
			// set idle sprite
		}
	}
	
	// Load other states
	
	// Searching
	if point_distance(x, y, obj_player.x, obj_player.y) > 384 {
		state = ENEMYSTATE.SEARCHING;
		scr_enemy_state_searching();
	}
	
	// Dash mechanic
	if point_distance(x, y, obj_player.x, obj_player.y) < 64 {
		state = ENEMYSTATE.ATTACK;
		scr_enemy_state_attack();
	}
	/*
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
	*/
}