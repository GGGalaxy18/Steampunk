/// Currently player can dash twice within one cooldown window (does not need to be consecutive)
/// Cooldown starts on first dash (second dash does not affect cooldown)
/// Theoretically could time three dashes at once
function scr_player_state_dash() {
	// Projected dash distance
	var _max_dash_distance = (dash_time * dash_speed)
	var _actual_dash_time = dash_time;
	
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
			var _estimated_dash_distance = check_dash_obstacle(_max_dash_distance, dash_speed, direction);
			_actual_dash_time = new_dash_time(_estimated_dash_distance);		// Adjusts dash time according to dash distance
			if (_estimated_dash_distance > 0) {
				dash_queue[1] = -1;
				in_dash = true;					// Enforces dash animation time
				alarm[0] = _actual_dash_time;			// Dash time (how long dash animation lasts)
				speed = dash_speed;				// Dash speed
				audio_play_sound(snd_dash,10,false)	
			}
		} else if (can_dash and dash and ((xdir != 0) or (ydir != 0))) {	// Execute initial dash
			direction = set_iso_direction(point_direction(0, 0, xdir, ydir));
			var _estimated_dash_distance = check_dash_obstacle(_max_dash_distance, dash_speed, direction);
			_actual_dash_time = new_dash_time(_estimated_dash_distance);		// Adjusts dash time according to dash distance
			if (_estimated_dash_distance > 0) {
				can_dash = false;				// Enforces dash cooldown
				in_dash = true;					// Enforces dash animation time
				alarm[0] = _actual_dash_time;			// Dash time (how long dash animation lasts)
				alarm[1] = dash_cooldown;		// Cooldown before dashing again
				speed = dash_speed;				// Dash speed
				audio_play_sound(snd_dash,10,false)	
			}
		} else if (!can_dash and dash and array_length(dash_queue) == 0) {			// Execute second dash (not in queue)
			direction = set_iso_direction(point_direction(0, 0, xdir, ydir));
			var _estimated_dash_distance = check_dash_obstacle(_max_dash_distance, dash_speed, direction);
			_actual_dash_time = new_dash_time(_estimated_dash_distance);		// Adjusts dash time according to dash distance
			if (_estimated_dash_distance > 0) {
				dash_queue = [-1, -1];
				in_dash = true;					// Enforces dash animation time
				alarm[0] = _actual_dash_time;			// Dash time (how long dash animation lasts)
				speed = dash_speed;				// Dash speed
				audio_play_sound(snd_dash,10,false)	
			}
		} else {											// Return to free state
			state = PLAYERSTATE.FREE;
			sprite_index = spr_player_idle_s;
		}
	} else if (((xdir != 0) or (ydir != 0)) and dash and array_length(dash_queue) == 0) {
		direction = set_iso_direction(point_direction(0, 0, xdir, ydir));
		dash_queue[0] = direction;
	}
}