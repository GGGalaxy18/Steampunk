function scr_player_state_free(){
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir, ydir);	// Sets direction of player
		x += lengthdir_x(move_speed, direction);
		y += lengthdir_y(move_speed, direction);
	
		// Set sprite to face left or right
		if xdir < 0 {
			image_xscale = -1 * abs(image_xscale);
		} else { image_xscale = 1 * abs(image_xscale); }
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