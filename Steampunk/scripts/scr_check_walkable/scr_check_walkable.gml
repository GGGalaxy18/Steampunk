function check_walkable(_x, _y) {
	var _tX = room_to_tile_x(_x, _y);
	var _tY = room_to_tile_y(_x, _y);
	// Check if future tile exists
	if not (0 <_tX and _tX < MAP_W) or not (0 < _tY and _tY < MAP_H) { return false; }
	var _tile_data = global.the_map[# _tX, _tY];
	var _tile_index = _tile_data[TILE.SPRITE];
	
	return array_contains([1, 2], _tile_index);
}

function set_player_z() {
	var _tX = room_to_tile_x(x, y);
	var _tY = room_to_tile_y(x, y);
	var _tile_data = global.the_map[# _tX, _tY];
	other.z_offset = _tile_data[TILE.Z];
}