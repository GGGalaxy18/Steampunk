// Checks whether the player can dash in a direction
// Returns the distance in that direction or 0
function check_dash_obstacle(_dash_distance, _d_speed, dir) {
	if _dash_distance < _d_speed return 0;
	var _x = lengthdir_x(_dash_distance, dir);
	var _y = lengthdir_y(_dash_distance, dir);
	with (obj_boundary_collision) {
		if (check_walkable(x + _x, y + _y)) {	// TODO: Check sprite width for collision too
			return _dash_distance;
		} else { return check_dash_obstacle(_dash_distance - _d_speed, _d_speed, dir); }
	}
}

function new_dash_time(_dash_distance) {
	return _dash_distance/dash_speed;
}