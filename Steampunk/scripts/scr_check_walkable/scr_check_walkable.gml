function check_walkable(_x, _y) {
	var _tX = room_to_tile_x(_x, _y);
	var _tY = room_to_tile_y(_x, _y);
	var _tile_data = global.the_map[# _tX, _tY];
	var _tile_index = _tile_data[TILE.SPRITE];
	
	return _tile_index == 1;
}