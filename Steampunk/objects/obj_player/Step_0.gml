/// @description movement and dash implementation
// Inpute definitions
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _dash = keyboard_check(vk_space);
var _attack = mouse_check_button(mb_left);
// Ensures movement in 8 directions at a set speed (diagonal is not faster)
xdir = _right - _left;
ydir = _down - _up;

if move_lock {
	if (array_length(dash_queue) == 0) {
		direction = point_direction(0, 0, xdir, ydir);	// Sets direction of queued dash
	}
} else {
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir, ydir);	// Sets direction of player
		x += lengthdir_x(move_speed, direction);
		y += lengthdir_y(move_speed, direction);
	}

	// Dash mechanic
	if _dash {
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
	
	// Attack mechanic
	// TODO
}

// Keeps player within room
x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height/2, room_height-sprite_height/2);
