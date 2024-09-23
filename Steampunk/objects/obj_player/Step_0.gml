/// @description movement and dash implementation
// Input definitions
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
dash = keyboard_check(vk_space);
attack = mouse_check_button(mb_left);
// Ensures movement in 8 directions at a set speed (diagonal is not faster)
xdir = right - left;
ydir = down - up;

switch (state) {
	case PLAYERSTATE.FREE: scr_player_state_free(); break;
	case PLAYERSTATE.ATTACK_SLASH: scr_player_state_attack_slash(); break;
	case PLAYERSTATE.ATTACK_SHOOT: scr_player_state_attack_shoot(); break;
	case PLAYERSTATE.ATTACK_DASH: scr_player_state_attack_dash(); break;
	case PLAYERSTATE.DASH: scr_player_state_dash(); break;
}

if move_lock {
	if (array_length(dash_queue) == 0) {
		direction = point_direction(0, 0, xdir, ydir);	// Sets direction of queued dash
	}
} else {
	
}

// Keeps player within room
x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height/2, room_height-sprite_height/2);
