/// @description movement and dash implementation
// Input definitions
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
dash = keyboard_check_pressed(vk_space);
melee_attack = mouse_check_button_pressed(mb_left);
ranged_attack = mouse_check_button_pressed(mb_right);
reload = keyboard_check_pressed(ord("R"));
// Ensures movement in 8 directions at a set speed (diagonal is not faster)
xdir = right - left;
ydir = down - up;

// Makes player move with environment sprites
//sprite_set_offset(sprite_index, sprite_get_height(sprite_index)/2, sprite_get_height(sprite_index)/2 - z_offset);

// State Machine
switch (state) {
	case PLAYERSTATE.FREE: scr_player_state_free(); break;
	case PLAYERSTATE.ATTACK_SLASH: scr_player_state_attack_slash(); break;
	case PLAYERSTATE.ATTACK_SHOOT: scr_player_state_attack_shoot(); break;
	case PLAYERSTATE.ATTACK_DASH: scr_player_state_attack_dash(); break;
	case PLAYERSTATE.DASH: scr_player_state_dash(); break;
	case PLAYERSTATE.RELOAD: scr_player_state_reload(); break;
}

// Have camera follow player
camera_set_view_pos(view_camera[0], x-camera_get_view_width(view_camera[0])/2, y-camera_get_view_height(view_camera[0])/2);