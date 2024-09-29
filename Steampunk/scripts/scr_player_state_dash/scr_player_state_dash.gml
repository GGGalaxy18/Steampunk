/// Currently player can dash twice within one cooldown window (does not need to be consecutive)
/// Cooldown starts on first dash (second dash does not affect cooldown)
/// Theoretically could time three dashes at once
function scr_player_state_dash() {
	// Start of dash
	if (sprite_index != spr_playerDashTemp) {
		sprite_index = spr_playerDashTemp;
		mask_index = spr_playerDashTemp;
		image_index = 0;
	}
	
	// Set sprite to face left or right
	if hspeed < 0 {
		image_xscale = -1 * abs(image_xscale);
	} else { image_xscale = 1 * abs(image_xscale); }
	
	if !in_dash {
		if (array_length(dash_queue) == 1) {				// Execute dash in queue
			direction = dash_queue[0];
			dash_queue[1] = -1;
			in_dash = true;					// Enforces dash animation time
			alarm[0] = dash_time;			// Dash time (how long dash animation lasts)
			speed = dash_speed;				// Dash speed
		} else if (can_dash and dash and ((xdir != 0) or (ydir != 0))) {	// Execute initial dash
			direction = point_direction(0, 0, xdir, ydir);
			can_dash = false;				// Enforces dash cooldown
			in_dash = true;					// Enforces dash animation time
			alarm[0] = dash_time;			// Dash time (how long dash animation lasts)
			alarm[1] = dash_cooldown;		// Cooldown before dashing again
			speed = dash_speed;				// Dash speed
		} else if (!can_dash and dash and array_length(dash_queue) == 0) {			// Execute second dash (not in queue)
			direction = point_direction(0, 0, xdir, ydir);
			dash_queue = [-1, -1];
			in_dash = true;					// Enforces dash animation time
			alarm[0] = dash_time;			// Dash time (how long dash animation lasts)
			speed = dash_speed;				// Dash speed
		} else {											// Return to free state
			state = PLAYERSTATE.FREE;
			sprite_index = spr_playerIdleTemp;
		}
	} else if (((xdir != 0) or (ydir != 0)) and dash and array_length(dash_queue) == 0) {
		direction = point_direction(0, 0, xdir, ydir);
		dash_queue[0] = direction;
	}
}