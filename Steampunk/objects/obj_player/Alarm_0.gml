/// @description Dash timer
if (array_length(dash_queue) == 0) {
	move_lock = false;		// Lets player move again
	speed = 0;
	friction = .4;
} else {
	can_dash = false;				// Ensures player can't keep dashing
	speed += dash_speed;			// Dash speed
	move_lock = true;				// Prevents input during dash
	alarm[0] = dash_time;			// Dash time (how long dash animation lasts)
	alarm_set(1, -1);				// Restarts the cooldown
	alarm[1] = dash_cooldown;		// Cooldown before dashing again
	friction = .6;					// Slows player down over time
	
	dash_queue = [];
}