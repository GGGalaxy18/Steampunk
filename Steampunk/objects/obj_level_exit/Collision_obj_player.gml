/// @description exit level
if (instance_exists(obj_enemy)) {
	if (not instance_exists(obj_dialogue_exit) and can_show_dialog) {
		instance_create_layer(x, y, "Instances", obj_dialogue_exit);
		can_show_dialog = false;
		alarm[0] = 60;
	}
} else {
	room_goto_next();
}