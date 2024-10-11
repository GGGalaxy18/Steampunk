function scr_enemy_state_attack() {
	direction = set_iso_direction_clamped(point_direction(x, y, obj_player.x, obj_player.y));
	
	if can_attack {
		var _y_offset = sprite_get_yoffset(sprite_index)
		sprite_set_offset(sprite_index, sprite_get_xoffset(sprite_index), sprite_height/2);
		attack_struct = { parent_enemy: id, new_image_angle: direction };
		instance_create_depth(x, y, 4, obj_enemy_slash, attack_struct);
		sprite_set_offset(sprite_index, sprite_get_xoffset(sprite_index), _y_offset);
		image_index = 0;
		can_attack = false;
		alarm[4] = attack_cooldown;
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
	
	// Searching
	if point_distance(x, y, obj_player.x, obj_player.y) > attack_range {
		state = ENEMYSTATE.SEARCHING;
		scr_enemy_state_searching();
	}
}