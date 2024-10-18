/// @description exit level
if (instance_exists(obj_enemy)) {
	if (not instance_exists(obj_dialogue_exit)) {
		instance_create_layer(x, y, "Instances", obj_dialogue_exit);
	}
} else {
	room_goto_next();
}