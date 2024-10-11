function get_new_direction() {
	return directions[irandom(array_length(directions) - 1)];
}

function scr_enemy_state_searching() {
	// Movement management
	
	if (alarm_get(1) < 0) change_idle_roam = true;
	// Switch between idle and roaming
	if change_idle_roam {
		alarm[1] = irandom_range(60, 150);
		change_idle_roam = false;
		if speed = 0 {		// is in idle mode
			direction = get_new_direction();
			speed = roam_speed;
		} else {			// is in roam mode
			var rng = irandom(5);
			if rng < 4 {
				direction = get_new_direction();
			} else { speed = 0; }
		}
	}
	
	// Changes direction
	if (not check_walkable(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction))) {
		do {
			direction = get_new_direction();
		} until check_walkable(x +  lengthdir_x(speed, direction), y + lengthdir_y(speed, direction));
	}
	
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
	
	// Pursuit
	if point_distance(x, y, obj_player.x, obj_player.y) < 128 {
		state = ENEMYSTATE.PURSUIT;
		scr_enemy_state_pursuit();
	}
	/*
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
	*/
}