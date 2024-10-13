/// @description 
if (not showing_dialog) {
	if (count() <= 0) {
		instance_destroy();
		return;
	}
	
	current_dialog = pop();
	showing_dialog = true;
	can_proceed = false;
	alarm[0] = text_wait;
} else {
	if (can_proceed and keyboard_check_released(key_next)) {
		showing_dialog = false;
		alpha = 0;
	}
}