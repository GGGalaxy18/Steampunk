/// @description Render game
var _tile_data, _room_x, _room_y, _tile_index, _tile_z;

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		_tile_data = global.the_map[# tX, tY];
		_room_x = tile_to_room_x(tX, tY);
		_room_y = tile_to_room_y(tX, tY);
		
		_tile_index = _tile_data[TILE.SPRITE];
		_tile_z = _tile_data[TILE.Z];
		
		if (room_to_tile_x(mouse_x, mouse_y) == tX) and ((room_to_tile_y(mouse_x, mouse_y) == tY)) {
			_tile_z += 2;
		}
		
		if (_tile_index != 0) draw_sprite(spr_isoGroundTemp, _tile_index-1, _room_x, _room_y + _tile_z);
	}
}