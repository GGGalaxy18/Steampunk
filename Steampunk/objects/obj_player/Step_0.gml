// Ensures movement in 8 directions at a set speed (diagonal is not faster)
xdir = keyboard_check(vk_right) - keyboard_check(vk_left)
ydir = keyboard_check(vk_down) - keyboard_check(vk_up)
if !move_lock and ((xdir != 0) or (ydir != 0)) {
	direction = point_direction(0, 0, xdir, ydir);
	speed += 1;
}

// Keeps player within room at set speeds (excluding dash)
x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height/2, room_height-sprite_height/2);
if !move_lock speed = clamp(speed, -max_speed, max_speed);

// Dash mechanic
//if keyboard_check_released(vk_space) and !move_lock can_dash = true;

if keyboard_check(vk_space) and can_dash {
	if speed {
		can_dash = false;			// Ensures player can't keep dashing
		speed += dash_speed;		// Dash speed
		move_lock = true;			// Prevents input during dash
		alarm[0] = dash_time;		// Dash time
		alarm[1] = dash_cooldown;	// Cooldown before dashing again
		friction = .5;				// Slows player down over time
	}
}
