/// @description movement implementation
direction = point_direction(x, y, obj_player.x, obj_player.y)

if (check_walkable(x + lengthdir_x(4, direction), y + lengthdir_y(4, direction))) {
	speed = move_speed;
} else { speed = 0; }