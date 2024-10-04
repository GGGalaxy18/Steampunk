/// @description spawn enemies
if (can_spawn and num_spawned < spawn_number) {
	var _spawn_loc = instance_find(obj_spawn_location, irandom(instance_number(obj_spawn_location) - 1));
	var _xpos;
	var _ypos;
	do {
		_xpos = random_range(_spawn_loc.x - _spawn_loc.spawn_radius, _spawn_loc.x + _spawn_loc.spawn_radius);
		_ypos = random_range(_spawn_loc.y - _spawn_loc.spawn_radius, _spawn_loc.y + _spawn_loc.spawn_radius);
	}
	until (check_walkable(_xpos, _ypos));
	num_spawned++;
	can_spawn = false;
	alarm[0] = spawn_rate;
	instance_create_layer(_xpos, _ypos, "Instances", enemy);
}