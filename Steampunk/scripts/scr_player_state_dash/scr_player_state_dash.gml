function scr_player_state_dash(){
	if can_dash {
		if ((xdir != 0) or (ydir != 0)) {	// Ensures player can't dash when sitting still
			can_dash = false;				// Ensures player can't keep dashing
			speed += dash_speed;			// Dash speed
			move_lock = true;				// Prevents input during dash
			alarm[0] = dash_time;			// Dash time (how long dash animation lasts)
			alarm[1] = dash_cooldown;		// Cooldown before dashing again
			friction = .6;					// Slows player down over time
		}
	} else if (array_length(dash_queue) == 0) {
		dash_queue[0] = direction;
	}
}